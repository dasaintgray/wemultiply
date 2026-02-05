import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';

@client
class About extends StatelessComponent {
  const About({super.key});

  @override
  Component build(BuildContext context) {
    return section([
      // Page Header
      div(classes: 'page-header', [
        h1([.text('About WeMultiply')]),
        p([.text('Empowering entrepreneurs to build sustainable success')]),
      ]),

      // Mission Section
      div(classes: 'mission-section', [
        div(classes: 'container', [
          div(classes: 'mission-content', [
            h2([.text('Our Mission')]),
            p([
              .text('At WeMultiply, we believe everyone deserves the opportunity to build financial freedom. '
                  'Our mission is to provide high-quality products and a proven business model that helps '
                  'individuals create sustainable income streams while improving their health and wellness.')
            ]),
          ]),
        ]),
      ]),

      // Values Section
      div(classes: 'values-section', [
        div(classes: 'container', [
          h2([.text('Our Values')]),
          div(classes: 'values-grid', [
            div(classes: 'value-card', [
              span(classes: 'value-icon', [.text('\u{2764}')]),
              h3([.text('Integrity')]),
              p([.text('We operate with honesty and transparency in everything we do.')]),
            ]),
            div(classes: 'value-card', [
              span(classes: 'value-icon', [.text('\u{1F31F}')]),
              h3([.text('Excellence')]),
              p([.text('We strive for the highest quality in our products and services.')]),
            ]),
            div(classes: 'value-card', [
              span(classes: 'value-icon', [.text('\u{1F91D}')]),
              h3([.text('Community')]),
              p([.text('We build strong relationships and support each other\'s growth.')]),
            ]),
            div(classes: 'value-card', [
              span(classes: 'value-icon', [.text('\u{1F680}')]),
              h3([.text('Innovation')]),
              p([.text('We continuously improve and adapt to serve our community better.')]),
            ]),
          ]),
        ]),
      ]),

      // Story Section
      div(classes: 'story-section', [
        div(classes: 'container', [
          h2([.text('Our Story')]),
          p([
            .text('WeMultiply was founded with a simple vision: to create opportunities for people '
                'to achieve their dreams while promoting health and wellness. What started as a small '
                'team of passionate entrepreneurs has grown into a thriving community of thousands.')
          ]),
          p([
            .text('Today, we continue to expand our product line and support network, '
                'helping more people discover the path to financial independence and better health.')
          ]),
        ]),
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
      maxWidth: 1000.px,
      padding: .symmetric(horizontal: 2.rem),
      margin: .symmetric(horizontal: .auto),
    ),

    css('.mission-section', [
      css('&').styles(
        padding: .symmetric(vertical: 4.rem),
        backgroundColor: whiteColor,
      ),
      css('.mission-content', [
        css('&').styles(textAlign: .center),
        css('h2').styles(
          margin: .only(bottom: 1.5.rem),
          color: textColor,
          fontSize: 2.rem,
          fontWeight: .w700,
        ),
        css('p').styles(
          color: textLightColor,
          fontSize: 1.1.rem,
          lineHeight: 1.8.em,
        ),
      ]),
    ]),

    css('.values-section', [
      css('&').styles(
        padding: .symmetric(vertical: 4.rem),
        backgroundColor: backgroundColor,
      ),
      css('h2').styles(
        margin: .only(bottom: 3.rem),
        color: textColor,
        textAlign: .center,
        fontSize: 2.rem,
        fontWeight: .w700,
      ),
      css('.values-grid', [
        css('&').styles(
          display: .grid,
          gap: Gap(column: 2.rem, row: 2.rem),
        ),
      ]),
      css('.value-card', [
        css('&').styles(
          padding: .all(2.rem),
          radius: .circular(12.px),
          textAlign: .center,
          backgroundColor: whiteColor,
        ),
        css('.value-icon').styles(
          display: .block,
          margin: .only(bottom: 1.rem),
          fontSize: 2.5.rem,
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

    css('.story-section', [
      css('&').styles(
        padding: .symmetric(vertical: 4.rem),
        backgroundColor: whiteColor,
      ),
      css('h2').styles(
        margin: .only(bottom: 2.rem),
        color: textColor,
        textAlign: .center,
        fontSize: 2.rem,
        fontWeight: .w700,
      ),
      css('p').styles(
        margin: .only(bottom: 1.5.rem),
        color: textLightColor,
        textAlign: .center,
        fontSize: 1.1.rem,
        lineHeight: 1.8.em,
      ),
    ]),
  ];
}
