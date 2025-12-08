import 'package:test/test.dart';
import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Given Webhooks endpoint', (sessionBuilder, endpoints) {
    group('xendit webhook handler', () {
      test('when missing event or data should return error', () async {
        final result = await endpoints.webhooks.xendit(
          sessionBuilder,
          {'invalid': 'payload'},
          null,
        );

        expect(result['success'], false);
        expect(result['message'], 'Missing event or data');
      });

      test('when payment not found should return error', () async {
        final webhookBody = {
          'id': 'webhook_123',
          'event': 'invoice.paid',
          'data': {
            'external_id': 'nonexistent_payment_id',
            'status': 'PAID',
          },
        };

        final result = await endpoints.webhooks.xendit(
          sessionBuilder,
          webhookBody,
          null,
        );

        expect(result['success'], false);
        expect(result['message'], 'Payment not found');
      });
    });

    group('status mapping logic', () {
      test('invoice.paid event type should be recognized', () async {
        // This test verifies the event parsing without needing a payment record
        final webhookBody = {
          'id': 'test_invoice_paid',
          'event': 'invoice.paid',
          'data': {
            'external_id':
                'test_ext_paid_${DateTime.now().millisecondsSinceEpoch}',
            'status': 'PAID',
          },
        };

        // Should fail at payment lookup, but that confirms event parsing worked
        final result = await endpoints.webhooks.xendit(
          sessionBuilder,
          webhookBody,
          null,
        );

        // If we got to "Payment not found", the event type was correctly parsed
        expect(result['message'], 'Payment not found');
      });

      test('ewallet.capture event type should be recognized', () async {
        final webhookBody = {
          'id': 'test_ewallet_capture',
          'event': 'ewallet.capture',
          'data': {
            'reference_id':
                'test_ewallet_ref_${DateTime.now().millisecondsSinceEpoch}',
            'status': 'CAPTURED',
          },
        };

        final result = await endpoints.webhooks.xendit(
          sessionBuilder,
          webhookBody,
          null,
        );

        // If we got to "Payment not found", the reference_id extraction worked
        expect(result['message'], 'Payment not found');
      });

      test('payment.succeeded event type should be recognized', () async {
        final webhookBody = {
          'id': 'test_payment_succeeded',
          'event': 'payment.succeeded',
          'data': {
            'reference_id':
                'test_payment_ref_${DateTime.now().millisecondsSinceEpoch}',
            'status': 'SUCCEEDED',
          },
        };

        final result = await endpoints.webhooks.xendit(
          sessionBuilder,
          webhookBody,
          null,
        );

        expect(result['message'], 'Payment not found');
      });

      test('qr code event should extract external_id', () async {
        final webhookBody = {
          'id': 'test_qr',
          'event': 'qr.paid',
          'data': {
            'external_id': 'test_qr_${DateTime.now().millisecondsSinceEpoch}',
            'status': 'PAID',
          },
        };

        final result = await endpoints.webhooks.xendit(
          sessionBuilder,
          webhookBody,
          null,
        );

        expect(result['message'], 'Payment not found');
      });
    });

    group('validation', () {
      test('when event is null should return error', () async {
        final result = await endpoints.webhooks.xendit(
          sessionBuilder,
          {
            'data': {'external_id': 'test'},
          },
          null,
        );

        expect(result['success'], false);
        expect(result['message'], 'Missing event or data');
      });

      test('when data is null should return error', () async {
        final result = await endpoints.webhooks.xendit(
          sessionBuilder,
          {
            'event': 'invoice.paid',
          },
          null,
        );

        expect(result['success'], false);
        expect(result['message'], 'Missing event or data');
      });

      test('when unknown event type should still attempt to process', () async {
        final webhookBody = {
          'event': 'unknown.event',
          'data': {
            'external_id':
                'test_unknown_${DateTime.now().millisecondsSinceEpoch}',
            'status': 'UNKNOWN',
          },
        };

        final result = await endpoints.webhooks.xendit(
          sessionBuilder,
          webhookBody,
          null,
        );

        // Unknown events without external_id in known patterns
        // should return "Missing external_id"
        expect(result['success'], false);
      });
    });
  });
}
