import 'package:flutter/material.dart';
import 'package:sellout/config/routes.dart';
import 'package:sellout/widgets/products_list_view.dart';
import 'package:sellout/widgets/products_tile_view.dart';
import 'package:sellout/widgets/size_changing_app_bar.dart';

class ProductsScreen extends StatefulWidget {
  static String get routeName => Routes.productList;
  ProductsScreen({Key key, this.listView}) : super(key: key);

  final bool listView;

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  bool listView = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SizeChangingAppBar(
            title: 'Products',
            // filterRules: false,
            // sortRules: true,
            isListView: listView,
            // onFilterRulesChanged: (filter) {
            //   print('onViewChanged');
            // },
            // onSortRulesChanged: (sort) {
            //   print('onViewChanged');
            // },
            onViewChanged: () {
              setState(() {
                listView = !listView;
              });
              print('onViewChanged');
            },
          ),
          listView ? ProductsListView() : ProductsTileView(),
        ],
      ),
    ));
  }
}
