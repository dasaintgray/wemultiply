import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';

@client
class Contact extends StatelessComponent {
  const Contact({super.key});

  @override
  Component build(BuildContext context) {
    return section([
      // Page Header
      div(classes: 'page-header', [
        h1([.text('Contact Us')]),
        p([.text('We\'d love to hear from you')]),
      ]),

      // Contact Section
      div(classes: 'contact-section', [
        div(classes: 'container', [
          div(classes: 'contact-grid', [
            // Contact Form
            div(classes: 'contact-form', [
              h2([.text('Send us a message')]),
              form([
                div(classes: 'form-group', [
                  label(htmlFor: 'name', [.text('Name')]),
                  input(type: InputType.text, id: 'name', name: 'name'),
                ]),
                div(classes: 'form-group', [
                  label(htmlFor: 'email', [.text('Email')]),
                  input(type: InputType.email, id: 'email', name: 'email'),
                ]),
                div(classes: 'form-group', [
                  label(htmlFor: 'subject', [.text('Subject')]),
                  input(type: InputType.text, id: 'subject', name: 'subject'),
                ]),
                div(classes: 'form-group', [
                  label(htmlFor: 'message', [.text('Message')]),
                  textarea(id: 'message', name: 'message', []),
                ]),
                button(type: ButtonType.submit, classes: 'btn-submit', [.text('Send Message')]),
              ]),
            ]),

            // Contact Info
            div(classes: 'contact-info', [
              h2([.text('Get in touch')]),
              div(classes: 'info-item', [
                span(classes: 'info-icon', [.text('\u{1F4CD}')]),
                div([
                  h4([.text('Address')]),
                  p([.text('Metro Manila, Philippines')]),
                ]),
              ]),
              div(classes: 'info-item', [
                span(classes: 'info-icon', [.text('\u{1F4E7}')]),
                div([
                  h4([.text('Email')]),
                  p([.text('support@wemultiply.com')]),
                ]),
              ]),
              div(classes: 'info-item', [
                span(classes: 'info-icon', [.text('\u{1F4DE}')]),
                div([
                  h4([.text('Phone')]),
                  p([.text('+63 XXX XXX XXXX')]),
                ]),
              ]),
              div(classes: 'info-item', [
                span(classes: 'info-icon', [.text('\u{1F551}')]),
                div([
                  h4([.text('Business Hours')]),
                  p([.text('Mon - Fri: 9AM - 6PM')]),
                ]),
              ]),
            ]),
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

    css('.contact-section', [
      css('&').styles(
        padding: .symmetric(vertical: 4.rem),
        backgroundColor: backgroundColor,
      ),
      css('.contact-grid', [
        css('&').styles(
          display: .grid,
          gap: Gap(column: 3.rem, row: 3.rem),
        ),
      ]),
    ]),

    css('.contact-form', [
      css('&').styles(
        padding: .all(2.rem),
        radius: .circular(12.px),
        backgroundColor: whiteColor,
      ),
      css('h2').styles(
        margin: .only(bottom: 1.5.rem),
        color: textColor,
        fontSize: 1.5.rem,
        fontWeight: .w600,
      ),
      css('.form-group', [
        css('&').styles(margin: .only(bottom: 1.25.rem)),
        css('label').styles(
          display: .block,
          margin: .only(bottom: 0.5.rem),
          color: textColor,
          fontSize: 0.95.rem,
          fontWeight: .w500,
        ),
        css('input, textarea', [
          css('&').styles(
            width: 100.percent,
            padding: .all(0.75.rem),
            border: Border.all(color: const Color('#E2E8F0'), width: 1.px),
            radius: .circular(6.px),
            fontSize: 1.rem,
          ),
        ]),
        css('textarea').styles(
          minHeight: 150.px,
        ),
      ]),
      css('.btn-submit').styles(
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

    css('.contact-info', [
      css('&').styles(
        padding: .all(2.rem),
        radius: .circular(12.px),
        backgroundColor: whiteColor,
      ),
      css('h2').styles(
        margin: .only(bottom: 1.5.rem),
        color: textColor,
        fontSize: 1.5.rem,
        fontWeight: .w600,
      ),
      css('.info-item', [
        css('&').styles(
          display: .flex,
          margin: .only(bottom: 1.5.rem),
          alignItems: .start,
          gap: Gap(column: 1.rem),
        ),
        css('.info-icon').styles(
          display: .flex,
          width: 48.px,
          height: 48.px,
          radius: .circular(8.px),
          justifyContent: .center,
          alignItems: .center,
          fontSize: 1.5.rem,
          backgroundColor: backgroundColor,
        ),
        css('h4').styles(
          margin: .only(bottom: 0.25.rem),
          color: textColor,
          fontSize: 1.rem,
          fontWeight: .w600,
        ),
        css('p').styles(
          color: textLightColor,
        ),
      ]),
    ]),
  ];
}
