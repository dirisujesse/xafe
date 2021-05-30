import 'package:flutter/foundation.dart' show ChangeNotifier, ValueNotifier;
import 'package:flutter/material.dart';
import 'package:xafe/constants/images.dart';
import 'package:xafe/models/podos/dashboard.dart';
import 'package:xafe/screens/dashboard/tabs/budget_tab.dart';
import 'package:xafe/screens/dashboard/tabs/category_tab.dart';
import 'package:xafe/screens/dashboard/tabs/home_tab.dart';

class DashboardState extends ChangeNotifier {
  static DashboardState? _instance;

  ValueNotifier<int> pageIndex = ValueNotifier(0);
  List<int> pageStack = [0];

  final List<DashbaordPageData> pages = [
    DashbaordPageData(
      page: HomeTab(),
      name: "Home",
      icon: XfSvgs.home,
    ),
    DashbaordPageData(
      page: CategoryTab(),
      name: "Categories",
      icon: XfSvgs.search,
    ),
    DashbaordPageData(
      page: const BudgetTab(),
      name: "Budget",
      icon: XfSvgs.budget,
    ),
  ];

  clearData() {
    pageIndex.value = 0;
    pageStack = [0];
  }

  static DashboardState get instance {
    if (_instance == null) {
      _instance = DashboardState();
    }
    return _instance!;
  }

  handlePageChange({required int page}) {
    if (pageStack.last != page) {
      pageStack.add(page);
    }
    pageIndex.value = page;
    notifyListeners();
  }
}
