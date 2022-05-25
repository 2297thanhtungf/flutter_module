import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_module/feature/digital_lending/representation/lending/lending_page.dart';
import 'package:test_module/feature/digital_lending/representation/loan_info/loan_page.dart';
import 'package:test_module/feature/flic/representation/flic/flic_images_screen.dart';
import 'package:test_module/base/routes/routes.dart';
import 'package:test_module/ui/error_view.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  final dynamic args = settings.arguments;
  Uri uri = Uri.parse(settings.name!);
  print('========== path:${uri.path}');
  switch (uri.path) {
    case Routes.home:
      return _buildRoute(settings: settings, screen: FlicImagesScreen());
    case Routes.lendingPage:
      return _buildRoute(settings: settings, screen: LendingPage());
    case Routes.loanPage:
      return _buildRoute(settings: settings, screen: LoanInfoPage());
    case Routes.error:
      return _buildRoute(settings: settings, screen: ErrorView());
      default:
      return _errorRoute();
  }
}
Route<Object>? _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text('ERROR'),
      ),
    );
  });
}
Route<Object>? _buildRoute(
    {required RouteSettings settings, required Widget screen}) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) {
      return screen;
    },
  );
}

dynamic defaultBuilder(
    {required RouteSettings settings, required Widget screen}) {
  assert(settings != null, 'Setting is required');

  return Platform.isIOS
      ? CupertinoPageRoute(
          builder: (context) => screen,
          settings: settings,
        )
      : PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 300),
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => screen,
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
}
// PageRouteBuilder slideRightRouterBuilder(
//     {@required RouteSettings settings, @required Widget screen}) {
//   assert(settings != null, 'Setting is required');

//   return Platform.isIOS
//       ? CupertinoPageRoute(
//           builder: (context) => screen,
//           settings: settings,
//         )
//       : PageTransition(
//           type: PageTransitionType.rightToLeft,
//           duration: Duration(milliseconds: 500),
//           child: screen,
//           settings: settings);
// }

PageRouteBuilder fadeInRouterBuilder(
    {required RouteSettings settings, required Widget screen}) {
  assert(settings != null, 'Setting is required');

  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 300),
    settings: settings,
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
