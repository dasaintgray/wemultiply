import 'dart:convert';

import 'package:dotenv/dotenv.dart';
import 'package:http/http.dart' as http;

class XenditService {
  final _env = DotEnv()..load();

  String get _secreKey => _env['XENDIT_SECRET_KEY']!;
  String get _baseUrl => _env['XENDIT_BASE_URL'] ?? 'https://api.xendit.com';

  //eto ang gagamiting global header
  Map<String, String> _authHeaders({Map<String, String>? extraHeader}) {
    final basicHeader = base64Encode(utf8.encode('$_secreKey:'));

    return {
      'Authorization': 'Basic $basicHeader',
      'Content-Type': 'application/json',
      if (extraHeader != null) ...extraHeader
    };
  }

  Future<Map<String, dynamic>> createInvoice({
    required String externalId,
    required double amount,
    String? customerEmail,
    String? successRedirectUrl,
    String? failureRedirectUrl,
    Map<String, dynamic>? metadata,
  }) async {
    final url = Uri.parse("$_baseUrl/v2/invoices");

    final bodyData = {
      'external_id': externalId,
      'amount': amount,
      'description': "Payment for order# $externalId",
      if (customerEmail != null) 'payer_email': customerEmail,
      if (successRedirectUrl != null)
        'success_redirect_url': successRedirectUrl,
      if (failureRedirectUrl != null)
        'failure_redirect_url': failureRedirectUrl,
      if (metadata != null) 'metadata': metadata,
    };

    final response = await http.post(url,
        headers: _authHeaders(), body: jsonEncode(bodyData));
    if (response.statusCode >= 400) {
      throw Exception(
          'Xendit invoice error: ${response.statusCode} : ${response.body}');
    }

    //return
    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  // E-WALLET (Maya or Gcash)
  Future<Map<String, dynamic>> createEwalletCharge({
    required String referenceId,
    required double amount,
    required String channelCode,
    String? phone,
    String? successRedirectUrl,
    String? failureRedirectUrl,
    Map<String, dynamic>? metadata,
  }) async {
    final url = Uri.parse('$_baseUrl/ewallets/charges');
    final body = {
      'reference_id': referenceId,
      'amount': amount,
      'currency': 'PHP',
      'checkout_method': 'ONE_TIME_PAYMENT',
      'channel_code': channelCode,
      if (phone != null) 'mobile_number': phone,
      'channel_properties': {
        if (successRedirectUrl != null)
          'success_redirect_url': successRedirectUrl,
        if (failureRedirectUrl != null)
          'failure_redirect_url': failureRedirectUrl,
      },
      if (metadata != null) 'metadata': metadata,
    };
    final res =
        await http.post(url, headers: _authHeaders(), body: jsonEncode(body));
    if (res.statusCode >= 400) {
      throw Exception('Xendit ewallet error ${res.statusCode}: ${res.body}');
    }
    return jsonDecode(res.body) as Map<String, dynamic>;
  }

  // ---------- Cards (tokenize & charge using Payment Requests or Tokens) ----------
  Future<Map<String, dynamic>> createCardToken({
    required String cardNumber,
    required String cardExpMonth,
    required String cardExpYear,
    required String cardCvv,
    String? cardHolderName,
  }) async {
    // Xendit usually recommends using their frontend SDK to tokenize cards,
    // but if you need server-side, use /tokens or Payments API if available.
    final url =
        Uri.parse('$_baseUrl/payment_tokens'); // adjust if Payment API present
    final body = {
      'type': 'card',
      'token_parameters': {
        'card_number': cardNumber,
        'card_exp_month': cardExpMonth,
        'card_exp_year': cardExpYear,
        'card_cvn': cardCvv,
        if (cardHolderName != null) 'card_holder_name': cardHolderName,
      },
    };
    final res =
        await http.post(url, headers: _authHeaders(), body: jsonEncode(body));
    if (res.statusCode >= 400) {
      throw Exception('Xendit card token error ${res.statusCode}: ${res.body}');
    }
    return jsonDecode(res.body) as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> chargeCard({
    required String tokenId,
    required num amount,
    required String externalId,
    String? capture = 'true',
  }) async {
    final url = Uri.parse(
        '$_baseUrl/credit_card_charges'); // adjust per current endpoint
    final body = {
      'token_id': tokenId,
      'external_id': externalId,
      'amount': amount,
      'capture': capture == 'true',
    };
    final res =
        await http.post(url, headers: _authHeaders(), body: jsonEncode(body));
    if (res.statusCode >= 400) {
      throw Exception(
          'Xendit charge card error ${res.statusCode}: ${res.body}');
    }
    return jsonDecode(res.body) as Map<String, dynamic>;
  }

  //QR PH
  Future<Map<String, dynamic>> createQrPh({
    required String externalId,
    required num amount,
    required String
        type, // 'STATIC' or 'DYNAMIC' allowed depending on Xendit product
    Map<String, dynamic>? metadata,
  }) async {
    final url = Uri.parse(
        '$_baseUrl/qr_codes'); // hypothetical endpoint; verify via docs
    final body = {
      'external_id': externalId,
      'type': type,
      'amount': amount,
      if (metadata != null) 'metadata': metadata,
    };
    final res =
        await http.post(url, headers: _authHeaders(), body: jsonEncode(body));
    if (res.statusCode >= 400) {
      throw Exception('Xendit qr error ${res.statusCode}: ${res.body}');
    }
    return jsonDecode(res.body) as Map<String, dynamic>;
  }

  // ---------- Generic Payment Request (for PayLater / DirectDebit / etc) ----------
  Future<Map<String, dynamic>> createPaymentRequest({
    required String externalId,
    required num amount,
    required String channelCode, // channel code from Xendit list
    Map<String, dynamic>? channelProperties,
    Map<String, dynamic>? metadata,
  }) async {
    final url =
        Uri.parse('$_baseUrl/payment_requests'); // see Payments API overview
    final body = {
      'external_id': externalId,
      'amount': amount,
      'payment_method': {
        'type': channelCode,
        if (channelProperties != null) 'channel_properties': channelProperties
      },
      if (metadata != null) 'metadata': metadata,
    };
    final res =
        await http.post(url, headers: _authHeaders(), body: jsonEncode(body));
    if (res.statusCode >= 400) {
      throw Exception(
          'Xendit create payment request error ${res.statusCode}: ${res.body}');
    }
    return jsonDecode(res.body) as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> createEWalletPayment({
    required String externalId,
    required double amount,
    required String channelCode,
  }) async {
    final url = Uri.parse('$_baseUrl/ewallets/charges');

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Basic ${base64Encode(utf8.encode('$_secreKey:'))}',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'reference_id': externalId,
        'currency': 'PHP',
        'amount': amount,
        'checkout_method': 'ONE_TIME_PAYMENT',
        'channel_code': channelCode,
        'channel_properties': {
          'success_redirect_url': _env['XENDIT_SUCCESS_REDIRECT_URL'] ??
              'wemultiply://payment/success',
          'failure_redirect_url': _env['XENDIT_FAILURE_REDIRECT_URL'] ??
              'wemultiply://payment/failure',
        }
      }),
    );
    return jsonDecode(response.body);
  }

