import 'package:flutter/material.dart';
import 'package:sellout/config/routes.dart';
import 'package:sellout/config/theme.dart';
import 'package:sellout/widgets/block_header.dart';
import 'package:sellout/widgets/image.dart';
import 'package:sellout/widgets/product.dart';
import 'package:sellout/widgets/product_list.dart';

class HomeScreenOne extends StatelessWidget {
  static String get routeName => '/home1';
  final List<Product> products = new List<Product>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width;
    var widgetWidth = width - AppSizes.sidePadding * 2;
    products.add(Product(
        "5f42f0fd3f57738d18e00d36",
        "Physical Card",
        "shortDescription",
        ProductImage(
            "https://cdn.igp.com/f_auto,q_auto,t_prodm/products/p-birthday-theme-personalized-led-bottle-82323-m.jpg"),
        DateTime.now(),
        1000,
        true,
        0));
    products.add(Product(
        "6f42f0fd3f57738d18e00d36",
        "Gift Card",
        "shortDescription",
        ProductImage(
            "https://d3cif2hu95s88v.cloudfront.net/live-site-2016/product-image/010/05-05-2018/1525928068DSC_0914-1---1-350x350.jpg"),
        DateTime.now(),
        1000,
        true,
        0));
    products.add(Product(
        "6f42f0fd3f57738d18e00d36",
        "Gift Card",
        "shortDescription",
        ProductImage(
            "https://www.insity.com/images/thumbs/001/0011903_personalized-led-cushion-yellow_360.jpeg"),
        DateTime.now(),
        1000,
        true,
        0));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: SingleChildScrollView(
              child: Column(
        children: [
          Container(
              height: width * 0.52,
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://busybeingbatty.co.uk/wp-content/uploads/2020/06/DSChocolate-Dark-Left.jpg'),
                    fit: BoxFit.fill),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(left: AppSizes.sidePadding),
                      width: width,
                      child: Text('Street clothes',
                          style:
                              theme.textTheme.headline5.copyWith(fontSize: 34)))
                ],
              )),
          OpenFlutterBlockHeader(
            width: widgetWidth,
            title: 'Sale',
            linkText: 'View All',
            onLinkTap: () => {
              Navigator.of(context).pushNamed(Routes.home),
              // arguments: CategoriesParameters(2))
            },
            description: 'Super summer sale',
          ),
          ProductListWidget(
              width: widgetWidth,
              products: products, // widget.salesProducts,
              onFavoritesTap: ((Product product) => {
                    // BlocProvider.of<HomeBloc>(context).add(HomeAddToFavoriteEvent(
                    //     isFavorite: !product.isFavorite, product: product))
                  })),
          OpenFlutterBlockHeader(
            width: widgetWidth,
            title: 'New',
            linkText: 'View All',
            onLinkTap: () => {Navigator.of(context).pushNamed(Routes.home)},
            description: 'You’ve never seen it before!',
          ),
          ProductListWidget(
              width: widgetWidth,
              products: products, // widget.salesProducts,
              onFavoritesTap: ((Product product) => {
                    // BlocProvider.of<HomeBloc>(context).add(HomeAddToFavoriteEvent(
                    //     isFavorite: !product.isFavorite, product: product))
                  })),
        ],
      ))),
    );
  }
}
