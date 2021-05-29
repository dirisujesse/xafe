import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xafe/style/colors.dart';
import 'package:xafe/utils/extensions.dart';

class AppSpinner extends StatelessWidget {
  const AppSpinner();

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return Center(
      child: SizedBox(
        height: scaler.sizer.setHeight(8),
        width: scaler.sizer.setHeight(8),
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          backgroundColor: XfColors.grey,
          valueColor: AlwaysStoppedAnimation<Color>(XfColors.black),
        ),
      ),
    );
  }
}

class AppLinearProgress extends StatelessWidget {
  final double? extent;
  final double width;
  final Color valueColor;

  const AppLinearProgress({
    this.extent,
    this.valueColor = XfColors.black,
    this.width = 100,
  });

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return Center(
      child: SizedBox(
        height: scaler.sizer.setHeight(1.2),
        width: scaler.sizer.setWidth(width),
        child: ClipRRect(
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(
              scaler.fontSizer.sp(20),
            ),
            left: Radius.circular(
              scaler.fontSizer.sp(20),
            ),
          ),
          child: LinearProgressIndicator(
            backgroundColor: XfColors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(valueColor),
            value: extent,
          ),
        ),
      ),
    );
  }
}
