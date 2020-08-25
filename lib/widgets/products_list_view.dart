import 'package:flutter/material.dart';
import 'package:sellout/config/theme.dart';
import 'package:sellout/widgets/image.dart';
import 'package:sellout/widgets/product.dart';

class ProductsListView extends StatelessWidget {
  final List<Product> products = new List<Product>();

  @override
  Widget build(BuildContext context) {
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

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.sidePadding),
              child: ProductListItemWidget(
                products[index],
                onClick: () {
                  print('onClick');
                },
                onLike: () {
                  print('onLike');
                },
              ));
        },
        childCount: products?.length ?? 20,
      ),
    );
  }
}
