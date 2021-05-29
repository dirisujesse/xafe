import 'package:flutter/material.dart' show Widget;

class DashbaordPageData {
  final String name;
  final String icon;
  final Widget page;

  const DashbaordPageData({
    required this.icon,
    required this.name,
    required this.page,
  });
}
