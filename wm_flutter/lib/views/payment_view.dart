import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wm_flutter/bloc/cart/cart_bloc.dart';
import 'package:wm_flutter/bloc/payment/payment_bloc.dart';
import 'package:wm_flutter/core/extensions/core_extensions.dart';
import 'package:wm_flutter/core/repositories/payment_repository.dart';
import 'package:wm_flutter/core/spc_core.dart';
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
  PaymentCategory? _expandedCategory;

  // Group payment methods by category
  Map<PaymentCategory, List<PaymentMethod>> get _groupedMethods {
    final grouped = <PaymentCategory, List<PaymentMethod>>{};
    for (final method in PaymentMethod.values) {
      grouped.putIfAbsent(method.category, () => []).add(method);
    }
    return grouped;
  }

  @override
  Widget build(BuildContext context) {
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
                  _buildOrderSummaryCard(),
                  SizedBox(height: 2.h),
                  _buildPaymentMethodsSection(),
                  SizedBox(height: 2.h),
                  _buildPayButton(context, state),
                  SizedBox(height: 2.h),
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
      _openPaymentUrl(context, state.checkoutUrl, state.externalId);
    } else if (state is QrPaymentReady) {
      _showQrPaymentDialog(context, state);
    } else if (state is PaymentFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.message),
          backgroundColor: AppColors.dangerColor,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    } else if (state is PaymentSuccess) {
      _showPaymentSuccessDialog(context, state);
    }
  }

  Widget _buildOrderSummaryCard() {
    return Container(
      margin: EdgeInsets.all(4.w),
      padding: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.darkGreen, AppColors.lightGreen],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkGreen.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Summary',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.5.h),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '#${widget.orderId}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          if (widget.description != null) ...[
            SizedBox(height: 1.h),
            Text(
              widget.description!,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.9),
                fontSize: 13.sp,
              ),
            ),
          ],
          SizedBox(height: 2.h),
          Divider(color: Colors.white.withValues(alpha: 0.3)),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Amount',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontSize: 14.sp,
                ),
              ),
              Text(
                widget.amount.toStringAsFixed(2).perangPinoy,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodsSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Payment Method',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryTextTitle,
            ),
          ),
          SizedBox(height: 1.5.h),
          ..._groupedMethods.entries.map((entry) {
            return _buildPaymentCategoryCard(entry.key, entry.value);
          }),
        ],
      ),
    );
  }

  Widget _buildPaymentCategoryCard(PaymentCategory category, List<PaymentMethod> methods) {
    final isExpanded = _expandedCategory == category;
    final hasSelectedMethod = methods.contains(_selectedMethod);

    return Container(
      margin: EdgeInsets.only(bottom: 1.5.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: hasSelectedMethod
            ? Border.all(color: AppColors.darkGreen, width: 2)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Category Header
          InkWell(
            onTap: () {
              setState(() {
                _expandedCategory = isExpanded ? null : category;
              });
            },
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: EdgeInsets.all(4.w),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: _getCategoryColor(category).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      _getCategoryIcon(category),
                      color: _getCategoryColor(category),
                      size: 20,
                    ),
                  ),
                  SizedBox(width: 3.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category.displayName,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryTextTitle,
                          ),
                        ),
                        Text(
                          '${methods.length} option${methods.length > 1 ? 's' : ''} available',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.primaryTextInfo,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: AppColors.primaryTextInfo,
                  ),
                ],
              ),
            ),
          ),
          // Methods List
          if (isExpanded) ...[
            Divider(height: 1, color: AppColors.primaryTextInfo.withValues(alpha: 0.1)),
            ...methods.map((method) => _buildPaymentMethodTile(method)),
          ],
        ],
      ),
    );
  }

  Widget _buildPaymentMethodTile(PaymentMethod method) {
    final isSelected = _selectedMethod == method;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedMethod = method;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryLight : Colors.transparent,
          border: Border(
            bottom: BorderSide(
              color: AppColors.primaryTextInfo.withValues(alpha: 0.1),
            ),
          ),
        ),
        child: Row(
          children: [
            _buildPaymentIcon(method),
            SizedBox(width: 3.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    method.displayName,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryTextTitle,
                    ),
                  ),
                  SizedBox(height: 0.3.h),
                  Text(
                    method.description,
                    style: TextStyle(
                      fontSize: 12.sp,
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
                  color: isSelected ? AppColors.darkGreen : AppColors.primaryTextInfo,
                  width: 2,
                ),
                color: isSelected ? AppColors.darkGreen : Colors.transparent,
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 14, color: Colors.white)
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
        color = const Color(0xFF007DFE);
      case PaymentMethod.maya:
        icon = Icons.account_balance_wallet;
        color = const Color(0xFF00B140);
      case PaymentMethod.grabPay:
        icon = Icons.account_balance_wallet;
        color = const Color(0xFF00B14F);
      case PaymentMethod.shopeePay:
        icon = Icons.account_balance_wallet;
        color = const Color(0xFFEE4D2D);
      case PaymentMethod.qrph:
        icon = Icons.qr_code_2;
        color = AppColors.darkBlue;
      case PaymentMethod.card:
        icon = Icons.credit_card;
        color = AppColors.lightBlue;
      case PaymentMethod.billease:
      case PaymentMethod.cashalo:
        icon = Icons.schedule;
        color = const Color(0xFF6B4EFF);
      case PaymentMethod.bpiDirectDebit:
      case PaymentMethod.ubpDirectDebit:
        icon = Icons.account_balance;
        color = const Color(0xFFAA0000);
      case PaymentMethod.invoice:
        icon = Icons.receipt_long;
        color = AppColors.darkGreen;
    }

    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: color, size: 24),
    );
  }

  IconData _getCategoryIcon(PaymentCategory category) {
    switch (category) {
      case PaymentCategory.ewallet:
        return Icons.account_balance_wallet_outlined;
      case PaymentCategory.qr:
        return Icons.qr_code_2;
      case PaymentCategory.card:
        return Icons.credit_card;
      case PaymentCategory.paylater:
        return Icons.schedule;
      case PaymentCategory.directDebit:
        return Icons.account_balance;
      case PaymentCategory.other:
        return Icons.more_horiz;
    }
  }

  Color _getCategoryColor(PaymentCategory category) {
    switch (category) {
      case PaymentCategory.ewallet:
        return const Color(0xFF007DFE);
      case PaymentCategory.qr:
        return AppColors.darkBlue;
      case PaymentCategory.card:
        return AppColors.lightBlue;
      case PaymentCategory.paylater:
        return const Color(0xFF6B4EFF);
      case PaymentCategory.directDebit:
        return const Color(0xFFAA0000);
      case PaymentCategory.other:
        return AppColors.darkGreen;
    }
  }

  Widget _buildPayButton(BuildContext context, PaymentState state) {
    final isLoading = state is PaymentCreating;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: ElevatedButton(
        onPressed: _selectedMethod == null || isLoading
            ? null
            : () => _processPayment(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkGreen,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 2.h),
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 3,
          disabledBackgroundColor: AppColors.primaryTextInfo.withValues(alpha: 0.3),
        ),
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _selectedMethod == null ? Icons.payment : Icons.lock_outline,
                    size: 20,
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    _selectedMethod == null
                        ? 'Select a Payment Method'
                        : 'Pay ${widget.amount.toStringAsFixed(2).perangPinoy}',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
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
    await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => PaymentWebView(
          url: url,
          externalId: externalId,
          title: _selectedMethod?.displayName ?? 'Payment',
        ),
      ),
    );

    if (context.mounted) {
      context.read<PaymentBloc>().add(
        CheckPaymentStatus(
          externalId,
          orderId: widget.orderId,
          userId: SpcCore.userId,
        ),
      );
    }
  }

  void _showQrPaymentDialog(BuildContext context, QrPaymentReady state) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) => Container(
        height: 70.h,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          children: [
            // Handle bar
            Container(
              margin: EdgeInsets.only(top: 1.5.h),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.primaryTextInfo.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            SizedBox(height: 2.h),
            // Title
            Text(
              'Scan QR Code to Pay',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.darkBlue,
              ),
            ),
            SizedBox(height: 1.h),
            Text(
              'Use any QR Ph enabled app',
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.primaryTextInfo,
              ),
            ),
            SizedBox(height: 3.h),
            // QR Code
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: PrettyQrView.data(
                data: state.qrString,
                decoration: const PrettyQrDecoration(
                  shape: PrettyQrSmoothSymbol(
                    color: AppColors.darkBlue,
                  ),
                ),
              ),
            ),
            SizedBox(height: 3.h),
            // Amount
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.5.h),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Amount: ',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.primaryTextInfo,
                    ),
                  ),
                  Text(
                    widget.amount.toStringAsFixed(2).perangPinoy,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkGreen,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Check Status Button
            Padding(
              padding: EdgeInsets.all(4.w),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(bottomSheetContext);
                  context.read<PaymentBloc>().add(
                    CheckPaymentStatus(
                      state.externalId,
                      orderId: widget.orderId,
                      userId: SpcCore.userId,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkGreen,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  "I've Completed Payment",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }

  void _showPaymentSuccessDialog(BuildContext context, PaymentSuccess state) {
    // Clear the cart in the CartBloc if available (both server and local)
    try {
      final userId = SpcCore.userId;
      if (userId != null) {
        context.read<CartBloc>().add(ClearCartAfterPayment(userId));
      } else {
        context.read<CartBloc>().add(ClearCart());
      }
    } catch (_) {
      // CartBloc might not be available in this context
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        contentPadding: EdgeInsets.all(6.w),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.lightGreen, AppColors.darkGreen],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_rounded,
                color: Colors.white,
                size: 50,
              ),
            ),
            SizedBox(height: 3.h),
            Text(
              'Payment Successful!',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.darkBlue,
              ),
            ),
            SizedBox(height: 1.h),
            Text(
              state.message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.primaryTextInfo,
              ),
            ),
            SizedBox(height: 3.h),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                Navigator.pop(context, true); // Return true to indicate successful payment
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkGreen,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 1.8.h, horizontal: 8.w),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                'Done',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
