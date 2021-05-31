import 'package:flutter/material.dart';
import 'package:xafe/screens/budget/budget_list_screen.dart';
import 'package:xafe/utils/paints.dart';

class BudgetTab extends StatelessWidget {
  const BudgetTab();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GradientPainter(),
      child: BudgetListScreen(),
    );
  }
}