  /// Creates a card payment request with 3DS authentication
  /// This uses Xendit's Payment Request API for direct card payments
  Future<Map<String, dynamic>> createCardPaymentRequest({
    required String referenceId,
    required num amount,
    required String currency,
    required String cardNumber,
    required String expiryMonth,
    required String expiryYear,
    required String cvn,
    required String cardholderFirstName,
    required String cardholderLastName,
    required String cardholderEmail,
    String? cardholderPhone,
    String? description,
    String captureMethod = 'AUTOMATIC', // AUTOMATIC or MANUAL for pre-auth
    bool skipThreeDs = false,
    String? successReturnUrl,
    String? failureReturnUrl,
    Map<String, dynamic>? metadata,
  }) async {
    final url = Uri.parse('$_baseUrl/payment_requests');

    final body = {
      'reference_id': referenceId,
      'type': 'PAY',
      'country': currency == 'IDR' ? 'ID' : 'PH',
      'currency': currency,
      'amount': amount,
      'capture_method': captureMethod,
      'channel_code': 'CARDS',
      'channel_properties': {
        'card_details': {
          'card_number': cardNumber,
          'expiry_month': expiryMonth,
          'expiry_year': expiryYear,
          'cvn': cvn,
          'cardholder_first_name': cardholderFirstName,
          'cardholder_last_name': cardholderLastName,
          'cardholder_email': cardholderEmail,
          if (cardholderPhone != null)
            'cardholder_phone_number': cardholderPhone,
        },
        'skip_three_ds': skipThreeDs,
        'success_return_url': successReturnUrl ??
            _env['XENDIT_SUCCESS_REDIRECT_URL'] ??
            'wemultiply://payment/success',
        'failure_return_url': failureReturnUrl ??
            _env['XENDIT_FAILURE_REDIRECT_URL'] ??
            'wemultiply://payment/failure',
      },
      if (description != null) 'description': description,
      if (metadata != null) 'metadata': metadata,
    };

    final response = await http.post(
      url,
      headers: _authHeaders(),
      body: jsonEncode(body),
    );

    if (response.statusCode >= 400) {
      throw Exception(
          'Xendit card payment request error ${response.statusCode}: ${response.body}');
    }

    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  /// Captures a pre-authorized card payment (when capture_method was MANUAL)
  Future<Map<String, dynamic>> captureCardPayment({
    required String paymentRequestId,
    required num captureAmount,
  }) async {
    final url =
        Uri.parse('$_baseUrl/payment_requests/$paymentRequestId/captures');

    final body = {
      'capture_amount': captureAmount,
    };

    final response = await http.post(
      url,
      headers: _authHeaders(),
      body: jsonEncode(body),
    );

    if (response.statusCode >= 400) {
      throw Exception(
          'Xendit capture error ${response.statusCode}: ${response.body}');
    }

    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  /// Gets payment request status by ID
  Future<Map<String, dynamic>> getPaymentRequestStatus(
      String paymentRequestId) async {
    final url = Uri.parse('$_baseUrl/payment_requests/$paymentRequestId');

    final response = await http.get(url, headers: _authHeaders());

    if (response.statusCode >= 400) {
      throw Exception(
          'Xendit get payment request error ${response.statusCode}: ${response.body}');
    }

    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}
