import 'package:flutter/material.dart';
import 'package:xafe/style/colors.dart';
import 'package:xafe/widgets/fragments/buttons/app_button.dart';
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
        Align(
          alignment: Alignment.centerRight,
          child: XfButton(
            text: "Show password?",
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
      title: "Add a Password",
      onSubmit: () {},
      subTitle: "Enter password",
      legend: "Sign up",
    );
  }
}
