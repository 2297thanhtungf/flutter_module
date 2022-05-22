import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:test_module/feature/flic/representation/flic/flic_images_screen.dart';
import 'package:test_module/route/routes.dart';
import 'package:test_module/ui/error_view.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  final dynamic args = settings.arguments;
  switch (settings.name) {
    case Routes.home:
      return defaultBuilder(settings: settings, screen: FlicImagesScreen()); 
    case Routes.error:
      return defaultBuilder(settings: settings, screen: ErrorView()); 

  }
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
