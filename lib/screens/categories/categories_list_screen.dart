import 'package:flutter/material.dart';
import 'package:sellout/config/routes.dart';
import 'package:sellout/widgets/categories_list_view.dart';

class CategoriesListScreen extends StatelessWidget {
  static String get routeName => Routes.shop;

  @override
  Widget build(BuildContext context) {
    return CategoriesListView();
  }
}
