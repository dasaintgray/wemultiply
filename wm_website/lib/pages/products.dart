import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';

@client
class Products extends StatelessComponent {
  const Products({super.key});

  @override
  Component build(BuildContext context) {
    return section([
      // Page Header
      div(classes: 'page-header', [
        h1([.text('Our Products')]),
        p([.text('Premium health and wellness products for your success')]),
      ]),

      // Products Grid
      div(classes: 'products-section', [
        div(classes: 'container', [
          div(classes: 'products-grid', [
            _productCard(
              name: 'Premium Health Drink',
              description: 'A refreshing beverage packed with essential nutrients and antioxidants.',
              price: '1,500',
            ),
            _productCard(
              name: 'Wellness Supplement',
              description: 'Daily supplement to boost your immune system and overall health.',
              price: '2,000',
            ),
            _productCard(
              name: 'Energy Booster',
              description: 'Natural energy drink to keep you active throughout the day.',
              price: '1,200',
            ),
            _productCard(
              name: 'Detox Formula',
              description: 'Cleanse your body with our all-natural detox formula.',
              price: '1,800',
            ),
            _productCard(
              name: 'Vitamin Complex',
              description: 'Complete vitamin complex for optimal health and vitality.',
              price: '2,500',
            ),
            _productCard(
              name: 'Protein Shake',
              description: 'High-quality protein shake for muscle recovery and growth.',
              price: '1,700',
            ),
          ]),
        ]),
      ]),

      // CTA Section
      div(classes: 'products-cta', [
        div(classes: 'container', [
          h2([.text('Want to become a distributor?')]),
          p([.text('Join our network and earn while promoting quality products.')]),
          a(href: '/membership', [
            button(classes: 'btn-cta', [.text('Learn More')]),
          ]),
        ]),
      ]),
    ]);
  }

  Component _productCard({
    required String name,
    required String description,
    required String price,
  }) {
    return div(classes: 'product-card', [
      div(classes: 'product-image', [
        span(classes: 'product-icon', [.text('\u{1F48A}')]),
      ]),
      div(classes: 'product-info', [
        h3([.text(name)]),
        p([.text(description)]),
        span(classes: 'product-price', [.text('\u{20B1}$price')]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.page-header', [
      css('&').styles(
        padding: .symmetric(vertical: 4.rem, horizontal: 2.rem),
        color: whiteColor,
        textAlign: .center,
        backgroundColor: primaryColor,
      ),
      css('h1').styles(
        margin: .only(bottom: 1.rem),
        fontSize: 2.5.rem,
        fontWeight: .w700,
      ),
      css('p').styles(
        opacity: 0.9,
        fontSize: 1.25.rem,
      ),
    ]),

    css('.container').styles(
      maxWidth: 1200.px,
      padding: .symmetric(horizontal: 2.rem),
      margin: .symmetric(horizontal: .auto),
    ),

    css('.products-section', [
      css('&').styles(
        padding: .symmetric(vertical: 4.rem),
        backgroundColor: backgroundColor,
      ),
      css('.products-grid', [
        css('&').styles(
          display: .grid,
          gap: Gap(column: 2.rem, row: 2.rem),
        ),
      ]),
    ]),

    css('.product-card', [
      css('&').styles(
        radius: .circular(12.px),
        overflow: .hidden,
        backgroundColor: whiteColor,
      ),
      css('.product-image', [
        css('&').styles(
          display: .flex,
          height: 150.px,
          justifyContent: .center,
          alignItems: .center,
          backgroundColor: const Color('#E2E8F0'),
        ),
        css('.product-icon').styles(fontSize: 4.rem),
      ]),
      css('.product-info', [
        css('&').styles(padding: .all(1.5.rem)),
        css('h3').styles(
          margin: .only(bottom: 0.5.rem),
          color: textColor,
          fontSize: 1.25.rem,
          fontWeight: .w600,
        ),
        css('p').styles(
          margin: .only(bottom: 1.rem),
          color: textLightColor,
          fontSize: 0.95.rem,
          lineHeight: 1.6.em,
        ),
        css('.product-price').styles(
          display: .block,
          color: secondaryColor,
          fontSize: 1.25.rem,
          fontWeight: .w700,
        ),
      ]),
    ]),

    css('.products-cta', [
      css('&').styles(
        padding: .symmetric(vertical: 4.rem),
        color: whiteColor,
        textAlign: .center,
        backgroundColor: secondaryColor,
      ),
      css('h2').styles(
        margin: .only(bottom: 1.rem),
        fontSize: 2.rem,
        fontWeight: .w700,
      ),
      css('p').styles(
        margin: .only(bottom: 2.rem),
        opacity: 0.9,
        fontSize: 1.1.rem,
      ),
      css('.btn-cta').styles(
        padding: .symmetric(horizontal: 2.5.rem, vertical: 1.rem),
        border: Border.none,
        radius: .circular(8.px),
        color: secondaryColor,
        fontSize: 1.1.rem,
        fontWeight: .w600,
        backgroundColor: whiteColor,
      ),
    ]),
  ];
}
