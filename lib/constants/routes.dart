import 'package:flutter/material.dart'
    show BuildContext, MaterialPageRoute, Route, RouteSettings, Widget;
import 'package:xafe/models/podos/budget.dart';
import 'package:xafe/screens/auth/auth_screen.dart';
import 'package:xafe/screens/auth/login_screen.dart';
import 'package:xafe/screens/auth/signup_code_screen.dart';
import 'package:xafe/screens/auth/signup_email_screen.dart';
import 'package:xafe/screens/auth/signup_password_screen.dart';
import 'package:xafe/screens/auth/signup_screen.dart';
import 'package:xafe/screens/budget/budget_detail_screen.dart';
import 'package:xafe/screens/budget/budget_expense_creation_screen.dart';
import 'package:xafe/screens/budget/bugdet_mutate_screen.dart';
import 'package:xafe/screens/category/category_create_screen.dart';
import 'package:xafe/screens/dashboard/dashboard_page.dart';
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

  ///Dashboard
  static const dashboard = "/dashboard";

  ///Budget
  static const budgetDetail = "/budget/detail";
  static const budgetCreate = "/budget/create";
  static const budgetEdit = "/budget/create";
  static const budgetCreateExpense = "/budget/create/expense";

  ///Category
  static const categoryCreate = "/category/create";

  static Map<String, Widget Function(BuildContext)> staticRoutes = {
    splash: (context) => const SplashScreen(),
    auth: (context) => const AuthScreen(),
    dashboard: (context) => const DashboardScreen(),
    login: (context) => const LoginScreen(),
    signup: (context) => const SignupScreen(),
    signupEmail: (context) => const SignupEmailScreen(),
    signupCode: (context) => const SignupCodeScreen(),
    signupPassword: (context) => const SignupPasswordScreen(),
    budgetCreate: (context) => const BudgetMutateScreen(),
    budgetCreateExpense: (context) => const BudgetExpenseScreen(),
    categoryCreate: (context) => const CategoryCreateScreen(false),
  };

  static Route<dynamic> dynamicRoutes(RouteSettings settings) {
    switch (settings.name) {
      case budgetDetail:
        return MaterialPageRoute(
          builder: (context) {
            return BudgetDetailScreen(settings.arguments as Budget);
          },
        );
      case budgetEdit:
        return MaterialPageRoute(
          builder: (context) {
            return BudgetMutateScreen(budget: settings.arguments as Budget);
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const SplashScreen();
          },
        );
    }
  }
}
