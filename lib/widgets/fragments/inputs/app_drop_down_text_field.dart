import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xafe/models/podos/focus.dart';
import 'package:xafe/style/colors.dart';
import 'package:xafe/style/text_styles.dart';
import 'package:xafe/utils/extensions.dart';
import 'package:xafe/utils/typedefs.dart';
import 'package:xafe/widgets/fragments/spacers/app_sized_box.dart';
import 'package:xafe/widgets/typography/form_label.dart';

class XfDropDownTextField extends StatefulWidget {
  final TextEditingController? controller;
  final bool isEnabled;
  final InputDecoration? decoration;
  final TextCapitalization? textCapitalization;
  final String label;
  final String? hintText;
  final Widget? prefix;
  final OnValidate<String?>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? maxLength;
  final OnChanged<String?>? onChanged;
  final TextStyle? style;
  final TextAlign? textAlign;
  final String? semanticsLabel;
  final VoidCallback? onDropDownTapped;

  TextEditingController get ctrl {
    return controller ?? TextEditingController();
  }

  const XfDropDownTextField({
    Key? key,
    this.semanticsLabel,
    this.decoration,
    this.textCapitalization,
    this.controller,
    this.isEnabled = true,
    this.inputFormatters,
    required this.label,
    this.hintText,
    this.textAlign = TextAlign.left,
    this.maxLines = 1,
    this.maxLength,
    this.onChanged,
    this.prefix,
    this.validator,
    this.style,
    this.onDropDownTapped,
  }) : super(key: key);

  @override
  _XfDropDownTextFieldState createState() => _XfDropDownTextFieldState();
}

class _XfDropDownTextFieldState extends State<XfDropDownTextField>
    with WidgetsBindingObserver {
  final _inputFocus = FocusNode();
  final ValueNotifier<FocusState> _hasFocus = ValueNotifier(FocusState());

  @override
  void initState() {
    super.initState();
    _inputFocus.addListener(
      () {
        _hasFocus.value = FocusState(
          hasText: widget.ctrl.text.isNotEmpty,
          isFocused: _inputFocus.hasFocus,
        );
      },
    );
  }

  InputDecoration get decoration {
    return widget.decoration ?? InputDecoration();
  }

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return Semantics(
      label: widget.semanticsLabel ?? "Input Field",
      child: ValueListenableBuilder(
        valueListenable: _hasFocus,
        builder: (context, FocusState value, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              FormLabel(
                color: (value.hasError ?? false)
                    ? XfColors.red
                    : (value.isFocused ?? false)
                        ? XfColors.black
                        : XfColors.black,
                label: widget.label,
              ),
              const XfSizedBox(height: .5),
              child!,
            ],
          );
        },
        child: GestureDetector(
          onTap: widget.onDropDownTapped == null
              ? null
              : () => widget.onDropDownTapped!(),
          child: Container(
            color: XfColors.transparent,
            child: IgnorePointer(
              child: TextFormField(
                textDirection: TextDirection.ltr,
                showCursor: true,
                textAlign: widget.textAlign ?? TextAlign.left,
                focusNode: _inputFocus,
                textCapitalization:
                    widget.textCapitalization ?? TextCapitalization.none,
                style: widget.style ??
                    XfTextStyle.regular.copyWith(
                      fontSize: scaler.fontSizer.sp(50),
                      color: XfColors.black,
                    ),
                maxLength: widget.maxLength,
                controller: widget.ctrl,
                enabled: widget.isEnabled,
                inputFormatters: widget.inputFormatters,
                maxLines: widget.maxLines,
                onChanged: widget.onChanged,
                decoration: decoration.copyWith(
                  hintStyle: XfTextStyle.regular.copyWith(
                    fontSize: scaler.fontSizer.sp(50),
                    color: XfColors.ash,
                  ),
                  suffixIcon: UnconstrainedBox(
                    child: Icon(Icons.arrow_drop_down),
                  ),
                  prefix: widget.prefix,
                  counter: null,
                  hintText: widget.hintText,
                ),
                validator: (String? text) {
                  if (widget.validator != null) {
                    final error = widget.validator!(text);
                    _hasFocus.value = FocusState(
                      hasError: error != null,
                      hasText: _hasFocus.value.hasText ?? false,
                      isFocused: _hasFocus.value.isFocused ?? false,
                    );
                    return error;
                  }
                  _hasFocus.value = FocusState(
                    hasError: false,
                    hasText: _hasFocus.value.hasText ?? false,
                    isFocused: _hasFocus.value.isFocused ?? false,
                  );
                  return null;
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
