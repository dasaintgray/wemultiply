// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/client.dart';

import 'package:wm_website/pages/about.dart' deferred as _about;
import 'package:wm_website/pages/contact.dart' deferred as _contact;
import 'package:wm_website/pages/faq.dart' deferred as _faq;
import 'package:wm_website/pages/home.dart' deferred as _home;
import 'package:wm_website/pages/membership.dart' deferred as _membership;
import 'package:wm_website/pages/products.dart' deferred as _products;

/// Default [ClientOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.client.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultClientOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ClientOptions get defaultClientOptions => ClientOptions(
  clients: {
    'about': ClientLoader((p) => _about.About(), loader: _about.loadLibrary),
    'contact': ClientLoader(
      (p) => _contact.Contact(),
      loader: _contact.loadLibrary,
    ),
    'faq': ClientLoader((p) => _faq.FAQ(), loader: _faq.loadLibrary),
    'home': ClientLoader((p) => _home.Home(), loader: _home.loadLibrary),
    'membership': ClientLoader(
      (p) => _membership.Membership(),
      loader: _membership.loadLibrary,
    ),
    'products': ClientLoader(
      (p) => _products.Products(),
      loader: _products.loadLibrary,
    ),
  },
);
