part of 'payment_bloc.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class PaymentInitial extends PaymentState {}

/// Payment method selected
class PaymentMethodSelected extends PaymentState {
  final PaymentMethod method;

  const PaymentMethodSelected(this.method);

  @override
  List<Object?> get props => [method];
}

/// Payment is being created
class PaymentCreating extends PaymentState {}

/// Payment is ready with checkout URL
class PaymentReady extends PaymentState {
  final String checkoutUrl;
  final String externalId;
  final String paymentId;
  final PaymentMethod method;

  const PaymentReady({
    required this.checkoutUrl,
    required this.externalId,
    required this.paymentId,
    required this.method,
  });

  @override
  List<Object?> get props => [checkoutUrl, externalId, paymentId, method];
}

/// Checking payment status
class PaymentStatusChecking extends PaymentState {
  final String externalId;

  const PaymentStatusChecking(this.externalId);

  @override
  List<Object?> get props => [externalId];
}

/// Payment is pending (not yet completed)
class PaymentPending extends PaymentState {
  final String externalId;
  final String message;

  const PaymentPending({required this.externalId, required this.message});

  @override
  List<Object?> get props => [externalId, message];
}

/// Payment completed successfully
class PaymentSuccess extends PaymentState {
  final String externalId;
  final String message;

  const PaymentSuccess({required this.externalId, required this.message});

  @override
  List<Object?> get props => [externalId, message];
}

/// Payment failed
class PaymentFailure extends PaymentState {
  final String message;

  const PaymentFailure(this.message);

  @override
  List<Object?> get props => [message];
}

/// Card payment requires 3DS authentication
class PaymentRequires3DS extends PaymentState {
  final String threeDsUrl;
  final String externalId;
  final String paymentId;

  const PaymentRequires3DS({
    required this.threeDsUrl,
    required this.externalId,
    required this.paymentId,
  });

  @override
  List<Object?> get props => [threeDsUrl, externalId, paymentId];
}

/// Card payment completed without 3DS (rare case)
class CardPaymentCompleted extends PaymentState {
  final String externalId;
  final String paymentId;
  final String status;

  const CardPaymentCompleted({
    required this.externalId,
    required this.paymentId,
    required this.status,
  });

  @override
  List<Object?> get props => [externalId, paymentId, status];
}

/// QR Code payment ready - display QR for user to scan
class QrPaymentReady extends PaymentState {
  final String qrString;
  final String externalId;
  final String paymentId;

  const QrPaymentReady({
    required this.qrString,
    required this.externalId,
    required this.paymentId,
  });

  @override
  List<Object?> get props => [qrString, externalId, paymentId];
}
