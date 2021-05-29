import 'package:flutter/material.dart';
import 'package:xafe/models/config/app_config.dart';
import 'package:xafe/models/enums/env.dart';
// import 'package:xafe/services/gallery/gallery_service.dart';
import 'package:xafe/state/auth/auth_state.dart';
import 'package:xafe/state/dashboard/dashboard_state.dart';
import 'package:xafe/state/splash/splash_state.dart';
import 'package:provider/provider.dart';

class StateWrapper extends StatelessWidget {
  final Widget child;

  StateWrapper({
    required this.child,
    bool isMock = false,
    Environment env = Environment.DEVELOPMENT,
  }) {
    AppConfig.init(isMock: isMock, env: env);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SplashState.instance,
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (_) => AuthState.instance,
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (_) => DashboardState.instance,
          lazy: true,
        ),
      ],
      child: child,
    );
  }
}
