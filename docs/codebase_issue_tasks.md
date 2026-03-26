# Codebase Issue Triage: Proposed Tasks

## 1) Typo Fix Task

**Task:** Rename historical typo table name `uela` to `eula` (or add a compatibility migration and cleanup notes).

**Why this matters:** Multiple migration artifacts still refer to `uela`, which appears to be a transposition typo of `eula`. This increases migration confusion and can break assumptions in tooling/scripts that expect the canonical table name.

**Evidence:**
- `CREATE TABLE "uela"` appears in early migration SQL.
- A later migration explicitly drops `uela`, indicating a typo rename path happened but old artifacts remain noisy and error-prone.

## 2) Bug Fix Task

**Task:** Fix webhook idempotency check in `WebhooksEndpoint.xendit` by storing JSON payloads consistently and querying by structured field (or a dedicated `webhookId` column) instead of string pattern matching.

**Why this matters:** The code searches for JSON-style `"id":"..."` in `PaymentEvent.payload`, but payload is currently persisted via `body.toString()` (Dart map format, not JSON), so duplicate webhook detection can fail.

**Evidence:**
- Idempotency lookup uses `like('%"id":"$webhookId"%')`.
- Event payload is saved using `body.toString()`.

## 3) Code Comment / Documentation Discrepancy Task

**Task:** Reconcile `_updateOrderStatus` comment with implementation (or update implementation). The comment says order id may be embedded in `externalId`, but the regex is executed against `orderId`.

**Why this matters:** Misleading comments in payment/order code can cause incorrect future refactors and incident debugging mistakes.

**Evidence:**
- Comment: `orderId might be embedded in externalId like "order_123_timestamp"`.
- Implementation: `RegExp(r'order_(\d+)_').firstMatch(orderId)`.

## 4) Test Improvement Task

**Task:** Strengthen webhook tests to assert idempotency behavior and full contract fields (`success`, `message`, `idempotent`, and status transitions) with seeded payment/event records.

**Why this matters:** Current tests mostly validate negative paths (`Payment not found`) and don't protect the intended duplicate-processing safeguard.

**Evidence:**
- Several tests assert only `result['message'] == 'Payment not found'`, which doesn't verify persistence side effects or idempotency guarantees.
