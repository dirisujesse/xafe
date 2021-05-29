import 'package:flutter/material.dart';
import 'package:xafe/models/enums/message_type.dart';
import 'package:xafe/style/colors.dart';
import 'package:xafe/style/text_styles.dart';
import 'package:xafe/utils/dimensions.dart';
import 'package:xafe/utils/extensions.dart';
import 'package:xafe/widgets/fragments/buttons/app_button.dart';
import 'package:xafe/widgets/fragments/indicators/app_spinner.dart';
import 'package:xafe/widgets/fragments/spacers/app_sized_box.dart';
import 'package:xafe/widgets/typography/app_text.dart';

class DialogMessage extends StatelessWidget {
  final dynamic message;
  final String title;
  final MessageType messageType;
  final TextAlign textAlign;
  final bool _isConfirm;

  DialogMessage({
    required this.message,
    required this.title,
    this.messageType = MessageType.Info,
    this.textAlign = TextAlign.center,
  }) : _isConfirm = false;

  DialogMessage.confirm({
    required this.message,
    required this.title,
    this.messageType = MessageType.Info,
    this.textAlign = TextAlign.center,
  }) : _isConfirm = true;

  String _parsedMessage() {
    if (message is String) {
      return message;
    } else if (message is Map || message is List) {
      final List<String> messageArr = message is Map
          ? message.values.map((it) => "$it").toList()
          : message.map((it) => "$it").toList();
      return messageArr.join("; ");
    } else {
      return "";
    }
  }

  Widget _messageIcon(XfScaleUtil scaler) {
    switch (messageType) {
      case MessageType.Error:
        return Icon(Icons.cancel_outlined, size: scaler.sizer.setHeight(10),);
      case MessageType.Success:
        return Icon(
          Icons.check,
          size: scaler.sizer.setHeight(10),
        );
      case MessageType.Warning:
        return Icon(
          Icons.warning,
          size: 30,
          color: XfColors.red.withGreen(100),
        );
      case MessageType.Pending:
        return const AppSpinner();
      default:
        return Icon(
          Icons.notifications,
          size: 30,
          color: XfColors.black,
        );
    }
  }

  Widget _progressIcon() {
    switch (messageType) {
      case MessageType.Error:
        return AppLinearProgress(
          extent: 1,
          valueColor: XfColors.red,
        );
      case MessageType.Success:
        return AppLinearProgress(
          extent: 1,
        );
      case MessageType.Warning:
        return AppLinearProgress(
          extent: 1,
          valueColor: XfColors.red.withGreen(150),
        );
      case MessageType.Pending:
        return AppLinearProgress();
      default:
        return AppLinearProgress();
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizer = context.scaler;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:
          _isConfirm ? CrossAxisAlignment.stretch : CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const XfSizedBox(height: 1),
        if (!_isConfirm) _progressIcon(),
        if (!_isConfirm) const XfSizedBox(height: 3),
        if (!_isConfirm) _messageIcon(sizer),
        if (title != "") const XfSizedBox(height: 2),
        if (title != "")
          Flexible(
            child: XfText(
              title,
              textAlign: TextAlign.center,
              style: XfTextStyle.header60.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        if (_parsedMessage() != "") const XfSizedBox(height: 2),
        if (_parsedMessage() != "")
          Flexible(
            child: XfText(
              _parsedMessage(),
              textAlign: TextAlign.center,
              style: XfTextStyle.subTitle.copyWith(height: 1.3),
            ),
          ),
        if (_isConfirm) const XfSizedBox(height: 3),
        if (_isConfirm)
          XfButton(
            text: "Proceed",
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          )
      ],
    );
  }
}
