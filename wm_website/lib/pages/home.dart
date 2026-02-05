import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import '../constants/theme.dart';

@client
class Home extends StatelessComponent {
  const Home({super.key});

  @override
  Component build(BuildContext context) {
    return section([
      // Hero Section
      div(classes: 'hero', [
        div(classes: 'hero-content', [
          h1([.text('Multiply Your Success with WeMultiply')]),
          p(classes: 'hero-subtitle', [
            .text('Join our community of entrepreneurs and discover premium products that help you grow your business and income.')
          ]),
          div(classes: 'hero-buttons', [
            Link(
              to: '/membership',
              child: button(classes: 'btn-primary', [.text('Join Now')]),
            ),
            Link(
              to: '/products',
              child: button(classes: 'btn-secondary', [.text('View Products')]),
            ),
          ]),
        ]),
      ]),

      // Features Section
      div(classes: 'features', [
        div(classes: 'features-container', [
          h2([.text('Why Choose WeMultiply?')]),
          div(classes: 'features-grid', [
            div(classes: 'feature-card', [
              span(classes: 'feature-icon', [.text('\u{1F4B0}')]),
              h3([.text('Earn Income')]),
              p([.text('Build a sustainable income stream through our proven business model.')]),
            ]),
            div(classes: 'feature-card', [
              span(classes: 'feature-icon', [.text('\u{1F331}')]),
              h3([.text('Quality Products')]),
              p([.text('Premium health and wellness products backed by science.')]),
            ]),
            div(classes: 'feature-card', [
              span(classes: 'feature-icon', [.text('\u{1F465}')]),
              h3([.text('Community')]),
              p([.text('Join a supportive network of like-minded entrepreneurs.')]),
            ]),
            div(classes: 'feature-card', [
              span(classes: 'feature-icon', [.text('\u{1F4C8}')]),
              h3([.text('Growth')]),
              p([.text('Access training and resources to accelerate your success.')]),
            ]),
          ]),
        ]),
      ]),

      // CTA Section
      div(classes: 'cta-section', [
        div(classes: 'cta-container', [
          h2([.text('Ready to Start Your Journey?')]),
          p([.text('Join thousands of successful entrepreneurs who have transformed their lives with WeMultiply.')]),
          Link(
            to: '/membership',
            child: button(classes: 'btn-cta', [.text('Get Started Today')]),
          ),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    // Hero styles
    css('.hero', [
      css('&').styles(
        display: .flex,
        minHeight: 500.px,
        padding: .all(3.rem),
        justifyContent: .center,
        alignItems: .center,
        color: whiteColor,
        backgroundColor: primaryColor,
      ),
      css('.hero-content', [
        css('&').styles(
          maxWidth: 800.px,
          textAlign: .center,
        ),
        css('h1').styles(
          margin: .only(bottom: 1.5.rem),
          fontSize: 3.rem,
          fontWeight: .w700,
          lineHeight: 1.2.em,
        ),
        css('.hero-subtitle').styles(
          margin: .only(bottom: 2.rem),
          opacity: 0.9,
          fontSize: 1.25.rem,
          lineHeight: 1.6.em,
        ),
      ]),
      css('.hero-buttons', [
        css('&').styles(
          display: .flex,
          justifyContent: .center,
          gap: Gap(column: 1.rem),
        ),
        css('.btn-primary').styles(
          padding: .symmetric(horizontal: 2.rem, vertical: 1.rem),
          border: Border.none,
          radius: .circular(8.px),
          color: primaryColor,
          fontSize: 1.1.rem,
          fontWeight: .w600,
          backgroundColor: whiteColor,
        ),
        css('.btn-secondary').styles(
          padding: .symmetric(horizontal: 2.rem, vertical: 1.rem),
          border: Border.all(color: whiteColor, width: 2.px),
          radius: .circular(8.px),
          color: whiteColor,
          fontSize: 1.1.rem,
          fontWeight: .w600,
          backgroundColor: const Color('#00000000'),
        ),
      ]),
    ]),

    // Features styles
    css('.features', [
      css('&').styles(
        padding: .symmetric(vertical: 4.rem, horizontal: 2.rem),
        backgroundColor: backgroundColor,
      ),
      css('.features-container', [
        css('&').styles(
          maxWidth: 1200.px,
          margin: .symmetric(horizontal: .auto),
          textAlign: .center,
        ),
        css('h2').styles(
          margin: .only(bottom: 3.rem),
          color: textColor,
          fontSize: 2.5.rem,
          fontWeight: .w700,
        ),
      ]),
      css('.features-grid', [
        css('&').styles(
          display: .grid,
          gap: Gap(column: 2.rem, row: 2.rem),
        ),
      ]),
      css('.feature-card', [
        css('&').styles(
          padding: .all(2.rem),
          radius: .circular(12.px),
          textAlign: .center,
          backgroundColor: whiteColor,
        ),
        css('.feature-icon').styles(
          display: .block,
          margin: .only(bottom: 1.rem),
          fontSize: 3.rem,
        ),
        css('h3').styles(
          margin: .only(bottom: 0.75.rem),
          color: textColor,
          fontSize: 1.25.rem,
          fontWeight: .w600,
        ),
        css('p').styles(
          color: textLightColor,
          lineHeight: 1.6.em,
        ),
      ]),
    ]),

    // CTA styles
    css('.cta-section', [
      css('&').styles(
        padding: .symmetric(vertical: 4.rem, horizontal: 2.rem),
        color: whiteColor,
        textAlign: .center,
        backgroundColor: secondaryColor,
      ),
      css('.cta-container', [
        css('&').styles(
          maxWidth: 600.px,
          margin: .symmetric(horizontal: .auto),
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
      ]),
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
