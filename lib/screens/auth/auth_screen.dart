import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xafe/constants/routes.dart';
import 'package:xafe/style/colors.dart';
import 'package:xafe/style/text_styles.dart';
import 'package:xafe/utils/extensions.dart';
import 'package:xafe/widgets/fragments/buttons/app_button.dart';
import 'package:xafe/widgets/fragments/images/app_logo.dart';
import 'package:xafe/widgets/fragments/spacers/app_sized_box.dart';
import 'package:xafe/widgets/typography/app_text.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen();

  @override
  State<StatefulWidget> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late Timer? timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (timer != null && (timer?.isActive ?? false)) {
      timer?.cancel();
    }
  }

  _goToNext([bool isLogin = false]) {
    Navigator.of(context).pushNamed(isLogin ? XfRoutes.login : XfRoutes.signup);
  }

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return Scaffold(
      backgroundColor: XfColors.black,
      body: Container(
        padding: scaler.insets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AppLogo(),
            XfSizedBox(height: 2.5),
            XfText(
              "Smart Budgeting",
              style: XfTextStyle.bold.copyWith(
                color: XfColors.white,
                fontSize: 52,
              ),
              textAlign: TextAlign.center,
            ),
            XfSizedBox(height: 20),
            XfButton(
              text: "Login",
              onPressed: () {
                _goToNext(true);
              },
            ),
            XfButton.withChild(
              child: Text.rich(
                TextSpan(text: "New here? ", children: [
                  TextSpan(
                    text: "Create an account",
                    style: XfTextStyle.bold.copyWith(color: XfColors.white),
                  )
                ]),
                style: XfTextStyle.regular.copyWith(
                  color: XfColors.white,
                ),
              ),
              color: XfColors.transparent,
              onPressed: _goToNext,
            ),
            XfSizedBox(height: 5),
            XfText(
              "By continuing, you agree to Xafe’s terms of use\nand privacy policy",
              style: XfTextStyle.regular.copyWith(
                color: XfColors.white,
                fontSize: 40,
              ),
              textAlign: TextAlign.center,
            ),
            XfSizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
