import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xafe/constants/images.dart';
import 'package:xafe/constants/routes.dart';
import 'package:xafe/style/colors.dart';
import 'package:xafe/widgets/fragments/app_bar/app_appbar.dart';
import 'package:xafe/widgets/fragments/buttons/app_pill_button.dart';
import 'package:xafe/widgets/fragments/buttons/bottom_button.dart';
import 'package:xafe/widgets/fragments/inputs/app_text_field.dart';
import 'package:xafe/widgets/fragments/spacers/app_sized_box.dart';
import 'package:xafe/widgets/layouts/scaffolds/form_scaffold.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen();

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const XfAppBar(),
      body: FormWidget(
        fields: [
          XfTextField(hintText: "email address"),
          XfSizedBox(height: 1),
          XfTextField(
            hintText: "password",
            obscureText: true,
            suffix: XfSizedBox(
              width: 5,
              height: 2,
              child: FittedBox(
                child: SvgPicture.asset(
                  XfSvgs.visibility,
                  color: XfColors.black,
                ),
              ),
            ),
          ),
          XfSizedBox(height: 4),
          AppPillButton(onPressed: () {}, text: "Forgot password?"),
        ],
        title: "Welcome back",
        subTitle: "Login to your account",
      ),
      bottomSheet: BottomButton(
        onTap: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
            XfRoutes.dashboard,
            (_) => false,
          );
        },
        text: "Login",
      ),
    );
  }
}
