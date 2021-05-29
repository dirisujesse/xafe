import 'package:flutter/material.dart';
import 'package:xafe/style/colors.dart';
import 'package:xafe/style/text_styles.dart';
import 'package:xafe/utils/extensions.dart';
import 'package:xafe/utils/typedefs.dart';
import 'package:xafe/widgets/fragments/buttons/app_button.dart';
import 'package:xafe/widgets/fragments/spacers/app_sized_box.dart';
import 'package:xafe/widgets/typography/app_text.dart';

class DashboardErrorState extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget? center;
  final OnPressed? onRetry;
  final bool _hasTitle;
  final bool expandIcon;

  DashboardErrorState({
    required this.title,
    required this.subTitle,
    this.center,
    this.onRetry,
    this.expandIcon = true,
  }) : _hasTitle = true;

  DashboardErrorState.noTitle({
    required this.subTitle,
    this.center,
    this.onRetry,
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
        padding: scaler.insets.fromLTRB(5, 3, 5, 2.5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_hasTitle && title.isNotEmpty)
              XfText(
                title,
                style: XfTextStyle.header,
                textAlign: TextAlign.center,
              ),
            const XfSizedBox(height: 1.5),
            if (_hasTitle) _subTitleWidget,
            if (expandIcon)
              Expanded(
                child: Center(
                  child: Icon(
                    Icons.cancel_outlined,
                    size: scaler.sizer.setWidth(30),
                  ),
                ),
              ),
            if (!expandIcon)
              Center(
                child: Icon(
                    Icons.cancel_outlined,
                    size: scaler.sizer.setWidth(30),
                  ),
              ),
            if (!_hasTitle || !expandIcon) const XfSizedBox(height: 4),
            if (!_hasTitle) _subTitleWidget,
            if (!_hasTitle) const XfSizedBox(height: 4),
            XfButton(
              text: "Retry",
              onPressed: onRetry,
              color: XfColors.red,
            ),
          ],
        ),
      ),
    );
  }
}

class AppInlineErrorState extends StatelessWidget {
  final String errorMessage;
  final OnPressed? onRetry;

  AppInlineErrorState({
    required this.errorMessage,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return Padding(
      padding: scaler.insets.fromLTRB(5, 3, 5, 2.5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          XfText(
            errorMessage,
            style: XfTextStyle.body2,
            textAlign: TextAlign.center,
          ),
          XfButton(
            text: "Retry",
            onPressed: onRetry,
            disabledColor: XfColors.transparent,
            color: XfColors.transparent,
            textColor: XfColors.red,
          ),
        ],
      ),
    );
  }
}
