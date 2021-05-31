import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xafe/screens/dashboard/widgets/bottom_nav_icon.dart';
import 'package:xafe/screens/dashboard/widgets/bottom_nav_text.dart';
import 'package:xafe/state/dashboard/dashboard_state.dart';
import 'package:xafe/style/colors.dart';
import 'package:xafe/utils/extensions.dart';

class DashboardScreen extends StatefulWidget {
  final int? tab;

  const DashboardScreen({this.tab});

  @override
  State<StatefulWidget> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final PageController ctrl;

  @override
  void initState() {
    super.initState();
    _setTab();
  }

  _setTab() {
    if (widget.tab != null) {
      DashboardState.instance.handlePageChange(page: widget.tab!);
    }
    ctrl = PageController(
      initialPage: widget.tab ?? DashboardState.instance.pageIndex.value,
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<DashboardState>();
    final insets = context.scaler.insets;

    return WillPopScope(
      onWillPop: () async {
        if (model.pageStack.length > 1) {
          model.pageStack.removeLast();
          ctrl.jumpToPage(model.pageStack.last);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        bottomNavigationBar: Container(
          padding: insets.only(
            top: .5,
            bottom: 2,
            left: 13,
            right: 13,
          ),
          decoration: const BoxDecoration(
            color: XfColors.white,
            border: Border.fromBorderSide(BorderSide.none),
          ),
          child: ValueListenableBuilder(
            valueListenable: model.pageIndex,
            builder: (context, int index, _) {
              return BottomNavigationBar(
                currentIndex: index,
                onTap: (int index) {
                  ctrl.jumpToPage(index);
                },
                showUnselectedLabels: true,
                backgroundColor: XfColors.white,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                items: [
                  for (final item in model.pages)
                    BottomNavigationBarItem(
                      icon: BottomNavIcon(
                        item.icon,
                        index == model.pages.indexOf(item),
                      ),
                      // ignore: deprecated_member_use
                      title: BottomNavText(
                        item.name,
                        index == model.pages.indexOf(item),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
        body: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (int page) => model.handlePageChange(page: page),
          controller: ctrl,
          itemBuilder: (context, index) {
            return model.pages[index].page;
          },
          itemCount: model.pages.length,
        ),
      ),
    );
  }
}
