import 'package:flutter/material.dart';
import 'package:xafe/constants/routes.dart';
import 'package:xafe/widgets/fragments/app_bar/app_appbar.dart';
import 'package:xafe/widgets/fragments/buttons/bottom_button.dart';
import 'package:xafe/widgets/fragments/inputs/app_text_field.dart';
import 'package:xafe/widgets/fragments/spacers/app_sized_box.dart';
import 'package:xafe/widgets/layouts/scaffolds/form_scaffold.dart';

class BudgetExpenseScreen extends StatefulWidget {

  const BudgetExpenseScreen();

  @override
  State<StatefulWidget> createState() => _BudgetExpenseScreenState();
}

class _BudgetExpenseScreenState extends State<BudgetExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const XfAppBar(),
      body: FormWidget(
        fields: [
          XfTextField(hintText: "Expense amount"),
          XfSizedBox(height: 1),
          XfTextField(hintText: "Select category"),
          XfSizedBox(height: 1),
          XfTextField(hintText: "Expense name"),
          XfSizedBox(height: 1),
          XfTextField(hintText: "Data d/mm/yy"),
        ],
        title: "Add an expense",
      ),
      bottomSheet: BottomButton(
        onTap: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
            XfRoutes.dashboard,
            (_) => false,
          );
        },
        text: "Add Expense",
      ),
    );
  }
}
