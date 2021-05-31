import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xafe/constants/routes.dart';
import 'package:xafe/constants/strings.dart';
import 'package:xafe/models/podos/budget.dart';
import 'package:xafe/state/budget/budget_state.dart';
import 'package:xafe/style/colors.dart';
import 'package:xafe/style/text_styles.dart';
import 'package:xafe/utils/extensions.dart';
import 'package:xafe/widgets/fragments/buttons/app_button.dart';
import 'package:xafe/widgets/fragments/indicators/app_spinner.dart';
import 'package:xafe/widgets/fragments/spacers/app_sized_box.dart';
import 'package:xafe/widgets/typography/app_text.dart';

class BudgetListScreen extends StatelessWidget {
  const BudgetListScreen();

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;
    final model = context.watch<BudgetState>();

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: scaler.insets.fromLTRB(5, 2, 5, 6),
              child: XfText(
                "${XfStrings.laptop} Budgets",
                style: XfTextStyle.header.copyWith(color: XfColors.white),
              ),
            ),
          ),
          SliverPadding(
            padding: scaler.insets.symmetric(horizontal: 5),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, idx) {
                  if (idx == model.mockBudgets.length)
                    return XfButton(
                      text: "",
                      icon: Icon(Icons.add),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          XfRoutes.budgetCreate
                        );
                      },
                      color: XfColors.white.withOpacity(.2),
                      isBold: false,
                    );
                  final budget = model.mockBudgets.elementAt(idx);
                  return _BudgetCard(
                    budget,
                    index: idx,
                  );
                },
                childCount: (model.mockBudgets.length) + 1,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 8 / 5,
                crossAxisSpacing: scaler.sizer.setWidth(3),
                mainAxisSpacing: scaler.sizer.setWidth(3),
              ),
            ),
          )
        ],
      ),
      bottom: false,
    );
  }
}

class _BudgetCard extends StatelessWidget {
  final Budget budget;
  final int index;

  _BudgetCard(this.budget, {this.index = 0});

  Color get progressColor {
    final fraction = (index + 1) % 4;

    switch (fraction) {
      case 0:
        return XfColors.orange;
      case 1:
        return XfColors.skyBlue;
      case 2:
        return XfColors.pink;
      case 3:
        return XfColors.green;
      default:
        return XfColors.skyBlue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          XfRoutes.budgetDetail,
          arguments: budget,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: XfColors.white,
          borderRadius: BorderRadius.circular(
            scaler.fontSizer.sp(40),
          ),
        ),
        padding: scaler.insets.symmetric(
          vertical: 2.5,
          horizontal: 4,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            XfText(
              budget.name,
              style: XfTextStyle.subTitle.copyWith(color: XfColors.darkGrey),
            ),
            const XfSizedBox(height: .2),
            Flexible(
              child: XfText(
                budget.formattedAmount,
                style: XfTextStyle.medium.copyWith(fontSize: 50),
              ),
            ),
            const XfSizedBox(height: 1.5),
            AppLinearProgress(
              valueColor: progressColor,
              extent: budget.spentFraction,
              inferInactiveColor: true,
            )
          ],
        ),
      ),
    );
  }
}
