import 'package:flutter/material.dart';
import 'package:xafe/utils/extensions.dart';
import 'package:xafe/widgets/typography/app_text.dart';

class ButtonText extends StatelessWidget {
  final double fontSize;
  final Color? textColor;
  final Widget? icon;
  final FontWeight fontWeight;
  final String? text;
  final bool fitted;

  ButtonText(
    this.text, {
    this.fontSize = 50,
    this.textColor,
    this.icon,
    this.fontWeight = FontWeight.w500,
    this.fitted = true,
  });

  Widget _iconBtnChild(TextStyle? btnTheme, BuildContext context) {
    final fontSizer = context.scaler.fontSizer;
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
            child: icon ?? Offstage(),
          ),
          TextSpan(
            text: "  ${text ?? "Tap"}",
          ),
        ],
      ),
      textAlign: TextAlign.center,
      style: btnTheme?.copyWith(
        fontSize: fontSizer.sp(fontSize),
        color: textColor,
        fontWeight: fontWeight,
      ),
      maxLines: 1,
    );
  }

  Widget _child(TextStyle? btnTheme) {
    return XfText(
      text ?? "Tap",
      textAlign: TextAlign.center,
      style: btnTheme?.copyWith(
        fontSize: fontSize,
        color: textColor,
        fontWeight: fontWeight,
      ),
      maxLines: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    final btnTheme = Theme.of(context).textTheme.button;
    final _descendant = icon != null ? _iconBtnChild(btnTheme, context) : _child(btnTheme);
    return fitted ? FittedBox(child: _descendant) : _descendant;
  }
}
