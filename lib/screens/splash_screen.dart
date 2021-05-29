import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xafe/style/colors.dart';
import 'package:xafe/widgets/fragments/images/app_logo.dart';
import 'package:xafe/constants/routes.dart';
import 'package:xafe/state/splash/splash_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen();

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer? timer;

  @override
  void initState() {
    super.initState();
    _routingHandler(context);
  }

  @override
  void dispose() {
    super.dispose();
    if (timer != null && (timer?.isActive ?? false)) {
      timer?.cancel();
    }
  }

  void _routingHandler(BuildContext context) {
    timer = Timer(
      Duration(seconds: 1),
      () {
        final isLoggedIn = SplashState.instance.isLoggedIn;
        Navigator.of(context).pushNamedAndRemoveUntil(
          !isLoggedIn ? XfRoutes.auth : XfRoutes.dashboard,
          (_) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XfColors.black,
      body: const AppLogo(),
    );
  }
}
