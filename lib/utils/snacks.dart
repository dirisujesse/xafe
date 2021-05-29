import 'package:flutter/material.dart';
import 'package:xafe/models/enums/snack_type.dart';
import 'package:xafe/style/colors.dart';
import 'package:xafe/widgets/typography/app_text.dart';

const List<Color> _colors = [
  XfColors.black,
  XfColors.red,
  XfColors.blue,
  XfColors.green,
  XfColors.orange,
];

Color _getTextColor(SnackType type) {
  if (type == SnackType.Warning) {
    return XfColors.black;
  }
  return XfColors.white;
}

showSnack({
  required BuildContext context,
  required String message,
  SnackType type = SnackType.Info,
  SnackBarAction? action,
  bool isFloating = true,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      action: action,
      behavior: SnackBarBehavior.floating,
      content: XfText(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(color: _getTextColor(type)),
      ),
      backgroundColor: _colors[SnackType.values.indexOf(type)],
    ),
  );
}
