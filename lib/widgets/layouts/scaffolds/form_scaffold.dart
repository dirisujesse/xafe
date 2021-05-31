import 'package:flutter/material.dart';
import 'package:xafe/style/text_styles.dart';
import 'package:xafe/utils/extensions.dart';
import 'package:xafe/utils/typedefs.dart';
import 'package:xafe/widgets/fragments/app_bar/app_appbar.dart';
import 'package:xafe/widgets/fragments/buttons/bottom_button.dart';
import 'package:xafe/widgets/fragments/indicators/app_spinner.dart';
import 'package:xafe/widgets/fragments/spacers/app_sized_box.dart';
import 'package:xafe/widgets/typography/app_text.dart';

class FormWidget extends StatefulWidget {
  final List<Widget> fields;
  final String title;
  final String? subTitle;
  final OnPressed? onSubmit;

  FormWidget({
    required this.fields,
    required this.title,
    this.onSubmit,
    this.subTitle,
  });

  @override
  State<StatefulWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return GestureDetector(
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: scaler.insets.symmetric(horizontal: 5),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  XfSizedBox(height: 5),
                  XfText(
                    widget.title,
                    style: XfTextStyle.header.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (widget.subTitle != null) const XfSizedBox(height: 1.5),
                  if (widget.subTitle != null)
                    XfText(
                      widget.subTitle!,
                      style: XfTextStyle.subTitle,
                    ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: scaler.insets.only(
              left: 5,
              right: 5,
              bottom: 1,
              top: widget.subTitle == null ? 4 : 2,
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, index) {
                  return widget.fields[index];
                },
                childCount: widget.fields.length,
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
    );
  }
}

class SignupFormWidget extends StatefulWidget {
  final List<Widget> fields;
  final String title;
  final String subTitle;
  final String legend;
  final String? btnText;
  final double progress;
  final OnPressed? onSubmit;

  SignupFormWidget({
    required this.fields,
    required this.title,
    required this.onSubmit,
    required this.subTitle,
    required this.legend,
    required this.progress,
    this.btnText,
  }) : assert(progress >= 0 || progress <= 1);

  @override
  State<StatefulWidget> createState() => _SigupFormWidgetState();
}

class _SigupFormWidgetState extends State<SignupFormWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return Scaffold(
      appBar: XfAppBar(title: widget.legend),
      body: GestureDetector(
        child: SingleChildScrollView(
          padding: scaler.insets.fromLTRB(5, 5, 5, 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              XfText(
                widget.title,
                style: XfTextStyle.header.copyWith(fontSize: 100),
              ),
              XfSizedBox(height: 1),
              XfText(
                widget.subTitle,
                style: XfTextStyle.subTitle.copyWith(fontSize: 45),
              ),
              XfSizedBox(height: 4),
              ...widget.fields
            ],
          ),
        ),
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
      ),
      bottomSheet: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: scaler.insets.symmetric(horizontal: 5),
            child: AppLinearProgress(extent: widget.progress),
          ),
          BottomButton(
            onTap: widget.onSubmit,
            padding: scaler.insets.symmetric(
              horizontal: 5,
              vertical: 2,
            ),
            text: widget.btnText ?? "Next",
          ),
        ],
      ),
    );
  }
}
