import 'package:flutter/material.dart';

class NavigationService {
  static final globalNavigatorKey = GlobalKey<NavigatorState>();

  /// Returns value from pop if exists.
  /// [clean] is true to remove all back stacks after pushing
  /// [replace] is true to replace the current route by new route
  ///
  /// How to use:
  /// 1. Push:
  /// NavigationService.push(Routes.home);
  /// 2. Push replacement
  /// NavigationService.push(Routes.home, replace: true);
  /// 3. Push replace back stack
  /// NavigationService.push(Routes.home, clean: true);
  /// 4. Push replace remove util
  /// NavigationService.push(Routes.home, replace: true, clean: true);
  ///
  static Future<T?>? push<T extends Object>(
    String route, {
    dynamic arguments,
    bool replace = false,
    bool clean = false,
  }) async {
    if (clean) {
      return globalNavigatorKey.currentState?.pushNamedAndRemoveUntil(
        route,
        (_) => false,
        arguments: arguments,
      );
    }

    if (replace) {
      return globalNavigatorKey.currentState?.pushReplacementNamed(
        route,
        arguments: arguments,
      );
    }

    return globalNavigatorKey.currentState?.pushNamed(
      route,
      arguments: arguments,
    );
  }

  static Future<T?>? pushNamedAndRemoveUntil<T extends Object>(String route,
      {dynamic arguments, required String oldRoute}) {
    return Navigator.of(globalNavigatorKey.currentContext!)
        .pushNamedAndRemoveUntil(
      route,
      (old) => old.settings.name == oldRoute,
      arguments: arguments,
    );
  }

  static void pop({dynamic data}) {
    if (globalNavigatorKey.currentState!.canPop()) {
      globalNavigatorKey.currentState!.pop(data);
    }
  }
}
