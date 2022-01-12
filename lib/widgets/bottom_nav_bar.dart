import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:softcity/providers/provider_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class MyBottomBar extends StatelessWidget {
  MyBottomBar({Key? key}) : super(key: key);

  late ProviderBottomNavBar _bottomNavBar;

  @override
  Widget build(BuildContext context) {
    _bottomNavBar = context.watch();
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 14,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      fixedColor: Colors.blue,
      elevation: 10,
      currentIndex: _bottomNavBar.currentIndex,
      onTap: _bottomNavBar.setCurrentIndex,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/images/Home.svg"),
          label: "home",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/images/Bookmark.svg"),
          label: "about",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/images/File.svg"),
          label: "card",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/images/Profile.svg",
          ),
          label: "settings",
        ),
      ],
    );
  }
}
