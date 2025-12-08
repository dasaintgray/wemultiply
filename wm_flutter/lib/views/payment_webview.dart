import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wm_flutter/core/styles/color_styles.dart';

class PaymentWebView extends StatefulWidget {
  final String url;
  final String externalId;
  final String title;

  const PaymentWebView({
    super.key,
    required this.url,
    required this.externalId,
    this.title = 'Payment',
  });

  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  late final WebViewController _controller;
  bool _isLoading = true;
  int _loadingProgress = 0;

  // Success/failure URL patterns to detect payment completion
  static const _successPatterns = [
    'success',
    'payment/success',
    'payment-success',
    'thank-you',
    'thankyou',
    'completed',
  ];

  static const _failurePatterns = [
    'fail',
    'failure',
    'payment/fail',
    'payment-failed',
    'error',
    'cancelled',
    'canceled',
  ];

  @override
  void initState() {
    super.initState();
    _initWebView();
  }

  void _initWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              _loadingProgress = progress;
              _isLoading = progress < 100;
            });
          },
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
            _checkUrlForCompletion(url);
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('WebView error: ${error.description}');
          },
          onNavigationRequest: (NavigationRequest request) {
            final url = request.url.toLowerCase();

            // Check if the URL indicates success or failure
            _checkUrlForCompletion(url);

            // Handle deep links (e.g., app://payment/success)
            if (url.startsWith('yourapp://') ||
                url.startsWith('wemultiply://')) {
              _handleDeepLink(url);
              return NavigationDecision.prevent;
            }

            // Allow all other navigation
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  void _checkUrlForCompletion(String url) {
    final lowerUrl = url.toLowerCase();

    // Check for success patterns
    for (final pattern in _successPatterns) {
      if (lowerUrl.contains(pattern)) {
        _handlePaymentSuccess();
        return;
      }
    }

    // Check for failure patterns
    for (final pattern in _failurePatterns) {
      if (lowerUrl.contains(pattern)) {
        _handlePaymentFailure();
        return;
      }
    }
  }

  void _handleDeepLink(String url) {
    if (url.contains('success')) {
      _handlePaymentSuccess();
    } else if (url.contains('fail') || url.contains('error')) {
      _handlePaymentFailure();
    }
  }

  void _handlePaymentSuccess() {
    Navigator.pop(context, true);
  }

  void _handlePaymentFailure() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Payment Failed'),
        content: const Text(
          'Your payment could not be completed. Please try again.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context, false); // Return to payment screen
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: AppColors.darkGreen,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: _showCancelDialog,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => _controller.reload(),
          ),
          IconButton(
            icon: const Icon(Icons.open_in_browser),
            onPressed: _openInExternalBrowser,
          ),
        ],
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            Column(
              children: [
                LinearProgressIndicator(
                  value: _loadingProgress / 100,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.darkGreen,
                  ),
                ),
              ],
            ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: _showCancelDialog,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  side: const BorderSide(color: AppColors.dangerColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Cancel Payment',
                  style: TextStyle(color: AppColors.dangerColor),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: _checkPaymentStatus,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkGreen,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("I've Paid"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCancelDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel Payment?'),
        content: const Text(
          'Are you sure you want to cancel this payment? Your transaction will not be completed.',
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Continue Payment'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context, false); // Return to payment screen
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.dangerColor,
            ),
            child: const Text('Cancel', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _checkPaymentStatus() {
    // User clicked "I've Paid" - return to check status
    Navigator.pop(context, true);
  }

  Future<void> _openInExternalBrowser() async {
    final uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
