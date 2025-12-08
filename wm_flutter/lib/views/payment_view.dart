import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:wm_flutter/bloc/payment/payment_bloc.dart';
import 'package:wm_flutter/core/extensions/core_extensions.dart';
import 'package:wm_flutter/core/repositories/payment_repository.dart';
import 'package:wm_flutter/core/styles/color_styles.dart';
import 'package:wm_flutter/views/payment_webview.dart';

class PaymentView extends StatefulWidget {
  final String orderId;
  final double amount;
  final String? description;

  const PaymentView({
    super.key,
    required this.orderId,
    required this.amount,
    this.description,
  });

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  PaymentMethod? _selectedMethod;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) => PaymentBloc(),
      child: Scaffold(
        backgroundColor: AppColors.lightBackground,
        appBar: AppBar(
          title: const Text('Payment'),
          centerTitle: true,
          backgroundColor: AppColors.darkGreen,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        body: BlocConsumer<PaymentBloc, PaymentState>(
          listener: _handlePaymentStateChanges,
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Order Summary
                  _buildOrderSummary(theme),

                  // Payment Methods
                  _buildPaymentMethodsSection(theme),

                  // Pay Button
                  _buildPayButton(context, state),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _handlePaymentStateChanges(BuildContext context, PaymentState state) {
    if (state is PaymentReady) {
      // Navigate to payment webview or launch URL
      _openPaymentUrl(context, state.checkoutUrl, state.externalId);
    } else if (state is PaymentFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.message),
          backgroundColor: AppColors.dangerColor,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else if (state is PaymentSuccess) {
      _showPaymentSuccessDialog(context, state);
    }
  }

  Widget _buildOrderSummary(ThemeData theme) {
    return Container(
      margin: EdgeInsets.all(4.w),
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
            'Order Summary',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildSummaryRow('Order ID', widget.orderId, theme),
          if (widget.description != null) ...[
            const SizedBox(height: 8),
            _buildSummaryRow('Description', widget.description!, theme),
          ],
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
                widget.amount.toStringAsFixed(2).perangPinoy,
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

  Widget _buildSummaryRow(String label, String value, ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: AppColors.primaryTextInfo,
          ),
        ),
        Flexible(
          child: Text(
            value,
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethodsSection(ThemeData theme) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Payment Method',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          // E-Wallets Section
          _buildPaymentCategory(
            theme,
            title: 'E-Wallets',
            icon: Icons.account_balance_wallet_outlined,
            methods: [
              PaymentMethod.gcash,
              PaymentMethod.maya,
              PaymentMethod.grabPay,
            ],
          ),
          const SizedBox(height: 12),
          // Other Methods Section
          _buildPaymentCategory(
            theme,
            title: 'Other Methods',
            icon: Icons.payment_outlined,
            methods: [PaymentMethod.invoice, PaymentMethod.card],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentCategory(
    ThemeData theme, {
    required String title,
    required IconData icon,
    required List<PaymentMethod> methods,
  }) {
    return Container(
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
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(icon, color: AppColors.darkGreen, size: 20),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryTextInfo,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          ...methods.map((method) => _buildPaymentMethodTile(theme, method)),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodTile(ThemeData theme, PaymentMethod method) {
    final isSelected = _selectedMethod == method;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedMethod = method;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryLight : Colors.transparent,
          border: Border(
            bottom: BorderSide(color: Colors.grey.withValues(alpha: 0.1)),
          ),
        ),
        child: Row(
          children: [
            _buildPaymentIcon(method),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    method.displayName,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    method.description,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.primaryTextInfo,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.darkGreen : Colors.grey,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.darkGreen,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentIcon(PaymentMethod method) {
    IconData icon;
    Color color;

    switch (method) {
      case PaymentMethod.gcash:
        icon = Icons.account_balance_wallet;
        color = const Color(0xFF007DFE); // GCash blue
        break;
      case PaymentMethod.maya:
        icon = Icons.account_balance_wallet;
        color = const Color(0xFF00B140); // Maya green
        break;
      case PaymentMethod.grabPay:
        icon = Icons.account_balance_wallet;
        color = const Color(0xFF00B14F); // Grab green
        break;
      case PaymentMethod.invoice:
        icon = Icons.receipt_long;
        color = AppColors.darkBlue;
        break;
      case PaymentMethod.card:
        icon = Icons.credit_card;
        color = AppColors.lightBlue;
        break;
    }

    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: color, size: 24),
    );
  }

  Widget _buildPayButton(BuildContext context, PaymentState state) {
    final isLoading = state is PaymentCreating;

    return Container(
      margin: EdgeInsets.all(4.w),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _selectedMethod == null || isLoading
            ? null
            : () => _processPayment(context),
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
                _selectedMethod == null
                    ? 'Select a Payment Method'
                    : 'Pay ${widget.amount.toStringAsFixed(2).perangPinoy}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }

  void _processPayment(BuildContext context) {
    if (_selectedMethod == null) return;

    context.read<PaymentBloc>().add(
      CreatePaymentRequest(
        orderId: widget.orderId,
        amount: widget.amount,
        method: _selectedMethod!,
      ),
    );
  }

  Future<void> _openPaymentUrl(
    BuildContext context,
    String url,
    String externalId,
  ) async {
    // Try to open in WebView first, fallback to external browser
    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => PaymentWebView(
          url: url,
          externalId: externalId,
          title: _selectedMethod?.displayName ?? 'Payment',
        ),
      ),
    );

    if (result == true && context.mounted) {
      // Payment was successful
      context.read<PaymentBloc>().add(CheckPaymentStatus(externalId));
    } else if (context.mounted) {
      // User cancelled or payment failed - check status anyway
      context.read<PaymentBloc>().add(CheckPaymentStatus(externalId));
    }
  }

  // Future<void> _launchExternalUrl(String url) async {
  //   final uri = Uri.parse(url);
  //   if (await canLaunchUrl(uri)) {
  //     await launchUrl(uri, mode: LaunchMode.externalApplication);
  //   }
  // }

  void _showPaymentSuccessDialog(BuildContext context, PaymentSuccess state) {
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
                  Navigator.pop(context); // Close dialog
                  Navigator.pop(
                    context,
                    true,
                  ); // Return to previous screen with success
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
