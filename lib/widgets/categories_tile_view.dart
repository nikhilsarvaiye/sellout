import 'package:flutter/material.dart';
import 'package:sellout/config/routes.dart';
import 'package:sellout/config/theme.dart';
import 'package:sellout/widgets/image.dart';
import 'package:sellout/widgets/product_category.dart';

class CategoriesTileView extends StatelessWidget {
  static String get routeName => Routes.shop;

  @override
  Widget build(BuildContext context) {
    var tabBars = <Tab>[];
    final List<String> types = ['Women', 'Men', 'Kids'];
    var width = MediaQuery.of(context).size.width;
    var widgetWidth = width - AppSizes.sidePadding * 4;
    var _theme = Theme.of(context);
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
    if (types != null) {
      for (var i = 0; i < types.length; i++) {
        tabBars.add(Tab(key: UniqueKey(), text: types[i]));
      }
    }
    final display1 = TextStyle(
        color: AppColors.black,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'Metropolis');
    var title = 'Categories';
    var tabViews = <Widget>[];
    for (var _ in categories) {
      tabViews.add(SingleChildScrollView(
          child: Column(children: <Widget>[
        Padding(
            padding: EdgeInsets.all(AppSizes.sidePadding),
            child: Container(
                width: width,
                padding: EdgeInsets.all(AppSizes.sidePadding * 2),
                decoration: BoxDecoration(
                  color: _theme.accentColor,
                  borderRadius: BorderRadius.circular(AppSizes.imageRadius),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('SUMMER SALES',
                        style: display1.copyWith(color: AppColors.white)),
                    Text('Up to 50% off',
                        style: display1.copyWith(color: AppColors.white))
                  ],
                ))),
        Container(
            padding: EdgeInsets.all(AppSizes.sidePadding),
            child: Column(
                children: buildCategoryList(
                    categories, width - AppSizes.sidePadding * 3)))
      ])));
    }

    return SafeArea(
        child: DefaultTabController(
            length: tabBars.length,
            child: Scaffold(
                appBar: title != null
                    ? AppBar(
                        title: Text(title),
                        bottom: TabBar(
                            unselectedLabelColor: _theme.primaryColor,
                            unselectedLabelStyle:
                                TextStyle(fontWeight: FontWeight.normal),
                            labelColor: _theme.primaryColor,
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                            tabs: tabBars,
                            // controller: tabController,
                            indicatorColor: _theme.accentColor,
                            indicatorSize: TabBarIndicatorSize.tab),
                        actions: <Widget>[
                            Row(children: <Widget>[
                              Icon(Icons.share),
                            ])
                          ])
                    : null,
                body: TabBarView(
                  children: tabViews,
                  // controller: DefaultTabController(),
                ))));
  }

  List<Widget> buildCategoryList(
      List<ProductCategory> categories, double width) {
    var elements = <Widget>[];
    for (var i = 0; i < categories.length; i++) {
      elements.add(InkWell(
          onTap: (() {
            print('cliked .....asdasd ');
          }),
          child: ProductCategoryTileWidget(
              height: 100, width: width, category: categories[i])));
    }
    return elements;
  }
}
