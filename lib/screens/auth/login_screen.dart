import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xafe/constants/images.dart';
import 'package:xafe/style/colors.dart';
import 'package:xafe/style/text_styles.dart';
import 'package:xafe/utils/extensions.dart';
import 'package:xafe/widgets/fragments/app_bar/app_appbar.dart';
import 'package:xafe/widgets/fragments/buttons/app_button.dart';
import 'package:xafe/widgets/fragments/buttons/bottom_button.dart';
import 'package:xafe/widgets/fragments/inputs/app_text_field.dart';
import 'package:xafe/widgets/fragments/spacers/app_sized_box.dart';
import 'package:xafe/widgets/typography/app_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen();

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return Scaffold(
      appBar: const XfAppBar(),
      body: SingleChildScrollView(
        padding: scaler.insets.fromLTRB(5, 5, 5, 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            XfText(
              "Welcome back",
              style: XfTextStyle.header.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            XfText(
              "Login to your account",
              style: XfTextStyle.subTitle,
            ),
            XfSizedBox(height: 2),
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
            Align(
              alignment: Alignment.centerRight,
              child: XfButton(
                text: "Forgot password?",
                onPressed: () {},
                isDense: true,
                isBold: false,
                verticalPadding: .2,
                horizontalPadding: 2.2,
                cornerRadius: 80,
                color: XfColors.grey,
                textColor: XfColors.black,
                fontSize: 45,
              ),
              
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomButton(
        onTap: () {},
        text: "Login",
      ),
    );
  }
}
