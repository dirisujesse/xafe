import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xafe/style/colors.dart';
import 'package:xafe/style/text_styles.dart';
import 'package:xafe/utils/extensions.dart';
import 'package:xafe/widgets/fragments/buttons/app_back_button.dart';

class XfAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? supTitle;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? leadingColor;
  final Color? textColor;
  final Brightness? brightness;
  final bool implyLeading;
  final double? titleSize;
  final FontWeight? titleFontWeight;

  const XfAppBar({
    Key? key,
    this.title,
    this.supTitle,
    this.implyLeading = true,
    this.titleSize,
    this.titleFontWeight,
    this.actions,
    this.leading,
    this.backgroundColor = XfColors.white,
    this.leadingColor = XfColors.black,
    this.textColor = XfColors.black,
    this.brightness,
  }) : super(key: key);

  Widget _leading(BuildContext context) {
    if (leading != null) return leading!;
    if (implyLeading) {
      return AppBackButton(color: leadingColor!);
    }
    return Offstage();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: _leading(context),
      centerTitle: true,
      elevation: 0,
      brightness: brightness ?? Brightness.light,
      backgroundColor: backgroundColor,
      title: Text.rich(
        TextSpan(
          children: [
            if (supTitle != null)
              TextSpan(
                text: "$supTitle\n",
                style: XfTextStyle.body.copyWith(
                  fontFamily: XfFonts.euclid,
                  fontSize: context.scaler.fontSizer.sp(45),
                  color: XfColors.black,
                ),
              ),
            TextSpan(
              text: title,
              style: TextStyle(
                fontFamily: XfFonts.euclid,
                fontSize: context.scaler.fontSizer.sp(titleSize ?? 55),
                color: textColor,
                fontWeight: titleFontWeight ?? FontWeight.bold,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize {
    return Size(double.infinity, 50);
  }
}
