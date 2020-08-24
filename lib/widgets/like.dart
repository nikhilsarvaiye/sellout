import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sellout/config/theme.dart';

class LikeWidget extends StatelessWidget {
  final imageHeight = 184;
  final imageWidth = AppSizes.tile_width;
  final tileHeight = AppSizes.tile_height;

  final String title;
  final bool liked;
  final VoidCallback onClick;

  LikeWidget(this.liked, this.onClick, this.title);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: title + Random().nextInt(1000000).toString(),
      mini: true,
      backgroundColor: AppColors.white,
      onPressed: onClick,
      child: liked
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
}
