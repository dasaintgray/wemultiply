import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wm_client/wm_client.dart';
import 'package:wm_flutter/core/repositories/payment_repository.dart';
import 'package:wm_flutter/core/spc_core.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PaymentRepository _repository;
  final Client _client = SpcCore.client;

  PaymentBloc({PaymentRepository? repository})
    : _repository = repository ?? PaymentRepository(),
      super(PaymentInitial()) {
    on<CreatePaymentRequest>(_onCreatePayment);
    on<CreateCardPaymentRequest>(_onCreateCardPayment);
    on<CheckPaymentStatus>(_onCheckPaymentStatus);
    on<ResetPayment>(_onResetPayment);
    on<SelectPaymentMethod>(_onSelectPaymentMethod);
    on<CompletePaymentAndClearCart>(_onCompletePaymentAndClearCart);
  }

  Future<void> _onCreatePayment(
    CreatePaymentRequest event,
    Emitter<PaymentState> emit,
  ) async {
    emit(PaymentCreating());

    try {
      final result = await _repository.createPayment(
        orderId: event.orderId,
        amount: event.amount,
        method: event.method,
        email: event.email,
      );

      if (result.success) {
        // Handle QR payments separately
        if (event.method == PaymentMethod.qrph && result.qrString != null) {
          emit(
            QrPaymentReady(
              qrString: result.qrString!,
              externalId: result.externalId ?? '',
              paymentId: result.paymentId ?? '',
            ),
          );
        } else {
          final checkoutUrl = result.checkoutUrl ?? result.invoiceUrl;
          if (checkoutUrl != null) {
            emit(
              PaymentReady(
                checkoutUrl: checkoutUrl,
                externalId: result.externalId ?? '',
                paymentId: result.paymentId ?? '',
                method: event.method,
              ),
            );
          } else {
            emit(const PaymentFailure('No checkout URL received'));
          }
        }
      } else {
        emit(PaymentFailure(result.error ?? 'Payment creation failed'));
      }
    } catch (e) {
      emit(PaymentFailure(e.toString()));
    }
  }

  Future<void> _onCreateCardPayment(
    CreateCardPaymentRequest event,
    Emitter<PaymentState> emit,
  ) async {
    emit(PaymentCreating());

    try {
      final result = await _repository.createCardPayment(
        orderId: event.orderId,
        amount: event.amount,
        currency: event.currency,
        cardNumber: event.cardNumber,
        expiryMonth: event.expiryMonth,
        expiryYear: event.expiryYear,
        cvn: event.cvn,
        cardholderFirstName: event.cardholderFirstName,
        cardholderLastName: event.cardholderLastName,
        cardholderEmail: event.cardholderEmail,
        cardholderPhone: event.cardholderPhone,
        description: event.description,
        preAuthorize: event.preAuthorize,
      );

      if (result.success) {
        // Check if 3DS is required (has checkout URL)
        if (result.checkoutUrl != null) {
          emit(
            PaymentRequires3DS(
              threeDsUrl: result.checkoutUrl!,
              externalId: result.externalId ?? '',
              paymentId: result.paymentId ?? '',
            ),
          );
        } else {
          // Payment completed without 3DS (skip_three_ds was true or card doesn't require it)
          emit(
            CardPaymentCompleted(
              externalId: result.externalId ?? '',
              paymentId: result.paymentId ?? '',
              status: 'SUCCEEDED',
            ),
          );
        }
      } else {
        emit(PaymentFailure(result.error ?? 'Card payment creation failed'));
      }
    } catch (e) {
      emit(PaymentFailure(e.toString()));
    }
  }

  Future<void> _onCheckPaymentStatus(
    CheckPaymentStatus event,
    Emitter<PaymentState> emit,
  ) async {
    emit(PaymentStatusChecking(event.externalId));

    try {
      final isCompleted = await _repository.isPaymentCompleted(
        event.externalId,
      );

      if (isCompleted) {
        // Clear cart and mark order as paid if we have the user and order info
        // ignore: avoid_print
        print('=== Payment completed! userId: ${event.userId}, orderId: ${event.orderId} ===');
        if (event.userId != null && event.orderId != null) {
          try {
            // ignore: avoid_print
            print('Calling markOrderPaidAndClearCart...');
            final result = await _client.cart.markOrderPaidAndClearCart(
              userId: event.userId!,
              orderId: event.orderId!,
            );
            // ignore: avoid_print
            print('markOrderPaidAndClearCart result: $result');
          } catch (e) {
            // Log error but don't fail - payment was successful
            // ignore: avoid_print
            print('Failed to clear cart: $e');
          }
        } else {
          // ignore: avoid_print
          print('WARNING: userId or orderId is null, cannot clear cart!');
        }

        emit(
          PaymentSuccess(
            externalId: event.externalId,
            message: 'Payment completed successfully! Your order has been placed.',
          ),
        );
      } else {
        emit(
          PaymentPending(
            externalId: event.externalId,
            message: 'Payment is still pending',
          ),
        );
      }
    } catch (e) {
      emit(PaymentFailure(e.toString()));
    }
  }

  void _onResetPayment(ResetPayment event, Emitter<PaymentState> emit) {
    emit(PaymentInitial());
  }

  void _onSelectPaymentMethod(
    SelectPaymentMethod event,
    Emitter<PaymentState> emit,
  ) {
    emit(PaymentMethodSelected(event.method));
  }

  Future<void> _onCompletePaymentAndClearCart(
    CompletePaymentAndClearCart event,
    Emitter<PaymentState> emit,
  ) async {
    try {
      // Mark order as paid and clear the cart on the server
      await _client.cart.markOrderPaidAndClearCart(
        userId: event.userId,
        orderId: event.orderId,
      );

      emit(
        PaymentSuccess(
          externalId: event.externalId,
          message: 'Payment completed successfully! Your order has been placed.',
        ),
      );
    } catch (e) {
      // Still emit success even if cart clearing fails
      // The payment was successful, just log the error
      emit(
        PaymentSuccess(
          externalId: event.externalId,
          message: 'Payment completed successfully!',
        ),
      );
    }
  }
}
