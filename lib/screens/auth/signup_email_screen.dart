import 'package:flutter/material.dart';
import 'package:xafe/constants/routes.dart';
import 'package:xafe/widgets/fragments/inputs/app_text_field.dart';
import 'package:xafe/widgets/layouts/scaffolds/form_scaffold.dart';

class SignupEmailScreen extends StatefulWidget {
  const SignupEmailScreen();

  @override
  State<StatefulWidget> createState() => _SignupEmailScreenState();
}

class _SignupEmailScreenState extends State<SignupEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return SignupFormWidget(
      progress: 2 / 4,
      fields: [XfTextField(hintText: "user@example.com")],
      title: "What’s your email?",
      onSubmit: () {
        Navigator.of(context).pushNamed(XfRoutes.signupCode);
      },
      subTitle: "Enter your email address",
      legend: "Sign up",
    );
  }
}
