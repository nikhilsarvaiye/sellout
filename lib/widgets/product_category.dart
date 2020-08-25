import 'package:flutter/material.dart';
import 'package:sellout/config/theme.dart';
import 'package:sellout/widgets/image.dart';

class ProductCategory {
  final String id;
  final int parentId;
  final String name;
  final String description;
  final ProductImage image;
  final bool isCategoryContainer;

  ProductCategory(
    this.id, {
    int parentId,
    this.name,
    this.description,
    this.image,
    bool isCategoryContainer,
  })  : parentId = parentId ?? 0,
        isCategoryContainer = isCategoryContainer ?? false;
}

class ProductCategoryWidget extends StatelessWidget {
  final ProductCategory category;

  const ProductCategoryWidget({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    final display1 = TextStyle(
        color: AppColors.black,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'Metropolis');
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
            top: AppSizes.sidePadding,
            bottom: AppSizes.sidePadding,
            left: AppSizes.sidePadding * 2,
            right: AppSizes.sidePadding),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: _theme.primaryColorLight, width: 0.4),
          ),
        ),
        child: Text(category.name,
            style: display1.copyWith(fontWeight: FontWeight.normal)));
  }
}

class ProductCategoryTileWidget extends StatelessWidget {
  final ProductCategory category;
  final double height;
  final double width;

  const ProductCategoryTileWidget(
      {Key key, this.category, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final display1 = TextStyle(
        color: AppColors.black,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'Metropolis');
    return Padding(
        padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
        child: Container(
            padding: EdgeInsets.only(left: AppSizes.sidePadding),
            height: height,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppSizes.imageRadius),
            ),
            child: Row(
              children: <Widget>[
                Container(
                    alignment: Alignment.centerLeft,
                    width: width - 200.0,
                    child: Text(category.name, style: display1)),
                Container(
                  width: 200,
                  alignment: Alignment.centerRight,
                  child: Image(image: NetworkImage(category.image.url)),
                )
              ],
            )));
  }
}
