import 'package:flutter/material.dart';
import 'package:sellout/config/theme.dart';

class Button extends StatelessWidget {
  final double width;
  final double height;
  final Function onPressed;
  final String title;
  final IconData icon;
  final double iconSize;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  Button({
    Key key,
    this.width,
    this.height,
    @required this.title,
    @required this.onPressed,
    this.icon,
    this.backgroundColor = AppColors.red,
    this.textColor = AppColors.white,
    this.borderColor = AppColors.red,
    this.iconSize = 18.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    EdgeInsetsGeometry edgeInsets = EdgeInsets.all(0);
    if (width == null || height == null) {
      edgeInsets = EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
    }
    return Padding(
      padding: edgeInsets,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: width,
          height: height,
          padding: edgeInsets,
          decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(color: borderColor),
              borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
              boxShadow: [
                BoxShadow(
                    color: backgroundColor.withOpacity(0.3),
                    blurRadius: 4.0,
                    offset: Offset(0.0, 5.0)),
              ]),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                icon != null
                    ? Padding(
                        padding: const EdgeInsets.only(
                          right: 8.0,
                        ),
                        child: Icon(
                          icon,
                          size: iconSize,
                          color: _theme.textTheme.button.color,
                        ),
                      )
                    : SizedBox(),
                Text(
                  title,
                  style: _theme.textTheme.button.copyWith(
                    backgroundColor: _theme.textTheme.button.backgroundColor,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
