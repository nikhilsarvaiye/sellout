import 'package:flutter/material.dart';
import 'package:sellout/config/theme.dart';
import 'package:sellout/widgets/base_product_tile.dart';
import 'package:sellout/widgets/image.dart';
import 'package:sellout/widgets/like.dart';
import 'package:sellout/widgets/product_rating.dart';

class Product {
  final String id;
  final String name;
  final String shortDescription;
  final String fullDescription;
  final double price;
  final double discountPrice;
  final double oldPrice;
  final DateTime createdOnUtc;
  final bool liked;
  final int stockQuantity;
  final ProductImage mainImage;
  final double averageRating;
  final int ratingCount;
  final List<ProductImage> images;

  Product(this.id, this.name, this.shortDescription, this.mainImage,
      this.createdOnUtc, this.price, this.liked, this.discountPrice,
      {this.stockQuantity = 50000,
      this.averageRating = 3,
      this.ratingCount = 1000,
      this.oldPrice,
      this.fullDescription,
      this.images});
}

class ProductWidget extends StatelessWidget {
  final display1 = TextStyle(
      color: AppColors.black,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: 'Metropolis');

  final display3 = TextStyle(
      color: AppColors.lightGray,
      fontSize: 14,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w400);
  final specialMark = 'New';

  final double imageHeight = 184;

  final Product product;
  ProductWidget(this.product);

  @override
  Widget build(BuildContext context) {
    return BaseProductTile(
        onClick: () => {},
        bottomRoundButton: LikeWidget(product.liked, null, ""),
        inactiveMessage: product.price == null || product.price > 0
            ? null
            : 'Sorry, this item is currently sold out',
        image: NetworkImage(
          product.mainImage.url,
        ),
        mainContentBuilder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(
                      top: AppSizes.linePadding, bottom: AppSizes.linePadding),
                  child: ProductRating(
                    rating: product.averageRating,
                    ratingCount: product.ratingCount,
                    alignment: MainAxisAlignment.start,
                    iconSize: 12,
                    labelFontSize: 12,
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Text(product.name,
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Metropolis')),
              ),
              Row(
                children: <Widget>[
                  buildPrice(Theme.of(context)),
                ],
              )
            ],
          );
        },
        specialMark: "New");
  }

  Widget buildPrice(ThemeData _theme) {
    var hasDiscountPrice = product.discountPrice > 0;
    print('buildPrice');
    return Row(children: <Widget>[
      Text(
        product.price != null ? '\$' + product.price.toStringAsFixed(0) : '',
        style: display3.copyWith(
          decoration: product.discountPrice > 0
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      SizedBox(
        width: 4.0,
      ),
      hasDiscountPrice ? buildDiscountPrice(_theme) : Container(),
    ]);
  }

  Widget buildDiscountPrice(ThemeData _theme) {
    return Text('\$' + product.discountPrice.toStringAsFixed(0),
        style: display3.copyWith(color: _theme.errorColor));
  }
}
