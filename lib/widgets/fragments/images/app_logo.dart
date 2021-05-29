import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xafe/constants/images.dart';

class AppLogo extends StatelessWidget {
  const AppLogo();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(XfSvgs.logo),
    );
  }
}