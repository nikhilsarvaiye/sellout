import 'package:flutter/material.dart';
import 'package:sellout/config/routes.dart';
import 'package:sellout/widgets/categories_tile_view.dart';

class CategoriesTileScreen extends StatelessWidget {
  static String get routeName => Routes.categories;

  @override
  Widget build(BuildContext context) {
    return CategoriesTileView();
  }
}
