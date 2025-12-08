import 'package:intl/intl.dart';

class FormatUtils {
  static final NumberFormat currencyFormatter = NumberFormat.currency(
    locale: 'en_US',
    symbol: '₱',
    decimalDigits: 2,
  );
}
