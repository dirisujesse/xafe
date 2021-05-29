import 'package:flutter/material.dart';
import 'package:xafe/constants/routes.dart';
import 'package:xafe/widgets/fragments/inputs/app_text_field.dart';
import 'package:xafe/widgets/layouts/scaffolds/form_scaffold.dart';

class SignupCodeScreen extends StatefulWidget {
  const SignupCodeScreen();

  @override
  State<StatefulWidget> createState() => _SignupCodeScreenState();
}

class _SignupCodeScreenState extends State<SignupCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return SignupFormWidget(
      progress: 3 / 4,
      fields: [XfTextField(hintText: "******")],
      title: "Enter the code",
      onSubmit: () {
        Navigator.of(context).pushNamed(XfRoutes.signupPassword);
      },
      subTitle: "Enter the code sent to your email address",
      legend: "Sign up",
    );
  }
}
