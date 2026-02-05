import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import '../constants/theme.dart';

class Header extends StatelessComponent {
  const Header({super.key});

  @override
  Component build(BuildContext context) {
    var activePath = context.url;

    return header([
      div(classes: 'header-container', [
        // Logo
        Link(
          to: '/',
          child: div(classes: 'logo', [
            span(classes: 'logo-we', [.text('We')]),
            span(classes: 'logo-multiply', [.text('Multiply')]),
          ]),
        ),
        // Navigation
        nav([
          for (var route in [
            (label: 'Home', path: '/'),
            (label: 'About', path: '/about'),
            (label: 'Products', path: '/products'),
            (label: 'Membership', path: '/membership'),
            (label: 'Contact', path: '/contact'),
            (label: 'FAQ', path: '/faq'),
          ])
            div(classes: activePath == route.path ? 'nav-item active' : 'nav-item', [
              Link(to: route.path, child: .text(route.label)),
            ]),
        ]),
        // CTA Button
        Link(
          to: '/membership',
          child: button(classes: 'cta-button', [.text('Get Started')]),
        ),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('header', [
      css('&').styles(
        display: .flex,
        position: .sticky(top: 0.px),
        padding: .symmetric(vertical: 1.rem, horizontal: 2.rem),
        justifyContent: .center,
        backgroundColor: whiteColor,
      ),
      css('.header-container', [
        css('&').styles(
          display: .flex,
          width: 100.percent,
          maxWidth: 1200.px,
          justifyContent: .spaceBetween,
          alignItems: .center,
        ),
      ]),
      css('.logo', [
        css('&').styles(
          display: .flex,
          fontSize: 1.5.rem,
          fontWeight: .w700,
        ),
        css('.logo-we').styles(color: primaryColor),
        css('.logo-multiply').styles(color: secondaryColor),
      ]),
      css('nav', [
        css('&').styles(
          display: .flex,
          gap: Gap(column: 0.5.rem),
        ),
        css('.nav-item', [
          css('&').styles(position: .relative()),
          css('a', [
            css('&').styles(
              display: .flex,
              padding: .symmetric(horizontal: 1.rem, vertical: 0.5.rem),
              radius: .circular(6.px),
              color: textColor,
              fontWeight: .w500,
              textDecoration: TextDecoration(line: .none),
            ),
            css('&:hover').styles(
              color: primaryColor,
              backgroundColor: backgroundColor,
            ),
          ]),
        ]),
        css('.nav-item.active', [
          css('a').styles(
            color: primaryColor,
            fontWeight: .w600,
          ),
          css('&::after').styles(
            content: '',
            display: .block,
            position: .absolute(bottom: (-4).px, left: 1.rem, right: 1.rem),
            height: 2.px,
            radius: .circular(1.px),
            backgroundColor: primaryColor,
          ),
        ]),
      ]),
      css('.cta-button', [
        css('&').styles(
          display: .inlineBlock,
          padding: .symmetric(horizontal: 1.5.rem, vertical: 0.75.rem),
          border: Border.none,
          radius: .circular(8.px),
          color: whiteColor,
          fontWeight: .w600,
          backgroundColor: accentColor,
        ),
        css('&:hover').styles(
          backgroundColor: const Color('#D97706'),
        ),
      ]),
    ]),
  ];
}
