import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';

@client
class Membership extends StatelessComponent {
  const Membership({super.key});

  @override
  Component build(BuildContext context) {
    return section([
      // Page Header
      div(classes: 'page-header', [
        h1([.text('Membership Packages')]),
        p([.text('Choose the package that fits your goals')]),
      ]),

      // Packages Section
      div(classes: 'packages-section', [
        div(classes: 'container', [
          div(classes: 'packages-grid', [
            _packageCard(
              name: 'Starter',
              price: '2,999',
              features: [
                '5 Product Bottles',
                'Basic Training Access',
                'Community Support',
                '10% Commission Rate',
              ],
              isPopular: false,
            ),
            _packageCard(
              name: 'Business',
              price: '9,999',
              features: [
                '15 Product Bottles',
                'Full Training Access',
                'Priority Support',
                '15% Commission Rate',
                'Marketing Materials',
              ],
              isPopular: true,
            ),
            _packageCard(
              name: 'Premium',
              price: '24,999',
              features: [
                '40 Product Bottles',
                'VIP Training Access',
                'Dedicated Support',
                '20% Commission Rate',
                'Marketing Materials',
                'Leadership Program',
              ],
              isPopular: false,
            ),
          ]),
        ]),
      ]),

      // Benefits Section
      div(classes: 'benefits-section', [
        div(classes: 'container', [
          h2([.text('Member Benefits')]),
          div(classes: 'benefits-grid', [
            div(classes: 'benefit-item', [
              span(classes: 'benefit-icon', [.text('\u{2705}')]),
              p([.text('Access to premium products at wholesale prices')]),
            ]),
            div(classes: 'benefit-item', [
              span(classes: 'benefit-icon', [.text('\u{2705}')]),
              p([.text('Earn commissions on personal and team sales')]),
            ]),
            div(classes: 'benefit-item', [
              span(classes: 'benefit-icon', [.text('\u{2705}')]),
              p([.text('Free training and business development resources')]),
            ]),
            div(classes: 'benefit-item', [
              span(classes: 'benefit-icon', [.text('\u{2705}')]),
              p([.text('Join a supportive community of entrepreneurs')]),
            ]),
          ]),
        ]),
      ]),

      // CTA Section
      div(classes: 'membership-cta', [
        div(classes: 'container', [
          h2([.text('Ready to Get Started?')]),
          p([.text('Download our mobile app to sign up and manage your membership.')]),
          button(classes: 'btn-cta', [.text('Download App')]),
        ]),
      ]),
    ]);
  }

  Component _packageCard({
    required String name,
    required String price,
    required List<String> features,
    required bool isPopular,
  }) {
    return div(classes: isPopular ? 'package-card popular' : 'package-card', [
      if (isPopular)
        div(classes: 'popular-badge', [.text('Most Popular')]),
      h3([.text(name)]),
      div(classes: 'price', [
        span(classes: 'currency', [.text('\u{20B1}')]),
        span(classes: 'amount', [.text(price)]),
      ]),
      ul([
        for (var feature in features)
          li([
            span([.text('\u{2713} ')]),
            .text(feature),
          ]),
      ]),
      button(classes: 'btn-package', [.text('Get Started')]),
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

    css('.packages-section', [
      css('&').styles(
        padding: .symmetric(vertical: 4.rem),
        backgroundColor: backgroundColor,
      ),
      css('.packages-grid', [
        css('&').styles(
          display: .grid,
          justifyContent: .center,
          alignItems: .start,
          gap: Gap(column: 2.rem, row: 2.rem),
        ),
      ]),
    ]),

    css('.package-card', [
      css('&').styles(
        position: .relative(),
        padding: .all(2.rem),
        radius: .circular(12.px),
        textAlign: .center,
        backgroundColor: whiteColor,
      ),
      css('h3').styles(
        margin: .only(bottom: 1.rem),
        color: textColor,
        fontSize: 1.5.rem,
        fontWeight: .w600,
      ),
      css('.price', [
        css('&').styles(margin: .only(bottom: 1.5.rem)),
        css('.currency').styles(
          color: textLightColor,
          fontSize: 1.25.rem,
          fontWeight: .w600,
        ),
        css('.amount').styles(
          color: primaryColor,
          fontSize: 2.5.rem,
          fontWeight: .w700,
        ),
      ]),
      css('ul', [
        css('&').styles(
          padding: .zero,
          margin: .only(bottom: 2.rem),
          listStyle: .none,
        ),
        css('li').styles(
          padding: .symmetric(vertical: 0.5.rem),
          color: textLightColor,
        ),
      ]),
      css('.btn-package').styles(
        width: 100.percent,
        padding: .symmetric(vertical: 1.rem),
        border: Border.none,
        radius: .circular(8.px),
        color: whiteColor,
        fontSize: 1.rem,
        fontWeight: .w600,
        backgroundColor: primaryColor,
      ),
    ]),

    css('.package-card.popular', [
      css('&').styles(
        border: Border.all(color: accentColor, width: 2.px),
      ),
      css('.popular-badge').styles(
        position: .absolute(top: (-12).px, left: 50.percent),
        padding: .symmetric(horizontal: 1.rem, vertical: 0.25.rem),
        radius: .circular(20.px),
        color: whiteColor,
        fontSize: 0.85.rem,
        fontWeight: .w600,
        backgroundColor: accentColor,
      ),
    ]),

    css('.benefits-section', [
      css('&').styles(
        padding: .symmetric(vertical: 4.rem),
        backgroundColor: whiteColor,
      ),
      css('h2').styles(
        margin: .only(bottom: 3.rem),
        color: textColor,
        textAlign: .center,
        fontSize: 2.rem,
        fontWeight: .w700,
      ),
      css('.benefits-grid', [
        css('&').styles(
          display: .grid,
          gap: Gap(column: 2.rem, row: 1.5.rem),
        ),
      ]),
      css('.benefit-item', [
        css('&').styles(
          display: .flex,
          alignItems: .center,
          gap: Gap(column: 1.rem),
        ),
        css('.benefit-icon').styles(fontSize: 1.5.rem),
        css('p').styles(
          color: textColor,
          fontSize: 1.1.rem,
        ),
      ]),
    ]),

    css('.membership-cta', [
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
