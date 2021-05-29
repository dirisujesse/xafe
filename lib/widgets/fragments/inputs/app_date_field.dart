import 'package:flutter/material.dart';
import 'package:xafe/utils/typedefs.dart';
import 'package:xafe/widgets/fragments/inputs/app_text_field.dart';

class XfDateInput extends StatefulWidget {
  final String hintText;
  final String labelText;
  final TextEditingController? controller;
  final OnValidate<String?>? validator;
  final DateTime? lastDate;
  final DateTime? firstDate;
  final DateTime? initialDate;
  final bool formatDate;

  XfDateInput({
    this.controller,
    this.hintText = "Provide Date",
    this.labelText = "SELECT DATE",
    this.validator,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.formatDate = true,
  });

  @override
  State<StatefulWidget> createState() => _XfDateInputState();
}

class _XfDateInputState extends State<XfDateInput> {
  late TextEditingController _localCtrl;

  @override
  void initState() {
    super.initState();
    _localCtrl = TextEditingController();
  }

  // DateTime get _initialDate {
  //   return widget.initialDate ?? DateTime.now();
  // }

  // DateTime get _lastDate {
  //   return widget.lastDate ?? DateTime.now().add(Duration(days: 365 * 20));
  // }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return InkWell(
          onTap: () async {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: XfTextField(
            controller: _localCtrl,
            hintText: widget.hintText,
            validator: widget.validator,
            isEnabled: false,
            label: widget.labelText,
            suffixIcon: IconButton(
              icon: Icon(Icons.calendar_today_outlined),
              onPressed: () {},
            ),
          ),
        );
      },
    );
  }
}
