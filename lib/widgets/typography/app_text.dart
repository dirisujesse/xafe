import 'package:flutter/material.dart';
import 'package:xafe/style/style.dart';
import 'package:xafe/utils/extensions.dart';

class XfText extends StatelessWidget {
  final String? data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final Locale? locale;
  final StrutStyle? strutStyle;
  final bool? softWrap;
  final int? maxLines;
  final TextDirection? textDirection;
  final TextOverflow? overflow;
  final bool _isEditable;

  const XfText(
    this.data, {
    this.style,
    this.textAlign,
    this.locale,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    Key? key,
  })  : _isEditable = false,
        super(key: key);

  const XfText.editable(
    this.data, {
    this.style,
    this.textAlign,
    this.locale,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
  }) : _isEditable = true;

  @override
  Widget build(BuildContext context) {
    final _style =
        style != null ? style : XfTextStyle.regular;
    final _fontSize = style != null ? _style?.fontSize ?? 45.0 : 45.0;
    final fontSizer = context.scaler.fontSizer;
    
    if (_isEditable) {
      return EditableText(
        toolbarOptions: ToolbarOptions(
          copy: true,
        ),
        readOnly: true,
        controller: TextEditingController(
          text: data,
        ),
        focusNode: FocusNode(),
        style: _style!.copyWith(
          fontSize: fontSizer.sp(_fontSize),
        ),
        cursorColor: XfColors.green,
        backgroundCursorColor: XfColors.transparent,
        strutStyle: strutStyle,
        textAlign: textAlign ?? TextAlign.start,
        locale: locale,
        maxLines: maxLines,
        textDirection: textDirection,
        textWidthBasis: TextWidthBasis.parent,
      );
    }

    return Text(
      data ?? "",
      style: _style?.copyWith(
        fontSize: fontSizer.sp(_fontSize),
      ),
      strutStyle: strutStyle,
      textAlign: textAlign,
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      textDirection: textDirection,
      textWidthBasis: TextWidthBasis.parent,
    );
  }
}
