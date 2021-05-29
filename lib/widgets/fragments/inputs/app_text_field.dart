import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xafe/models/podos/focus.dart';
import 'package:xafe/style/colors.dart';
import 'package:xafe/style/text_styles.dart';
import 'package:xafe/utils/dimensions.dart';
import 'package:xafe/utils/extensions.dart';
import 'package:xafe/utils/typedefs.dart';

class XfTextField extends StatefulWidget {
  final TextEditingController? controller;
  final bool isEnabled;
  final TextInputAction? textInputAction;
  final InputDecoration? decoration;
  final TextCapitalization? textCapitalization;
  final String? label;
  final bool obscureText;
  final bool autoFocus;
  final String? hintText;
  final String? helperText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Widget? prefixIcon;
  final OnValidate<String?>? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? maxLength;
  final OnChanged<String?>? onChanged;
  final OnPressed? onPrefixTap;
  final TextStyle? style;
  final TextAlign? textAlign;
  final String? semanticsLabel;

  TextEditingController get ctrl {
    return controller ?? TextEditingController();
  }

  const XfTextField({
    Key? key,
    this.semanticsLabel,
    this.decoration,
    this.textInputAction,
    this.textCapitalization,
    this.controller,
    this.isEnabled = true,
    this.autoFocus = false,
    this.inputFormatters,
    this.prefixIcon,
    this.label,
    this.hintText,
    this.helperText,
    this.textAlign = TextAlign.left,
    this.maxLines = 1,
    this.maxLength,
    this.onChanged,
    this.onPrefixTap,
    this.obscureText = false,
    this.suffix,
    this.suffixIcon,
    this.prefix,
    this.validator,
    this.keyboardType,
    this.style,
  }) : super(key: key);

  const XfTextField.multiline({
    Key? key,
    this.semanticsLabel,
    this.decoration,
    this.textInputAction = TextInputAction.newline,
    this.textCapitalization,
    this.controller,
    this.isEnabled = true,
    this.autoFocus = false,
    this.inputFormatters,
    required this.label,
    this.prefixIcon,
    this.onPrefixTap,
    this.hintText,
    this.helperText,
    this.textAlign = TextAlign.left,
    this.maxLength,
    this.onChanged,
    this.obscureText = false,
    this.suffix,
    this.suffixIcon,
    this.prefix,
    this.validator,
    this.style,
  })  : maxLines = null,
        keyboardType = TextInputType.multiline,
        super(key: key);

  @override
  _XfTextFieldState createState() => _XfTextFieldState();
}

class _XfTextFieldState extends State<XfTextField> with WidgetsBindingObserver {
  final _inputFocus = FocusNode();
  final ValueNotifier<FocusState> _hasFocus = ValueNotifier(FocusState());
  late XfScaleUtil scaler;

  @override
  void initState() {
    super.initState();
    scaler = context.scaler;
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
      child: TextFormField(
        autofocus: widget.autoFocus,
        textDirection: TextDirection.ltr,
        showCursor: true,
        textAlign: widget.textAlign ?? TextAlign.left,
        focusNode: _inputFocus,
        textInputAction: widget.textInputAction ?? TextInputAction.done,
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
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        inputFormatters: widget.inputFormatters,
        maxLines: widget.maxLines,
        onChanged: widget.onChanged,
        decoration: decoration.copyWith(
          hintStyle: XfTextStyle.regular.copyWith(
            fontSize: scaler.fontSizer.sp(40),
            color: XfColors.ash,
          ),
          helperStyle: XfTextStyle.regular.copyWith(
            fontSize: scaler.fontSizer.sp(40),
            color: XfColors.ash,
          ),
          suffix: widget.suffix,
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
          counter: null,
          hintText: widget.hintText,
          helperText: widget.helperText,
          contentPadding: scaler.insets.symmetric(
            vertical: 2,
            horizontal: 5,
          )
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
    );
  }
}
