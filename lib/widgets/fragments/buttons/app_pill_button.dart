import 'package:flutter/widgets.dart';
import 'package:xafe/style/colors.dart';
import 'package:xafe/utils/typedefs.dart';
import 'package:xafe/widgets/fragments/buttons/app_button.dart';

class AppPillButton extends StatelessWidget {
  final OnPressed onPressed;
  final String text;
  final Color textColor;
  final Color backgroundColor;

  const AppPillButton({
    required this.onPressed,
    required this.text,
    this.backgroundColor = XfColors.grey,
    this.textColor = XfColors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: XfButton(
        text: text,
        onPressed: onPressed,
        isDense: true,
        isBold: false,
        verticalPadding: .2,
        horizontalPadding: 2.2,
        cornerRadius: 80,
        color: backgroundColor,
        textColor: textColor,
        fontSize: 45,
      ),
    );
  }
}
