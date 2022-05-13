import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_module/route/routes.dart';
import 'package:test_module/ui/error_view.dart';
import 'package:test_module/ui/home.dart';

// void main() => runApp(new MyApp());
void main() => runApp(chooseWidget(window.defaultRouteName));
Widget chooseWidget(String route) {
  print('object --------- $route');
  switch (route) {
    // name of the route defined in the host app
    case 'home':
      return MyApp();
    case Routes.error:
      return MaterialApp(
        title: 'Flutter Module',
        theme: ThemeData(
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Color(0xff15AE62),
          unselectedWidgetColor: Color(0xffC7C7C7),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ErrorView(),
      );
    default:
      return MyApp();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Module',
      theme: ThemeData(
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Color(0xff15AE62),
        unselectedWidgetColor: Color(0xffC7C7C7),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}


// import 'package:bot_toast/bot_toast.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:route_observer_mixin/route_observer_mixin.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:test_module/route/route_generato.dart';
// import 'package:test_module/route/routes.dart';
// import 'package:test_module/ui/cubit/flickr_cubit.dart';
// import 'package:test_module/ultis/keys.dart';

// Future<void> main() async {
//   EasyLoading.instance
//     ..loadingStyle = EasyLoadingStyle.light
//     ..radius = 10.0
//     ..maskColor = Colors.black.withOpacity(0.7)
//     ..userInteractions = false
//     ..dismissOnTap = false;
//   runZonedGuarded() {
//     runApp(RouteObserverProvider(child: RootApp()));
//   }
// }

// class RootApp extends StatelessWidget {
//   final botToastBuilder = BotToastInit();

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//       statusBarBrightness: Brightness.light,
//       statusBarIconBrightness: Brightness.dark,
//       systemNavigationBarColor: Color(0xff15AE62),
//     ));
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<FlickrCubit>(create: (context)=> FlickrCubit())
//       ],
//       child: MaterialApp(
//         localizationsDelegates: [
//           GlobalCupertinoLocalizations.delegate,
//           GlobalMaterialLocalizations.delegate,
//           GlobalWidgetsLocalizations.delegate,
//         ],
//         title: 'TEST_MODULE',
//         supportedLocales: [
//           const Locale('vi', 'VN'),
//         ],
//         navigatorKey: Keys.navKey,
//         theme: ThemeData(
//           backgroundColor: Colors.white,
//           scaffoldBackgroundColor: Colors.white,
//           primaryColor: Color(0xff15AE62),
//           unselectedWidgetColor: Color(0xffC7C7C7),
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         initialRoute: Routes.home,
//         navigatorObservers: [
//           BotToastNavigatorObserver(),
//           RouteObserverProvider.of(context),
//           // FirebaseAnalyticsObserver(analytics: analytics),
//         ],
//         builder: EasyLoading.init(builder: (context, child) {
//           return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1), child: botToastBuilder(context,child));
//         }),
//         onGenerateRoute: generateRoute,
//       ),
//     );
//   }
// }
