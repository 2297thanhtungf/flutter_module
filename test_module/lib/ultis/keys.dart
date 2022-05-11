import 'package:flutter/material.dart';

class Keys {
  static final navKey = new GlobalKey<NavigatorState>();

  static BuildContext? getContext() {
    return navKey.currentContext;
  }
}
