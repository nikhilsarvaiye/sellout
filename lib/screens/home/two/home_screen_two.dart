import 'package:flutter/material.dart';
import 'package:sellout/config/theme.dart';

class HomeScreenTwo extends StatelessWidget {
  static String get routeName => '/home2';

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      Container(
          height: width * 0.96,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/splash/main3.png'),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(
                      left: AppSizes.sidePadding, bottom: AppSizes.sidePadding),
                  width: width,
                  child: Text('New collection',
                      style: _theme.textTheme.headline5.copyWith(fontSize: 34)))
            ],
          )),
      Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                  alignment: Alignment.centerLeft,
                  width: width / 2,
                  height: width / 2 - 2,
                  padding: EdgeInsets.all(AppSizes.sidePadding),
                  child: Text('Valentine Special',
                      style: _theme.textTheme.headline5
                          .copyWith(fontSize: 34, color: _theme.accentColor))),
              Container(
                  height: width / 2,
                  width: width / 2,
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.only(
                      bottom: AppSizes.sidePadding, left: AppSizes.sidePadding),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/splash/bottombanner.png'),
                    ),
                  ),
                  child: Text('Black',
                      style:
                          _theme.textTheme.headline5.copyWith(fontSize: 34))),
            ],
          ),
          Container(
              height: width / 2 * 1.99,
              width: width / 2,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: AppSizes.sidePadding),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/splash/sidebanner.png'),
                ),
              ),
              child: Text('Family',
                  style: _theme.textTheme.headline5.copyWith(fontSize: 34))),
        ],
      ),
      Padding(padding: EdgeInsets.only(top: AppSizes.sidePadding))
    ]));
  }
}
