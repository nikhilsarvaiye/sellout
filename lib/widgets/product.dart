import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sellout/config/theme.dart';
import 'package:sellout/widgets/base_product_list_item.dart';
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

class ProductTileWidget extends StatelessWidget {
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
  final VoidCallback onClick;
  final VoidCallback onLike;
  ProductTileWidget(this.product, {this.onClick, this.onLike});

  @override
  Widget build(BuildContext context) {
    return BaseProductTile(
        onClick: onClick,
        bottomRoundButton: LikeWidget(product.liked, onLike, ""),
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

class ProductListItemWidget extends StatelessWidget {
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
  final VoidCallback onClick;
  final VoidCallback onLike;
  ProductListItemWidget(this.product, {this.onClick, this.onLike});

  @override
  Widget build(BuildContext context) {
    return BaseProductListItem(
        onClick: onClick,
        inactiveMessage: product.price == null || product.price > 0
            ? null
            : 'Sorry, this item is currently sold out',
        bottomRoundButton: _getFavoritesButton(() {
          print('liked');
        }),
        image: NetworkImage(
          product.mainImage.url,
        ),
        onRemove: () => {print('onRemove')},
        specialMark: 'New',
        mainContentBuilder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(product.name, style: display1),
              Row(
                children: <Widget>[
                  _buildColor(Theme.of(context), null),
                  Padding(
                    padding: EdgeInsets.all(AppSizes.linePadding),
                  ),
                  _buildSize(Theme.of(context), null),
                ],
              ),
              Row(
                children: <Widget>[
                  buildPrice(Theme.of(context)),
                  Padding(
                    padding: EdgeInsets.only(left: AppSizes.linePadding),
                  ),
                  buildRating(context)
                ],
              )
            ],
          );
        });
  }

  Widget _getFavoritesButton(VoidCallback onFavoritesClick) {
    return FloatingActionButton(
      heroTag: product.name +
          Random()
              .nextInt(1000000)
              .toString(), //TODO make sure that there is only one product with specified id on screen and use it as a tag
      mini: true,
      backgroundColor: AppColors.white,
      onPressed: onFavoritesClick,
      child: product.liked
          ? Icon(
              FontAwesomeIcons.solidHeart,
              color: AppColors.red,
              size: 18.0,
            )
          : Icon(
              FontAwesomeIcons.heart,
              color: AppColors.red,
              size: 18.0,
            ),
    );
  }

  Widget _removeFromCart(VoidCallback onClick) {
    return FloatingActionButton(
      heroTag: 'Remove from Cart' + Random().nextInt(1000000).toString(),
      backgroundColor: AppColors.red,
      onPressed: onClick,
      child: Icon(
        FontAwesomeIcons.cartPlus,
        color: AppColors.white,
      ),
    );
  }

  Widget buildRating(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            top: AppSizes.linePadding, bottom: AppSizes.linePadding),
        child: ProductRating(
          rating: 4.5,
          ratingCount: 101,
          alignment: MainAxisAlignment.start,
          iconSize: 12,
          labelFontSize: 12,
        ));
  }

  Widget _buildColor(
      ThemeData _theme, HashMap<Product, String> selectedAttributes) {
    String colorValue = '';
    selectedAttributes?.forEach((attribute, value) {
      if (attribute.name == 'Color') colorValue = value;
    });
    return colorValue.isNotEmpty
        ? Row(
            children: <Widget>[
              Text('Color:', style: _theme.textTheme.bodyText1.copyWith()),
              Padding(
                padding: EdgeInsets.only(left: AppSizes.linePadding),
              ),
              Text(colorValue,
                  style: _theme.textTheme.bodyText1
                      .copyWith(color: AppColors.black))
            ],
          )
        : Row();
  }

  Row _buildSize(
      ThemeData _theme, HashMap<Product, String> selectedAttributes) {
    String sizeValue = '';
    selectedAttributes?.forEach((attribute, value) {
      if (attribute.name == 'Size') sizeValue = value;
    });
    return sizeValue.isNotEmpty
        ? Row(
            children: <Widget>[
              Text('Size:', style: _theme.textTheme.bodyText1.copyWith()),
              Padding(
                padding: EdgeInsets.only(left: AppSizes.linePadding),
              ),
              Text(sizeValue,
                  style: _theme.textTheme.bodyText1
                      .copyWith(color: AppColors.black))
            ],
          )
        : Row();
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
