import 'package:flutter/material.dart';
import 'package:xafe/constants/routes.dart';
import 'package:xafe/widgets/fragments/app_bar/app_appbar.dart';
import 'package:xafe/widgets/fragments/buttons/bottom_button.dart';
import 'package:xafe/widgets/fragments/inputs/app_text_field.dart';
import 'package:xafe/widgets/fragments/spacers/app_sized_box.dart';
import 'package:xafe/widgets/layouts/scaffolds/form_scaffold.dart';

class CategoryCreateScreen extends StatefulWidget {
  final bool isEdit;

  const CategoryCreateScreen(this.isEdit);

  @override
  State<StatefulWidget> createState() => _CategoryCreateScreenState();
}

class _CategoryCreateScreenState extends State<CategoryCreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const XfAppBar(),
      body: FormWidget(
        fields: [
          XfTextField(hintText: "Category name"),
          XfSizedBox(height: 1),
          XfTextField(hintText: "Choose category emoji"),
        ],
        title: "Add a spending category",
      ),
      bottomSheet: BottomButton(
        onTap: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
            XfRoutes.dashboard,
            (_) => false,
          );
        },
        text: "Create Category",
      ),
    );
  }
}
