import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sellout/config/app_settings.dart';
import 'package:sellout/config/routes.dart';

class BottomMenu extends StatelessWidget {
  final int menuIndex;

  BottomMenu(this.menuIndex);

  Color colorByIndex(ThemeData theme, int index) {
    return index == menuIndex ? theme.accentColor : theme.primaryColorLight;
  }

  BottomNavigationBarItem getItem(
      String image, String title, ThemeData theme, int index) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        image,
        height: 24.0,
        width: 24.0,
        color: colorByIndex(theme, index),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 10.0,
          color: colorByIndex(theme, index),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    List<BottomNavigationBarItem> menuItems = [
      getItem('assets/icons/bottom_menu/home.svg', 'Home', _theme, 0),
      getItem('assets/icons/bottom_menu/cart.svg', 'Shop', _theme, 1),
      getItem('assets/icons/bottom_menu/bag.svg', 'Bag', _theme, 2),
      getItem('assets/icons/bottom_menu/favorites.svg', 'Favorites', _theme, 3),
    ];
    if (AppSettings.profileEnabled) {
      menuItems.add(getItem(
          'assets/icons/bottom_menu/profile.svg', 'Profile', _theme, 4));
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15), topLeft: Radius.circular(15)),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: menuIndex,
          onTap: (value) {
            switch (value) {
              case 0:
                Navigator.pushNamed(context, Routes.home);
                break;
              case 1:
                Navigator.pushNamed(context, Routes.shop);
                break;
              case 2:
                Navigator.pushNamed(context, Routes.cart);
                break;
              case 3:
                Navigator.pushNamed(context, Routes.favourites);
                break;
              case 4:
                Navigator.pushNamed(context, Routes.profile);
                break;
            }
          },
          items: menuItems,
        ),
      ),
    );
  }
}
