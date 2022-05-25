import 'package:flutter/material.dart';

Future<void> hideKeyboard(BuildContext context) async {
  // FocusScope.of(context).requestFocus(FocusNode());
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
  await Future.delayed(Duration(milliseconds: 500)).then((value) {});
}
