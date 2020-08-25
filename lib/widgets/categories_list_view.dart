import 'package:flutter/material.dart';
import 'package:sellout/config/routes.dart';
import 'package:sellout/config/theme.dart';
import 'package:sellout/widgets/button.dart';
import 'package:sellout/widgets/image.dart';
import 'package:sellout/widgets/product_category.dart';

class CategoriesListView extends StatelessWidget {
  static String get routeName => Routes.shop;

  @override
  Widget build(BuildContext context) {
    var tabBars = <Tab>[];
    var width = MediaQuery.of(context).size.width;
    var widgetWidth = width - AppSizes.sidePadding * 4;
    var _theme = Theme.of(context);
    final List<String> tabBarList = [];
    var categories = new List<ProductCategory>();
    categories.add(new ProductCategory(
      'Mugss',
      name: 'MugssMugss',
      description: 'Migs...',
      image: ProductImage(
          "https://cdn.igp.com/f_auto,q_auto,t_prodm/products/p-birthday-theme-personalized-led-bottle-82323-m.jpg"),
    ));
    categories.add(new ProductCategory(
      'Frames',
      name: 'Frames',
      description: 'Frames...',
      image: ProductImage(
          "https://cdn.igp.com/f_auto,q_auto,t_prodm/products/p-birthday-theme-personalized-led-bottle-82323-m.jpg"),
    ));
    categories.add(new ProductCategory(
      'Kitchens',
      name: 'Kitchens',
      description: 'Kitchens...',
      image: ProductImage(
          "https://cdn.igp.com/f_auto,q_auto,t_prodm/products/p-birthday-theme-personalized-led-bottle-82323-m.jpg"),
    ));
    if (tabBarList != null) {
      for (var i = 0; i < tabBarList.length; i++) {
        tabBars.add(Tab(key: UniqueKey(), text: tabBarList[i]));
      }
    }
    var title = 'Categories';
    return SafeArea(
        child: Scaffold(
      appBar: title != null
          ? AppBar(
              title: Text(title),
              bottom: tabBars.isNotEmpty
                  ? TabBar(
                      unselectedLabelColor: _theme.primaryColor,
                      unselectedLabelStyle:
                          TextStyle(fontWeight: FontWeight.normal),
                      labelColor: _theme.primaryColor,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      tabs: tabBars,
                      // controller: tabController,
                      indicatorColor: _theme.accentColor,
                      indicatorSize: TabBarIndicatorSize.tab)
                  : null,
              actions: <Widget>[
                  Row(children: <Widget>[
                    Icon(Icons.share),
                  ])
                ])
          : null,
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: AppSizes.sidePadding)),
          Button(
            onPressed: (() => {print('ViewallYems')}),
            title: 'VIEW ALL ITEMS',
            width: widgetWidth,
            height: 50.0,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: AppSizes.sidePadding,
            ),
          ),
          Column(
            children: buildCategoryList(categories),
          )
        ],
      )),
    ));
  }

  List<Widget> buildCategoryList(List<ProductCategory> categories) {
    var elements = <Widget>[];
    if (categories != null) {
      for (var i = 0; i < categories.length; i++) {
        elements.add(
          InkWell(
            onTap: () {
              print('category clicked');
            },
            child: ProductCategoryWidget(category: categories[i]),
          ),
        );
      }
    }
    return elements;
  }
}
