import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xafe/constants/images.dart';
import 'package:xafe/style/colors.dart';
import 'package:xafe/utils/typedefs.dart';

class AppBackButton extends StatelessWidget {
  final Color color;
  final OnPressed? subAction;

  const AppBackButton({this.color = XfColors.black, this.subAction});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(XfSvgs.backArrow, color: color),
      onPressed: () {
        if (subAction != null) {
          subAction!();
        }
        Navigator.of(context).pop();
      },
    );
  }
}