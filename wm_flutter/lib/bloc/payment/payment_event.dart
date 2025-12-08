part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object?> get props => [];
}

/// Event to create a new payment request
class CreatePaymentRequest extends PaymentEvent {
  final String orderId;
  final double amount;
  final PaymentMethod method;
  final String? email;

  const CreatePaymentRequest({
    required this.orderId,
    required this.amount,
    required this.method,
    this.email,
  });

  @override
  List<Object?> get props => [orderId, amount, method, email];
}

/// Event to check payment status
///
class CheckPaymentStatus extends PaymentEvent {
  final String externalId;

  const CheckPaymentStatus(this.externalId);

  @override
  List<Object?> get props => [externalId];
}

/// Event to reset payment state
class ResetPayment extends PaymentEvent {
  const ResetPayment();
}

/// Event to select a payment method
class SelectPaymentMethod extends PaymentEvent {
  final PaymentMethod method;

  const SelectPaymentMethod(this.method);

  @override
  List<Object?> get props => [method];
}

/// Event to create a direct card payment with 3DS
class CreateCardPaymentRequest extends PaymentEvent {
  final String orderId;
  final double amount;
  final String currency;
  final String cardNumber;
  final String expiryMonth;
  final String expiryYear;
  final String cvn;
  final String cardholderFirstName;
  final String cardholderLastName;
  final String cardholderEmail;
  final String? cardholderPhone;
  final String? description;
  final bool preAuthorize;

  const CreateCardPaymentRequest({
    required this.orderId,
    required this.amount,
    required this.currency,
    required this.cardNumber,
    required this.expiryMonth,
    required this.expiryYear,
    required this.cvn,
    required this.cardholderFirstName,
    required this.cardholderLastName,
    required this.cardholderEmail,
    this.cardholderPhone,
    this.description,
    this.preAuthorize = false,
  });

  @override
  List<Object?> get props => [
    orderId,
    amount,
    currency,
    cardNumber,
    expiryMonth,
    expiryYear,
    cvn,
    cardholderFirstName,
    cardholderLastName,
    cardholderEmail,
    cardholderPhone,
    description,
    preAuthorize,
  ];
}
