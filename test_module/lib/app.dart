// import 'dart:ui';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:test_module/feature/flic/representation/flic/flic_images_screen.dart';
// import 'package:test_module/route/routes.dart';
// import 'package:test_module/ui/error_view.dart';
// // void main() => runApp(new MyApp());
// Widget chooseWidget(String route) {
//   print('object --------- $route');
//   switch (route) {
//     // name of the route defined in the host app
//     case 'home':
//       return MyApp();
//     case Routes.error:
//       return MaterialApp(
//         title: 'Flutter Module',
//         theme: ThemeData(
//           backgroundColor: Colors.white,
//           scaffoldBackgroundColor: Colors.white,
//           primaryColor: Color(0xff15AE62),
//           unselectedWidgetColor: Color(0xffC7C7C7),
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         home: ErrorView(),
//       );
//     default:
//       return MyApp();
//   }
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Module',
//       theme: ThemeData(
//         backgroundColor: Colors.white,
//         scaffoldBackgroundColor: Colors.white,
//         primaryColor: Color(0xff15AE62),
//         unselectedWidgetColor: Color(0xffC7C7C7),
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: FlicImagesScreen(),
//     );
//   }
// }

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:route_observer_mixin/route_observer_mixin.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:test_module/base/routes/navigation_service.dart';
import 'package:test_module/feature/digital_lending/representation/blocs/lending_bloc.dart';
import 'package:test_module/feature/flic/domain/usecase/get_flic_images.dart';
import 'package:test_module/feature/flic/representation/blocs/flic_bloc.dart';
import 'package:test_module/base/routes/route_generato.dart';
import 'package:test_module/base/routes/routes.dart';
import 'package:test_module/ui/cubit/flickr_cubit.dart';
import 'package:test_module/ultis/hide_keyboard.dart';
import 'package:test_module/ultis/keys.dart';

class RootApp extends StatelessWidget {
  // final botToastBuilder = BotToastInit();

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    //   statusBarBrightness: Brightness.light,
    //   statusBarIconBrightness: Brightness.dark,
    //   systemNavigationBarColor: Color(0xff15AE62),
    // ));
    return MultiBlocProvider(
      providers: [
        BlocProvider<FlicBloc>(
            create: (context) => FlicBloc(
                getFlicImagesUseCase: GetIt.I<GetFlicImagesUseCase>())),
        BlocProvider<LendingBloc>(create: (context) => LendingBloc()),
      ],
      child: GestureDetector(
        onTap: () {
          hideKeyboard(context);
        },
        child: MaterialApp(
          localizationsDelegates: [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          title: 'TEST_MODULE',
          supportedLocales: [
            const Locale('vi', 'VN'),
          ],
          navigatorKey: NavigationService.globalNavigatorKey,
          theme: ThemeData(
            backgroundColor: Colors.white,
            scaffoldBackgroundColor: Colors.white,
            primaryColor: Color(0xff15AE62),
            unselectedWidgetColor: Color(0xffC7C7C7),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: Routes.lendingPage,
          navigatorObservers: [
            RouteObserverProvider.of(context),
          ],
          onGenerateRoute: generateRoute,
          builder:
              EasyLoading.init(builder: (BuildContext context, Widget? child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
              child: child!,
            );
          }),
        ),
      ),
    );
  }
}
