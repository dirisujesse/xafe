import 'package:flutter/material.dart';
import 'package:xafe/style/colors.dart';
import 'package:xafe/style/text_styles.dart';
import 'package:xafe/widgets/typography/app_text.dart';

class BottomNavText extends StatelessWidget {
  final String label;
  final bool isActive;

  const BottomNavText(this.label, this.isActive);
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: XfText(
        label,
        style: XfTextStyle.regular.copyWith(
          color: isActive ? XfColors.black : XfColors.darkGrey,
          fontSize: 40,
        ),
      ),
    );
  }
}
