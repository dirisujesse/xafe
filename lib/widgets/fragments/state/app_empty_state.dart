import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xafe/constants/images.dart';
import 'package:xafe/style/text_styles.dart';
import 'package:xafe/utils/extensions.dart';
import 'package:xafe/widgets/fragments/spacers/app_sized_box.dart';
import 'package:xafe/widgets/typography/app_text.dart';

class DashboardEmptyState extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget? center;
  final Widget? button;
  final bool _hasTitle;
  final bool expandIcon;

  DashboardEmptyState({
    required this.title,
    required this.subTitle,
    this.center,
    this.button,
    this.expandIcon = true,
  }) : _hasTitle = true;

  DashboardEmptyState.noTitle({
    required this.subTitle,
    this.center,
    this.button,
    this.expandIcon = true,
  })  : title = "",
        _hasTitle = false;

  XfText get _subTitleWidget {
    return XfText(
      subTitle,
      style: XfTextStyle.body2,
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: scaler.insets.fromLTRB(5, 3, 5, _hasTitle ? 2.5 : 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_hasTitle)
              XfText(
                title,
                style: XfTextStyle.header,
                textAlign: TextAlign.center,
              ),
            const XfSizedBox(height: 1.5),
            if (_hasTitle) _subTitleWidget,
            if (expandIcon)
              Expanded(child: center ?? SvgPicture.asset(XfSvgs.trash)),
            if (!expandIcon) center ?? SvgPicture.asset(XfSvgs.trash),
            if (!_hasTitle || !expandIcon) const XfSizedBox(height: 4),
            if (!_hasTitle) _subTitleWidget,
            if (!_hasTitle) const XfSizedBox(height: 4),
            button ?? Offstage(),
          ],
        ),
      ),
    );
  }
}
