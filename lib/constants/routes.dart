import 'package:flutter/material.dart'
    show BuildContext, MaterialPageRoute, Route, RouteSettings, Widget;
import 'package:xafe/screens/auth/auth_screen.dart';
import 'package:xafe/screens/auth/login_screen.dart';
import 'package:xafe/screens/auth/signup_code_screen.dart';
import 'package:xafe/screens/auth/signup_email_screen.dart';
import 'package:xafe/screens/auth/signup_password_screen.dart';
import 'package:xafe/screens/auth/signup_screen.dart';
import 'package:xafe/screens/splash_screen.dart';

class XfRoutes {
  static Widget home = SplashScreen();

  /// Splash Routes
  static const splash = "/splash";

  /// Auth Routes
  static const auth = "/auth";
  static const login = "/login";
  static const signup = "/register";
  static const signupEmail = "/register/email";
  static const signupCode = "/register/code";
  static const signupPassword = "/register/password";

  /// Otp Routes
  static const verifyOtp = "/verify/otp";

  ///Dashboard-More
  static const dashboard = "/dashboard";

  static Map<String, Widget Function(BuildContext)> staticRoutes = {
    splash: (context) => const SplashScreen(),
    auth: (context) => const AuthScreen(),
    login: (context) => const LoginScreen(),
    signup: (context) => const SignupScreen(),
    signupEmail: (context) => const SignupEmailScreen(),
    signupCode: (context) => const SignupCodeScreen(),
    signupPassword: (context) => const SignupPasswordScreen(),
  };

  static Route<dynamic> dynamicRoutes(RouteSettings settings) {
    switch (settings.name) {
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const SplashScreen();
          },
        );
    }
  }
}
