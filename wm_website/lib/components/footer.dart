import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import '../constants/theme.dart';

class Footer extends StatelessComponent {
  const Footer({super.key});

  @override
  Component build(BuildContext context) {
    return footer([
      div(classes: 'footer-container', [
        // Brand section
        div(classes: 'footer-brand', [
          div(classes: 'logo', [
            span(classes: 'logo-we', [.text('We')]),
            span(classes: 'logo-multiply', [.text('Multiply')]),
          ]),
          p([.text('Empowering growth through community and quality products.')]),
        ]),
        // Quick links
        div(classes: 'footer-links', [
          h4([.text('Quick Links')]),
          ul([
            li([Link(to: '/', child: .text('Home'))]),
            li([Link(to: '/about', child: .text('About Us'))]),
            li([Link(to: '/products', child: .text('Products'))]),
            li([Link(to: '/membership', child: .text('Membership'))]),
          ]),
        ]),
        // Support
        div(classes: 'footer-links', [
          h4([.text('Support')]),
          ul([
            li([Link(to: '/contact', child: .text('Contact Us'))]),
            li([Link(to: '/faq', child: .text('FAQ'))]),
          ]),
        ]),
        // Contact info
        div(classes: 'footer-contact', [
          h4([.text('Contact')]),
          p([.text('Email: support@wemultiply.com')]),
          p([.text('Phone: +63 XXX XXX XXXX')]),
        ]),
      ]),
      // Copyright
      div(classes: 'footer-bottom', [
        p([.text('\u00A9 2024 WeMultiply. All rights reserved.')]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('footer', [
      css('&').styles(
        padding: .symmetric(vertical: 3.rem, horizontal: 2.rem),
        color: whiteColor,
        backgroundColor: primaryColor,
      ),
      css('.footer-container', [
        css('&').styles(
          display: .grid,
          maxWidth: 1200.px,
          margin: .symmetric(horizontal: .auto),
          gap: Gap(column: 2.rem, row: 2.rem),
        ),
      ]),
      css('.footer-brand', [
        css('&').styles(maxWidth: 300.px),
        css('.logo', [
          css('&').styles(
            display: .flex,
            margin: .only(bottom: 1.rem),
            fontSize: 1.5.rem,
            fontWeight: .w700,
          ),
          css('.logo-we').styles(color: whiteColor),
          css('.logo-multiply').styles(color: secondaryLightColor),
        ]),
        css('p').styles(
          color: const Color('#CBD5E1'),
          lineHeight: 1.6.em,
        ),
      ]),
      css('.footer-links', [
        css('h4').styles(
          margin: .only(bottom: 1.rem),
          fontSize: 1.1.rem,
          fontWeight: .w600,
        ),
        css('ul').styles(
          padding: .zero,
          margin: .zero,
          listStyle: .none,
        ),
        css('li').styles(margin: .only(bottom: 0.5.rem)),
        css('a', [
          css('&').styles(
            color: const Color('#CBD5E1'),
            textDecoration: TextDecoration(line: .none),
          ),
          css('&:hover').styles(color: whiteColor),
        ]),
      ]),
      css('.footer-contact', [
        css('h4').styles(
          margin: .only(bottom: 1.rem),
          fontSize: 1.1.rem,
          fontWeight: .w600,
        ),
        css('p').styles(
          margin: .only(bottom: 0.5.rem),
          color: const Color('#CBD5E1'),
        ),
      ]),
      css('.footer-bottom', [
        css('&').styles(
          maxWidth: 1200.px,
          padding: .only(top: 2.rem),
          margin: .symmetric(horizontal: .auto),
          textAlign: .center,
        ),
        css('p').styles(
          color: const Color('#94A3B8'),
          fontSize: 0.9.rem,
        ),
      ]),
    ]),
  ];
}
