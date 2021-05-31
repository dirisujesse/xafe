import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:xafe/constants/images.dart';
import 'package:xafe/constants/routes.dart';
import 'package:xafe/constants/strings.dart';
import 'package:xafe/models/podos/budget.dart';
import 'package:xafe/state/budget/budget_state.dart';
import 'package:xafe/style/colors.dart';
import 'package:xafe/style/text_styles.dart';
import 'package:xafe/utils/extensions.dart';
import 'package:xafe/utils/paints.dart';
import 'package:xafe/widgets/fragments/buttons/app_pill_button.dart';
import 'package:xafe/widgets/fragments/spacers/app_sized_box.dart';
import 'package:xafe/widgets/fragments/spacers/padded_widget.dart';
import 'package:xafe/widgets/layouts/scaffolds/detail_scafold.dart';
import 'package:xafe/widgets/typography/app_text.dart';

class CategoryTab extends StatelessWidget {
  final ScrollController controller = ScrollController();
  CategoryTab();

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;
    final model = context.watch<BudgetState>();

    return CustomPaint(
      painter: GradientPainter(),
      child: DetailScaffold(
        headerRatio: .15,
        implyLeading: false,
        controller: controller,
        header: SafeArea(
          child: PaddedWidget(
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                XfText(
                  "${XfStrings.laptop} Categories",
                  style: XfTextStyle.header.copyWith(color: XfColors.white),
                ),
                Spacer(),
                InkWell(
                  child: SvgPicture.asset(XfSvgs.addIcon),
                  onTap: () {
                    Navigator.of(context).pushNamed(XfRoutes.categoryCreate);
                  },
                )
              ],
            ),
            verticalPadding: 2,
          ),
          bottom: false,
        ),
        body: Container(
          padding: scaler.insets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              XfSizedBox(height: 6),
              XfText(
                "${model.mockExpenseCategories.length} spending categories",
                style: XfTextStyle.medium.copyWith(fontSize: 55),
              ),
              Expanded(
                child: ListView.separated(
                  controller: controller,
                  itemBuilder: (context, idx) {
                    BudgetExpenseCategory expense =
                        model.mockExpenseCategories.elementAt(idx);
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
                        fit: BoxFit.scaleDown,
                        child: AppPillButton(
                          onPressed: () {},
                          text: "remove",
                          textColor: XfColors.orange,
                          backgroundColor: XfColors.orange.withOpacity(.1),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => Divider(),
                  itemCount: model.mockExpenseCategories.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
