import 'package:flutter/material.dart';
import 'package:xafe/style/text_styles.dart';
import 'package:xafe/utils/extensions.dart';
import 'package:xafe/utils/typedefs.dart';
import 'package:xafe/widgets/fragments/app_bar/app_appbar.dart';
import 'package:xafe/widgets/fragments/buttons/app_back_button.dart';
import 'package:xafe/widgets/fragments/buttons/bottom_button.dart';
import 'package:xafe/widgets/fragments/indicators/app_spinner.dart';
import 'package:xafe/widgets/fragments/spacers/app_sized_box.dart';
import 'package:xafe/widgets/typography/app_text.dart';

class FormWidget extends StatefulWidget {
  final List<Widget> fields;
  final String? title;
  final String? subTitle;
  final TextAlign titleAlignment;
  final OnPressed? onSubmit;
  final bool maintainSafeArea;
  final bool showBackBtn;

  FormWidget({
    required this.fields,
    this.title,
    this.onSubmit,
    this.subTitle,
    this.titleAlignment = TextAlign.left,
    this.maintainSafeArea = true,
    this.showBackBtn = true,
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
          if (widget.maintainSafeArea)
            SliverAppBar(
              leading: (widget.showBackBtn && Navigator.of(context).canPop())
                  ? AppBackButton()
                  : Offstage(),
              automaticallyImplyLeading: false,
              pinned: false,
              floating: true,
              elevation: 0,
            ),
          SliverPadding(
            padding: scaler.insets.fromLTRB(5, 0, 5, 4),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  if (widget.title != null)
                    XfText(
                      widget.title ?? '',
                      style: XfTextStyle.header.copyWith(height: 1.3),
                      textAlign: widget.titleAlignment,
                    ),
                  if (widget.subTitle != null) const XfSizedBox(height: 1.5),
                  if (widget.subTitle != null)
                    XfText(
                      widget.subTitle!,
                      style: XfTextStyle.subTitle,
                      textAlign: widget.titleAlignment,
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
