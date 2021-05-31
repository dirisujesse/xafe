import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:xafe/constants/images.dart';
import 'package:xafe/models/podos/budget.dart';
import 'package:xafe/state/budget/budget_state.dart';
import 'package:xafe/style/colors.dart';
import 'package:xafe/style/text_styles.dart';
import 'package:xafe/utils/extensions.dart';
import 'package:xafe/utils/paints.dart';
import 'package:xafe/widgets/fragments/app_bar/app_appbar.dart';
import 'package:xafe/widgets/fragments/buttons/app_pill_button.dart';
import 'package:xafe/widgets/fragments/indicators/app_spinner.dart';
import 'package:xafe/widgets/fragments/spacers/app_sized_box.dart';
import 'package:xafe/widgets/fragments/spacers/padded_widget.dart';
import 'package:xafe/widgets/layouts/scaffolds/detail_scafold.dart';
import 'package:xafe/widgets/typography/app_text.dart';

class BudgetDetailScreen extends StatelessWidget {
  final Budget budget;
  final ScrollController controller = ScrollController();

  BudgetDetailScreen(this.budget);

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;
    final model = context.watch<BudgetState>();

    return CustomPaint(
      painter: GradientPainter(),
      child: DetailScaffold(
        headerRatio: .3,
        implyLeading: false,
        controller: controller,
        header: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              XfAppBar(
                textColor: XfColors.white,
                leadingColor: XfColors.white,
                title: budget.name,
                backgroundColor: XfColors.transparent,
                actions: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: PaddedWidget(SvgPicture.asset(XfSvgs.addIcon)),
                  ),
                ],
              ),
              XfSizedBox(height: 2),
              PaddedWidget(
                Text.rich(
                  TextSpan(
                    text: budget.amountSpentFormatted,
                    children: [
                      TextSpan(
                        text: " spent",
                        style: XfTextStyle.subTitle.copyWith(
                          fontSize: scaler.fontSizer.sp(50),
                          color: XfColors.white,
                        ),
                      ),
                    ],
                  ),
                  style: XfTextStyle.body.copyWith(
                    color: XfColors.white,
                    fontSize: scaler.fontSizer.sp(100),
                  ),
                ),
              ),
              XfSizedBox(height: 1),
              PaddedWidget(
                AppLinearProgress(
                  extent: budget.spentFraction,
                  valueColor: XfColors.white,
                  inferInactiveColor: true,
                ),
              ),
              XfSizedBox(height: 1),
              PaddedWidget(
                AppPillButton(
                  onPressed: () {},
                  text: budget.formattedAmount,
                  textColor: XfColors.white,
                  backgroundColor: XfColors.white.withOpacity(.1),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          padding: scaler.insets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              XfSizedBox(height: 6),
              XfText(
                "Expense History",
                style: XfTextStyle.medium.copyWith(fontSize: 55),
              ),
              Expanded(
                child: ListView.separated(
                  controller: controller,
                  itemBuilder: (context, idx) {
                    BudgetExpense expense = model.mockExpenses.elementAt(idx);
                    return ListTile(
                      dense: true,
                      contentPadding: scaler.insets.zero,
                      leading: Image.network(expense.imageUrl),
                      title: XfText(
                        expense.name,
                        style: XfTextStyle.medium.copyWith(
                          fontSize: 50,
                        ),
                      ),
                      subtitle: XfText(
                        expense.dateCreated,
                        style: XfTextStyle.subTitle,
                      ),
                      trailing: FittedBox(
                        child: AppPillButton(
                          onPressed: () {},
                          text: expense.formattedAmount,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => Divider(),
                  itemCount: model.mockExpenses.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
