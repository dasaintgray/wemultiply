import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

///Usage:
///Text('Click Me').onTap(() => print('Tapped!'));
extension OnTapExtension on Widget {
  Widget onTap(
    VoidCallback onTap, {
    HitTestBehavior behavior = HitTestBehavior.opaque,
  }) {
    return GestureDetector(onTap: onTap, behavior: behavior, child: this);
  }
}

///Usage:
///Text('Hello World').paddingAll(16);
///Text('Hello World').paddingSymmetric({double horizontal = 0, double vertical = 0})
extension PaddingExtension on Widget {
  Widget paddingAll(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);

  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) =>
      Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: this,
      );
}

///Usage:
///Text('Spaced Text').marginAll(8);
extension MarginExtension on Widget {
  Widget marginAll(double value) =>
      Container(margin: EdgeInsets.all(value), child: this);
}

///Usage:
///Text('Premium Feature').visible(isPremiumUser);
extension VisibilityExtension on Widget {
  Widget visible(bool isVisible) => isVisible ? this : const SizedBox.shrink();
}

///Usage:
///Text('Centered Text').center();
extension CenterExtension on Widget {
  Widget center() => Center(child: this);
}

///Usage:
///Row(
///  children: [
///    Text('Left').expanded(),
///    Text('Right').expanded(),
///  ],
///);
extension FlexExtension on Widget {
  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);

  Widget flexible({int flex = 1}) => Flexible(flex: flex, child: this);
}

///Usage:
///Text('Card Widget').card();
extension CardExtension on Widget {
  Widget card({
    EdgeInsets padding = const EdgeInsets.all(12),
    double elevation = 3,
    double borderRadius = 12,
  }) {
    return Card(
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(padding: padding, child: this),
    );
  }
}

///Usage:
///Image.network('https://picsum.photos/200').rounded(16);
extension RoundedExtension on Widget {
  Widget rounded(double radius) =>
      ClipRRect(borderRadius: BorderRadius.circular(radius), child: this);
}

///Usage:
///Text('Colored Box')
///    .paddingAll(16)
///    .backgroundColor(Colors.amber);
extension BackgroundExtension on Widget {
  Widget backgroundColor(Color color) => DecoratedBox(
    decoration: BoxDecoration(color: color),
    child: this,
  );
  Widget multiplyColor(Color color) {
    // 1. Wrap the current widget in a ColoredBox with the multiply color.
    // This creates the "colored background" layer.
    return ColoredBox(
      color: color,
      child: ColorFiltered(
        // 2. Use ColorFiltered to blend the background color with the child.
        // The child's colors will be blended with the provided color using the 'multiply' mode.
        colorFilter: ColorFilter.mode(
          color, // The color to blend with
          BlendMode.multiply, // The blend mode
        ),
        child: this, // The original widget
      ),
    );
  }

  Widget withGradientBackground(Gradient gradient) => DecoratedBox(
    decoration: BoxDecoration(
      // 1. Remove the 'color' property
      // 2. Use the 'gradient' property
      gradient: gradient,
    ),
    child: this,
  );
}

///Usage:
///Text('Bottom Right').align(Alignment.bottomRight);
extension AlignExtension on Widget {
  Widget align([Alignment alignment = Alignment.center]) =>
      Align(alignment: alignment, child: this);
}

///Usage:
///print('flutter'.capitalize); // Output: Flutter
extension StringExtension on String {
  String get capitalize => '${this[0].toUpperCase()}${substring(1)}';

  String get lowerCase => '${this[0].toLowerCase()}${substring(1)}';

  String get perangPinoy => NumberFormat.currency(
    locale: 'en_US',
    symbol: 'PHP ',
    decimalDigits: 2,
  ).format(double.tryParse(this) ?? 0);
}

//NumberFormat
extension NumberFormatExtension on NumberFormat {
  String toCurrencyString({String locale = 'en_US', String symbol = '₱'}) {
    final format = NumberFormat.currency(
      locale: locale,
      symbol: symbol,
      decimalDigits: 2,
    );
    return format.format(this);
  }

  String formatCompact(num number) {
    final formatCompact = NumberFormat.compact(locale: 'en_US');
    return formatCompact.format(number);
  }
}
