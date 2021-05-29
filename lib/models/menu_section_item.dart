import 'package:flutter/material.dart';

class MenuSectionItem {
  final String title;
  final String? description;
  final IconData icon;

  MenuSectionItem({
    required this.title,
    this.description,
    required this.icon,
  });
}
