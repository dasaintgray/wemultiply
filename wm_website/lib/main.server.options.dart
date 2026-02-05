// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:wm_website/components/footer.dart' as _footer;
import 'package:wm_website/components/header.dart' as _header;
import 'package:wm_website/pages/about.dart' as _about;
import 'package:wm_website/pages/contact.dart' as _contact;
import 'package:wm_website/pages/faq.dart' as _faq;
import 'package:wm_website/pages/home.dart' as _home;
import 'package:wm_website/pages/membership.dart' as _membership;
import 'package:wm_website/pages/products.dart' as _products;
import 'package:wm_website/app.dart' as _app;

/// Default [ServerOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.server.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultServerOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ServerOptions get defaultServerOptions => ServerOptions(
  clientId: 'main.client.dart.js',
  clients: {
    _about.About: ClientTarget<_about.About>('about'),
    _contact.Contact: ClientTarget<_contact.Contact>('contact'),
    _faq.FAQ: ClientTarget<_faq.FAQ>('faq'),
    _home.Home: ClientTarget<_home.Home>('home'),
    _membership.Membership: ClientTarget<_membership.Membership>('membership'),
    _products.Products: ClientTarget<_products.Products>('products'),
  },
  styles: () => [
    ..._footer.Footer.styles,
    ..._header.Header.styles,
    ..._about.About.styles,
    ..._contact.Contact.styles,
    ..._faq.FAQ.styles,
    ..._home.Home.styles,
    ..._membership.Membership.styles,
    ..._products.Products.styles,
    ..._app.App.styles,
  ],
);
