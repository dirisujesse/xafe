import 'package:flutter/material.dart';
import 'package:xafe/constants/routes.dart';
import 'package:xafe/widgets/fragments/inputs/app_text_field.dart';
import 'package:xafe/widgets/layouts/scaffolds/form_scaffold.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen();

  @override
  State<StatefulWidget> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return SignupFormWidget(
      progress: 1 / 4,
      fields: [XfTextField(hintText: "Drew McIntyre")],
      title: "Whats's your name?",
      onSubmit: () {
        Navigator.of(context).pushNamed(XfRoutes.signupEmail);
      },
      subTitle: "Enter your first name and last name",
      legend: "Sign up",
    );
  }
}
