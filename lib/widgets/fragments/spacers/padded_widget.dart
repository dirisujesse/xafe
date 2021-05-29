import 'package:flutter/material.dart';
import 'package:xafe/utils/extensions.dart';

class PaddedWidget extends StatelessWidget {
  final Widget child;
  final double horizontalPadding;
  final double verticalPadding;

  const PaddedWidget(
    this.child, {
    this.horizontalPadding = 5,
    this.verticalPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;
    return Padding(
      padding: scaler.insets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: child,
    );
  }
}
