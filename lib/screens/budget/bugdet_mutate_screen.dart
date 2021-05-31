import 'package:flutter/material.dart';
import 'package:xafe/constants/routes.dart';
import 'package:xafe/models/podos/budget.dart';
import 'package:xafe/widgets/fragments/app_bar/app_appbar.dart';
import 'package:xafe/widgets/fragments/buttons/bottom_button.dart';
import 'package:xafe/widgets/fragments/inputs/app_text_field.dart';
import 'package:xafe/widgets/fragments/spacers/app_sized_box.dart';
import 'package:xafe/widgets/layouts/scaffolds/form_scaffold.dart';

class BudgetMutateScreen extends StatefulWidget {
  final Budget? budget;

  const BudgetMutateScreen({this.budget});

  bool get isEdit {
    return budget != null;
  }

  @override
  State<StatefulWidget> createState() => _BudgetMutateScreenState();
}

class _BudgetMutateScreenState extends State<BudgetMutateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const XfAppBar(),
      body: FormWidget(
        fields: [
          XfTextField(hintText: "Budget name"),
          XfSizedBox(height: 1),
          XfTextField(hintText: "Budget amount"),
          XfSizedBox(height: 1),
          XfTextField(hintText: "Choose interval"),
        ],
        title: "${widget.isEdit ? 'Edit' : 'Create a'} Budget",
      ),
      bottomSheet: BottomButton(
        onTap: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
            XfRoutes.dashboard,
            (_) => false,
          );
        },
        text: "${widget.isEdit ? 'Edit' : 'Create'} Budget",
      ),
    );
  }
}
