import 'package:flutter/material.dart';
import 'package:xafe/utils/extensions.dart';
import 'package:xafe/utils/typedefs.dart';
import 'package:xafe/widgets/fragments/buttons/app_button.dart';

class BottomButton extends StatelessWidget {
  final OnPressed? onTap;
  final String? text;
  final EdgeInsetsGeometry? padding;

  const BottomButton({
    required this.onTap,
    this.text,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return Container(
      width: double.infinity,
      padding: padding ?? scaler.insets.fromLTRB(5, 0, 5, 8),
      child: XfButton(
        text: text ?? "Next",
        onPressed: onTap,
      ),
    );
  }
}
