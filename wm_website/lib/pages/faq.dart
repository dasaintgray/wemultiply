import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';

@client
class FAQ extends StatelessComponent {
  const FAQ({super.key});

  @override
  Component build(BuildContext context) {
    return section([
      // Page Header
      div(classes: 'page-header', [
        h1([.text('Frequently Asked Questions')]),
        p([.text('Find answers to common questions about WeMultiply')]),
      ]),

      // FAQ Section
      div(classes: 'faq-section', [
        div(classes: 'container', [
          // General Questions
          div(classes: 'faq-category', [
            h2([.text('General Questions')]),
            _faqItem(
              question: 'What is WeMultiply?',
              answer: 'WeMultiply is a health and wellness company that offers premium products and a business opportunity for entrepreneurs to build their own income streams.',
            ),
            _faqItem(
              question: 'How do I become a member?',
              answer: 'You can become a member by purchasing one of our membership packages through our mobile app or by contacting an existing distributor.',
            ),
            _faqItem(
              question: 'What products does WeMultiply offer?',
              answer: 'We offer a range of health and wellness products including supplements, energy drinks, detox formulas, and more.',
            ),
          ]),

          // Business Questions
          div(classes: 'faq-category', [
            h2([.text('Business Opportunity')]),
            _faqItem(
              question: 'How do I earn money with WeMultiply?',
              answer: 'You can earn through direct sales commissions, team bonuses, and various incentive programs as you build your network.',
            ),
            _faqItem(
              question: 'What support do I get as a distributor?',
              answer: 'We provide comprehensive training, marketing materials, a supportive community, and dedicated support to help you succeed.',
            ),
            _faqItem(
              question: 'Is there a minimum sales requirement?',
              answer: 'Requirements vary by membership level. Contact us for specific details about each package.',
            ),
          ]),

          // Product Questions
          div(classes: 'faq-category', [
            h2([.text('Products & Orders')]),
            _faqItem(
              question: 'Are your products safe?',
              answer: 'Yes, all our products are made with high-quality ingredients and comply with health and safety regulations.',
            ),
            _faqItem(
              question: 'How do I place an order?',
              answer: 'You can place orders through our mobile app or through your upline distributor.',
            ),
            _faqItem(
              question: 'What is the return policy?',
              answer: 'We offer a satisfaction guarantee on all our products. Please contact support for specific return policies.',
            ),
          ]),
        ]),
      ]),

      // Contact CTA
      div(classes: 'faq-cta', [
        div(classes: 'container', [
          h2([.text('Still have questions?')]),
          p([.text('Our support team is ready to help you.')]),
          a(href: '/contact', [
            button(classes: 'btn-cta', [.text('Contact Us')]),
          ]),
        ]),
      ]),
    ]);
  }

  Component _faqItem({
    required String question,
    required String answer,
  }) {
    return div(classes: 'faq-item', [
      div(classes: 'faq-question', [
        span(classes: 'faq-icon', [.text('\u{2753}')]),
        h3([.text(question)]),
      ]),
      p(classes: 'faq-answer', [.text(answer)]),
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
      maxWidth: 800.px,
      padding: .symmetric(horizontal: 2.rem),
      margin: .symmetric(horizontal: .auto),
    ),

    css('.faq-section', [
      css('&').styles(
        padding: .symmetric(vertical: 4.rem),
        backgroundColor: backgroundColor,
      ),
    ]),

    css('.faq-category', [
      css('&').styles(margin: .only(bottom: 3.rem)),
      css('h2').styles(
        margin: .only(bottom: 1.5.rem),
        color: primaryColor,
        fontSize: 1.5.rem,
        fontWeight: .w600,
      ),
    ]),

    css('.faq-item', [
      css('&').styles(
        padding: .all(1.5.rem),
        margin: .only(bottom: 1.rem),
        radius: .circular(8.px),
        backgroundColor: whiteColor,
      ),
      css('.faq-question', [
        css('&').styles(
          display: .flex,
          margin: .only(bottom: 0.75.rem),
          alignItems: .center,
          gap: Gap(column: 0.75.rem),
        ),
        css('.faq-icon').styles(
          fontSize: 1.25.rem,
        ),
        css('h3').styles(
          color: textColor,
          fontSize: 1.1.rem,
          fontWeight: .w600,
        ),
      ]),
      css('.faq-answer').styles(
        padding: .only(left: 2.rem),
        color: textLightColor,
        lineHeight: 1.7.em,
      ),
    ]),

    css('.faq-cta', [
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
