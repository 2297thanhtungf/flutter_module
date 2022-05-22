import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:test_module/app.dart';
import 'package:test_module/ultis/app_locale.dart';
import 'package:test_module/ultis/flavor_config.dart';

import 'di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await FlavorConfig.instance.init(Flavors.prod);
  //TODO get Header
  setupLocator(flavorConfig: FlavorConfig.instance);
  // setPathUrlStrategy();

  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.light
    ..radius = 10.0
    ..maskColor = Color(0xff231F20).withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;

  runApp(EasyLocalization(
      supportedLocales: const [AppLocales.vi],
      path: 'AppPaths.assetTranslationsPath',
      fallbackLocale: AppLocales.vi,
      child:  chooseWidget('') ));
}
