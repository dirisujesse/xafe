import 'package:flutter/material.dart';
import 'package:xafe/constants/routes.dart';
import 'package:xafe/widgets/fragments/buttons/app_pill_button.dart';
import 'package:xafe/widgets/fragments/inputs/app_text_field.dart';
import 'package:xafe/widgets/fragments/spacers/app_sized_box.dart';
import 'package:xafe/widgets/layouts/scaffolds/form_scaffold.dart';

class SignupPasswordScreen extends StatefulWidget {
  const SignupPasswordScreen();

  @override
  State<StatefulWidget> createState() => _SignupPasswordScreenState();
}

class _SignupPasswordScreenState extends State<SignupPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return SignupFormWidget(
      progress: 4 / 4,
      fields: [
        XfTextField(hintText: "******"),
        XfSizedBox(height: 4),
        AppPillButton(onPressed: () {}, text: "Show password"),
      ],
      title: "Add a Password",
      onSubmit: () {
        Navigator.of(context).pushNamedAndRemoveUntil(
          XfRoutes.dashboard,
          (_) => false,
        );
      },
      subTitle: "Enter password",
      legend: "Sign up",
      btnText: "Signup",
    );
  }
}
