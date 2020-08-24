import 'package:flutter/material.dart';
import 'package:sellout/config/theme.dart';
import 'package:sellout/widgets/product.dart';

class ProductListWidget extends StatelessWidget {
  final double width;
  final double height = 284;
  final List<Product> products;
  final Function(Product product) onFavoritesTap;

  const ProductListWidget(
      {Key key, this.width, this.products, @required this.onFavoritesTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('product number is ${products.length}');
    return Container(
        padding: EdgeInsets.only(top: AppSizes.sidePadding),
        width: width,
        height: height,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: products
                .map((product) => ProductWidget(product)
                    // product.getTileView(
                    //   context: context,
                    //   onFavoritesClick: (() => {onFavoritesTap(product)}),
                    //   showProductInfo: () {
                    //     Navigator.of(context).pushNamed(
                    //       Routes.product,
                    //       // arguments: ProductDetailsParameters(
                    //       //     product.id,
                    //       //     product.categories.isNotEmpty
                    //       //         ? product.categories[0].id
                    //       //         : 0)
                    //     );
                    //   },
                    // )
                    )
                .toList(growable: false)));
  }
}
