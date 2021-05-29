import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xafe/constants/routes.dart';
import 'package:xafe/models/enums/env.dart';
import 'package:xafe/services/storage/storage_service.dart';
import 'package:xafe/style/themedata.dart';
import 'package:xafe/utils/state_wrapper.dart';

void main() {
  startApp();
}

void startApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.setupHive();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(XafeApp());
}

class XafeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateWrapper(
      child: MaterialApp(
        title: 'Xafe',
        home: XfRoutes.home,
        theme: XfThemes.defaultTheme,
        debugShowCheckedModeBanner: false,
        routes: XfRoutes.staticRoutes,
        onGenerateRoute: XfRoutes.dynamicRoutes,
      ),
      isMock: false,
      env: Environment.PRODUCTION,
    );
  }
}
