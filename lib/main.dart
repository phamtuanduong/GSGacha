import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:hs_gacha/cores/common/config.dart';
import 'package:hs_gacha/cores/common/constants.dart';
import 'package:hs_gacha/cores/init_app.dart';
import 'routes/app_pages.dart';

Future<void> main() async {
  await initApp();

  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const GenshinGachaApp());
}

class GenshinGachaApp extends StatefulWidget {
  const GenshinGachaApp({Key? key}) : super(key: key);

  @override
  GenshinGachaAppState createState() => GenshinGachaAppState();
}

class GenshinGachaAppState extends State<GenshinGachaApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      // translationsKeys: AppTranslation.translationKeys,
      opaqueRoute: true,
      popGesture: true,
      builder: (context, child) {
        return FlutterSmartDialog(
          child: Scaffold(
            body: GestureDetector(
              onTap: () {
                hideKeyboard(context);
                Constants.buildContext = context;
              },
              child: child,
            ),
          ),
        );
      },
      // localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
      // defaultTransition: transit.Transition.fade,
      locale: const Locale('vi', 'VN'),
      fallbackLocale: const Locale('vi', 'VN'),
      initialRoute: AppPages.INITIAL,
      // initialBinding: NetworkBinding(),
      getPages: AppPages.routes,
      theme: ThemeData.from(
          colorScheme: const ColorScheme.dark(), textTheme: Config.black),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
