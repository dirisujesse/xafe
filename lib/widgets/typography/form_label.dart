import 'package:flutter/material.dart';
import 'package:xafe/style/colors.dart';
import 'package:xafe/style/text_styles.dart';
import 'package:xafe/widgets/typography/app_text.dart';

class FormLabel extends StatelessWidget {
  final Color color;
  final String label;

  const FormLabel({this.color = XfColors.black, required this.label});

  @override
  Widget build(BuildContext context) {
    return XfText(
      label,
      style: XfTextStyle.regular.copyWith(
        fontSize: 40,
        color: color,
      ),
    );
  }
}
