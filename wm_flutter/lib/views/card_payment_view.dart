import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wm_flutter/bloc/payment/payment_bloc.dart';
import 'package:wm_flutter/core/extensions/core_extensions.dart';
import 'package:wm_flutter/core/styles/color_styles.dart';
import 'package:wm_flutter/views/payment_webview.dart';

class CardPaymentView extends StatefulWidget {
  final String orderId;
  final double amount;
  final String currency;
  final String? description;
  final bool preAuthorize;

  const CardPaymentView({
    super.key,
    required this.orderId,
    required this.amount,
    this.currency = 'PHP',
    this.description,
    this.preAuthorize = false,
  });

  @override
  State<CardPaymentView> createState() => _CardPaymentViewState();
}

class _CardPaymentViewState extends State<CardPaymentView> {
  final _formKey = GlobalKey<FormState>();

  final _cardNumberController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvnController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvnController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) => PaymentBloc(),
      child: Scaffold(
        backgroundColor: AppColors.lightBackground,
        appBar: AppBar(
          title: const Text('Card Payment'),
          centerTitle: true,
          backgroundColor: AppColors.darkGreen,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        body: BlocConsumer<PaymentBloc, PaymentState>(
          listener: _handlePaymentStateChanges,
          builder: (context, state) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(4.w),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildOrderSummary(theme),
                    SizedBox(height: 3.h),
                    _buildCardDetailsSection(theme),
                    SizedBox(height: 3.h),
                    _buildCardholderSection(theme),
                    SizedBox(height: 3.h),
                    _buildPayButton(context, state),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _handlePaymentStateChanges(BuildContext context, PaymentState state) {
    if (state is PaymentRequires3DS) {
      _open3DSAuthentication(context, state.threeDsUrl, state.paymentId);
    } else if (state is CardPaymentCompleted) {
      _showPaymentSuccessDialog(context, state);
    } else if (state is PaymentFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.message),
          backgroundColor: AppColors.dangerColor,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else if (state is PaymentSuccess) {
      _showPaymentSuccessDialogGeneric(context, state);
    }
  }

  Widget _buildOrderSummary(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.lightBlue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.credit_card,
                  color: AppColors.lightBlue,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Card Payment',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order ID',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.primaryTextInfo,
                ),
              ),
              Text(widget.orderId, style: theme.textTheme.bodyMedium),
            ],
          ),
          const Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Amount',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.currency == 'PHP'
                    ? widget.amount.toStringAsFixed(2).perangPinoy
                    : '${widget.currency} ${widget.amount.toStringAsFixed(2)}',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGreen,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardDetailsSection(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Card Details',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _cardNumberController,
            decoration: _buildInputDecoration('Card Number', Icons.credit_card),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(16),
              _CardNumberFormatter(),
            ],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter card number';
              }
              final digitsOnly = value.replaceAll(' ', '');
              if (digitsOnly.length < 13 || digitsOnly.length > 16) {
                return 'Invalid card number';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _expiryController,
                  decoration: _buildInputDecoration(
                    'MM/YY',
                    Icons.calendar_today,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
                    _ExpiryDateFormatter(),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    if (!value.contains('/') || value.length != 5) {
                      return 'Invalid format';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  controller: _cvnController,
                  decoration: _buildInputDecoration('CVV', Icons.lock),
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    if (value.length < 3) {
                      return 'Invalid CVV';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardholderSection(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cardholder Information',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _firstNameController,
                  decoration: _buildInputDecoration('First Name', Icons.person),
                  textCapitalization: TextCapitalization.words,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  controller: _lastNameController,
                  decoration: _buildInputDecoration('Last Name', Icons.person),
                  textCapitalization: TextCapitalization.words,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _emailController,
            decoration: _buildInputDecoration('Email', Icons.email),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter email';
              }
              if (!RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              ).hasMatch(value)) {
                return 'Invalid email format';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _phoneController,
            decoration: _buildInputDecoration('Phone (optional)', Icons.phone),
            keyboardType: TextInputType.phone,
          ),
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: AppColors.primaryTextInfo),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.darkGreen, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.dangerColor),
      ),
      filled: true,
      fillColor: Colors.grey.shade50,
    );
  }

  Widget _buildPayButton(BuildContext context, PaymentState state) {
    final isLoading = state is PaymentCreating;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : () => _processPayment(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkGreen,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          disabledBackgroundColor: Colors.grey.shade300,
        ),
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                'Pay ${widget.currency == 'PHP' ? widget.amount.toStringAsFixed(2).perangPinoy : '${widget.currency} ${widget.amount.toStringAsFixed(2)}'}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }

  void _processPayment(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    // Parse expiry date
    final expiryParts = _expiryController.text.split('/');
    final expiryMonth = expiryParts[0];
    final expiryYear = '20${expiryParts[1]}';

    // Get card number without spaces
    final cardNumber = _cardNumberController.text.replaceAll(' ', '');

    context.read<PaymentBloc>().add(
      CreateCardPaymentRequest(
        orderId: widget.orderId,
        amount: widget.amount,
        currency: widget.currency,
        cardNumber: cardNumber,
        expiryMonth: expiryMonth,
        expiryYear: expiryYear,
        cvn: _cvnController.text,
        cardholderFirstName: _firstNameController.text,
        cardholderLastName: _lastNameController.text,
        cardholderEmail: _emailController.text,
        cardholderPhone: _phoneController.text.isNotEmpty
            ? _phoneController.text
            : null,
        description: widget.description,
        preAuthorize: widget.preAuthorize,
      ),
    );
  }

  Future<void> _open3DSAuthentication(
    BuildContext context,
    String threeDsUrl,
    String paymentId,
  ) async {
    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => PaymentWebView(
          url: threeDsUrl,
          externalId: paymentId,
          title: '3D Secure Authentication',
        ),
      ),
    );

    if (result == true && context.mounted) {
      context.read<PaymentBloc>().add(CheckPaymentStatus(paymentId));
    } else if (context.mounted) {
      context.read<PaymentBloc>().add(CheckPaymentStatus(paymentId));
    }
  }

  void _showPaymentSuccessDialog(
    BuildContext context,
    CardPaymentCompleted state,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.lightGreen.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle,
                color: AppColors.darkGreen,
                size: 50,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Payment Successful!',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Your card payment has been processed successfully.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.primaryTextInfo,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkGreen,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Done'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPaymentSuccessDialogGeneric(
    BuildContext context,
    PaymentSuccess state,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.lightGreen.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle,
                color: AppColors.darkGreen,
                size: 50,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Payment Successful!',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              state.message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.primaryTextInfo,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkGreen,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Done'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Formats card number with spaces every 4 digits
class _CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(' ', '');
    final buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      if ((i + 1) % 4 == 0 && i != text.length - 1) {
        buffer.write(' ');
      }
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}

/// Formats expiry date as MM/YY
class _ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll('/', '');
    final buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      if (i == 1 && text.length > 2) {
        buffer.write('/');
      }
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}
