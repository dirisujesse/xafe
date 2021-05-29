import 'package:flutter/material.dart';
import 'package:xafe/style/colors.dart';
import 'package:xafe/style/text_styles.dart';
import 'package:xafe/utils/extensions.dart';

class XfTextSpan extends StatelessWidget {
  final List<String> messages;
  final double fontSize;
  final TextAlign textAlign;
  final bool forceLineBreak;

  const XfTextSpan({
    required this.messages,
    this.textAlign = TextAlign.left,
    this.fontSize = 45,
    this.forceLineBreak = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return RichText(
      text: TextSpan(
        children: messages.map(
          (message) {
            final embolden = message.startsWith("(BOLD)");
            if (embolden) {
              message = message.substring(6);
            }
            final appendage = !forceLineBreak
                ? ""
                : message == messages.last
                    ? ""
                    : "\n\n";
            return TextSpan(
              text: "$message$appendage",
              style: embolden
                  ? XfTextStyle.bold.copyWith(
                      color: XfColors.black,
                      fontSize: scaler.fontSizer.sp(fontSize),
                    )
                  : null,
            );
          },
        ).toList(),
        style: XfTextStyle.regular.copyWith(
          color: XfColors.black,
          fontSize: scaler.fontSizer.sp(fontSize),
        ),
      ),
      textAlign: textAlign,
    );
  }
}
