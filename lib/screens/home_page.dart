import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softcity/constants/constants.dart';
import 'package:softcity/constants/sizeconfig.dart';
import 'package:softcity/providers/provider_bottom_nav_bar.dart';
import 'package:softcity/providers/provider_swich_listtile.dart';
import 'package:softcity/screens/about_page.dart';
import 'package:softcity/screens/cards_page.dart';
import 'package:softcity/screens/home_body.dart';
import 'package:softcity/screens/settings_page.dart';
import 'package:softcity/screens/yangiliklar_page.dart';
import 'package:softcity/widgets/appbar.dart';
import 'package:softcity/widgets/bottom_nav_bar.dart';
import 'package:softcity/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  List<Widget> listOfPages = [
    HomeBody(),
    const YangiliklarPage(),
    const CardsPage(),
    SettingPage(),
  ];
  late ProviderBottomNavBar _bottomNavBar;
  @override
  Widget build(BuildContext context) {
    _bottomNavBar = context.watch();
    SizeConfig().init(context);
    return Scaffold(
      // backgroundColor: context.watch<ProviderThemeChanger>().isLight
      //     ? Colors.grey
      //     : scaffoldColor,
      appBar: AppBarClass(),
      drawer: DraverClass(),
      bottomNavigationBar: MyBottomBar(),
      body: listOfPages[_bottomNavBar.currentIndex],
    );
  }
}
