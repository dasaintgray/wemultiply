import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'components/header.dart';
import 'components/footer.dart';
import 'pages/home.dart';
import 'pages/about.dart';
import 'pages/products.dart';
import 'pages/membership.dart';
import 'pages/contact.dart';
import 'pages/faq.dart';

class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'main', [
      const Header(),
      Router(routes: [
        Route(path: '/', title: 'Home | WeMultiply', builder: (context, state) => const Home()),
        Route(path: '/about', title: 'About Us | WeMultiply', builder: (context, state) => const About()),
        Route(path: '/products', title: 'Products | WeMultiply', builder: (context, state) => const Products()),
        Route(path: '/membership', title: 'Membership | WeMultiply', builder: (context, state) => const Membership()),
        Route(path: '/contact', title: 'Contact Us | WeMultiply', builder: (context, state) => const Contact()),
        Route(path: '/faq', title: 'FAQ | WeMultiply', builder: (context, state) => const FAQ()),
      ]),
      const Footer(),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.main', [
      css('&').styles(
        display: .flex,
        minHeight: 100.vh,
        flexDirection: .column,
      ),
      css('section').styles(
        display: .flex,
        flexDirection: .column,
        flex: Flex(grow: 1),
      ),
    ]),
  ];
}
