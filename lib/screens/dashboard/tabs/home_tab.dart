import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:xafe/constants/images.dart';
import 'package:xafe/constants/strings.dart';
import 'package:xafe/models/podos/budget.dart';
import 'package:xafe/state/budget/budget_state.dart';
import 'package:xafe/style/colors.dart';
import 'package:xafe/style/text_styles.dart';
import 'package:xafe/utils/extensions.dart';
import 'package:xafe/utils/intl_formatter.dart';
import 'package:xafe/utils/paints.dart';
import 'package:xafe/widgets/fragments/buttons/app_button.dart';
import 'package:xafe/widgets/fragments/indicators/app_spinner.dart';
import 'package:xafe/widgets/fragments/spacers/app_sized_box.dart';
import 'package:xafe/widgets/fragments/spacers/padded_widget.dart';
import 'package:xafe/widgets/layouts/scaffolds/detail_scafold.dart';
import 'package:xafe/widgets/typography/app_text.dart';

class HomeTab extends StatelessWidget {
  final ScrollController controller = ScrollController();

  HomeTab();

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;
    final model = context.watch<BudgetState>();

    return CustomPaint(
      painter: GradientPainter(),
      child: DetailScaffold(
        headerRatio: .5,
        body: Container(
          padding: scaler.insets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                      trailing: XfText(
                        expense.formattedAmount,
                        style: XfTextStyle.medium.copyWith(
                          fontSize: 45,
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
        header: Container(
          padding: scaler.insets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: scaler.sizer.topInset),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  XfButton(
                    text: "This week  ${XfStrings.dropdown}",
                    onPressed: () {},
                    isDense: true,
                    color: XfColors.white.withOpacity(.1),
                    horizontalPadding: 2,
                    verticalPadding: 1.3,
                    cornerRadius: 25,
                    isBold: false,
                    fontSize: 45,
                  ),
                  Spacer(),
                  InkWell(
                    child: SvgPicture.asset(XfSvgs.edit),
                    onTap: () {},
                  )
                ],
              ),
              XfSizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppBarChart(
                    extent: model.expenses / model.revenue,
                    width: 30,
                    height: 23,
                  ),
                  AppBarChart(
                    extent: model.income / model.revenue,
                    width: 30,
                    height: 23,
                  ),
                ],
              ),
              XfSizedBox(height: 2),
              PaddedWidget(
                Table(
                  columnWidths: {
                    0: FlexColumnWidth(5),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(5),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(children: [
                      XfText(
                        "Expenses",
                        style:
                            XfTextStyle.medium.copyWith(color: XfColors.white),
                      ),
                      Offstage(),
                      XfText(
                        "Income",
                        style:
                            XfTextStyle.medium.copyWith(color: XfColors.white),
                      ),
                    ]),
                    TableRow(children: [
                      XfText(
                        XfFormatter.formatCurrencyLong(model.expenses),
                        style: XfTextStyle.header60.copyWith(
                          color: XfColors.white,
                        ),
                      ),
                      Offstage(),
                      XfText(
                        XfFormatter.formatCurrencyLong(model.income),
                        style: XfTextStyle.header60.copyWith(
                          color: XfColors.white,
                        ),
                      ),
                    ]),
                  ],
                ),
                horizontalPadding: 7,
              )
            ],
          ),
        ),
        implyLeading: false,
      ),
    );
  }
}
