import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xafe/style/colors.dart';
import 'package:xafe/style/text_styles.dart';
import 'package:xafe/utils/validators.dart';
import 'package:xafe/widgets/fragments/inputs/app_text_field.dart';
import 'package:xafe/widgets/typography/app_text.dart';

class TelephoneInput extends StatefulWidget {
  final TextEditingController controller;
  final ValueNotifier<String>? countryCodeController;

  TelephoneInput(this.controller, {this.countryCodeController});

  @override
  State<StatefulWidget> createState() => _TelephoneInputState();
}

class _TelephoneInputState extends State<TelephoneInput> {
  ValueListenableBuilder<String>? get prefix {
    if (widget.countryCodeController == null) return null;
    return ValueListenableBuilder<String>(
      valueListenable: widget.countryCodeController!,
      builder: (context, String value, _) {
        return Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          direction: Axis.horizontal,
          children: [
            XfText(
              "$value ",
              style: XfTextStyle.regular.copyWith(
                fontSize: 50,
                color: XfColors.black,
              ),
            ),
            Icon(Icons.arrow_drop_down)
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return XfTextField(
      prefix: prefix,
      onPrefixTap: () {
        if (widget.countryCodeController != null) {}
      },
      autoFocus: true,
      label: "PHONE",
      hintText: "(405) 123-4567",
      controller: widget.controller,
      validator: (text) {
        XfValidators.phoneValidator(text,
            countryCode: widget.countryCodeController?.value ?? "");
      },
      inputFormatters: [LengthLimitingTextInputFormatter(15)],
      keyboardType: TextInputType.phone,
    );
  }
}
