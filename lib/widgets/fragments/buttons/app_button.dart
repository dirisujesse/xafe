import 'package:flutter/material.dart';
import 'package:xafe/style/colors.dart';
import 'package:xafe/utils/extensions.dart';
import 'package:xafe/utils/typedefs.dart';
import 'package:xafe/widgets/typography/button_text.dart';

class XfButton extends StatelessWidget {
  final OnPressed? onPressed;
  final Color color;
  final Widget? icon;
  final Widget? child;
  final Color disabledColor;
  final Color textColor;
  final Color borderColor;
  final String text;
  final bool isDense;
  final bool isFitted;
  final bool isBold;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double fontSize;
  final double cornerRadius;
  final bool? isBordered;

  const XfButton({
    required this.text,
    required this.onPressed,
    this.icon,
    this.color = XfColors.blue,
    this.textColor = XfColors.white,
    this.disabledColor = XfColors.grey,
    this.isDense = false,
    this.isBold = true,
    this.isFitted = true,
    this.verticalPadding,
    this.horizontalPadding,
    this.fontSize = 50,
    this.cornerRadius = 40,
    this.isBordered = false,
    this.borderColor = XfColors.blue,
    Key? key,
  }) : child = null, super(key: key);

  XfButton.withChild({
    required this.onPressed,
    required this.child,
    this.icon,
    this.color = XfColors.blue,
    this.disabledColor = XfColors.grey,
    this.isDense = false,
    this.isBold = true,
    this.isFitted = true,
    this.verticalPadding,
    this.horizontalPadding,
    this.fontSize = 50,
    this.cornerRadius = 0,
    this.isBordered = false,
    this.borderColor = XfColors.blue,
    Key? key,
  }) : text = "", textColor = XfColors.transparent, super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: !isBordered!
            ? MaterialStateProperty.all<Color>(
                onPressed == null ? disabledColor : color,
              )
            : MaterialStateProperty.all<Color>(
                XfColors.white,
              ),
        elevation: MaterialStateProperty.all<double>(0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              scaler.fontSizer.sp(cornerRadius),
            ),
            side:
                !isBordered! //Check if [isBorderd is false], since in most cases it will be false.
                    ? BorderSide.none
                    : BorderSide(
                        color: borderColor,
                      ),
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          scaler.insets.symmetric(
            vertical: verticalPadding ?? (isDense ? 1.8 : 2),
            horizontal: horizontalPadding ?? 8,
          ),
        ),
      ),
      child: child ?? ButtonText(
        text,
        textColor: onPressed != null ? textColor : XfColors.darkGrey,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontSize: fontSize,
        fitted: isFitted,
        icon: icon,
      ),
      onPressed: onPressed != null
          ? () {
              FocusScope.of(context).requestFocus(FocusNode());
              onPressed!();
            }
          : null,
    );
  }
}
