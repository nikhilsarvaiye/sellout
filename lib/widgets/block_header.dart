import 'package:flutter/material.dart';
import 'package:sellout/config/theme.dart';

class OpenFlutterBlockHeader extends StatelessWidget {
  final double width;
  final String title;
  final String linkText;
  final VoidCallback onLinkTap;
  final String description;

  const OpenFlutterBlockHeader(
      {Key key,
      @required this.width,
      @required this.title,
      this.linkText,
      this.onLinkTap,
      this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return Card(
      child: InkWell(
        onTap: onLinkTap,
        child: Container(
          padding: EdgeInsets.only(
            top: AppSizes.sidePadding,
            left: AppSizes.sidePadding,
            right: AppSizes.sidePadding2,
            bottom: AppSizes.sidePadding2,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    // width: width - rightLinkWidth,
                    child: Text(title, style: _theme.textTheme.caption),
                  ),
                  linkText != null
                      ? Container(
                          // width: rightLinkWidth,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(linkText,
                                style: _theme.textTheme.bodyText1),
                          ),
                        )
                      : Container(),
                ],
              ),
              description != null
                  ? Container(
                      padding: EdgeInsets.only(left: AppSizes.sidePadding2),
                      child: Text(
                        description,
                        style: _theme.textTheme.bodyText1,
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
