import 'package:flutter/material.dart';

class ZYBottomNavigationBarItem extends BottomNavigationBarItem {
  ZYBottomNavigationBarItem(String iconNmae, String title, {double width = 32})
      : super(
          title: Text(title),
          icon: Image.asset(
            "assets/images/tabbar/$iconNmae.png",
            width: width,
          ),
          activeIcon: Image.asset(
            "assets/images/tabbar/${iconNmae}_active.png",
            width: width,
            gaplessPlayback: true,
          ),
        );
}
