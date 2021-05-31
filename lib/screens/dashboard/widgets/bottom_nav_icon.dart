import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xafe/style/style.dart';

class BottomNavIcon extends StatelessWidget {
  final String svg;
  final bool isActive;

  const BottomNavIcon(this.svg, this.isActive);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(
        svg,
        color: isActive ? XfColors.black : XfColors.darkGrey,
      ),
    );
  }
}