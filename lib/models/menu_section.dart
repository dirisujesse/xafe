import 'package:xafe/models/menu_section_item.dart';

class MenuSection {
  final String title;
  final List<MenuSectionItem> items;

  MenuSection({
    required this.title,
    required this.items,
  });
}
