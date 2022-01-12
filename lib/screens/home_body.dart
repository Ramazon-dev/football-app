import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softcity/constants/constants.dart';
import 'package:softcity/constants/sizeconfig.dart';
import 'package:softcity/providers/provider_swich_listtile.dart';
import 'package:softcity/screens/info_page.dart';
import 'package:softcity/widgets/diwider.dart';

class HomeBody extends StatelessWidget {
  HomeBody({Key? key}) : super(key: key);

  String firstCommand = "  Real Madrid";
  String secondCommand = "  Barcelona";

  String firstImage = "assets/images/real.jpg";
  String secondImage = "assets/images/barcelona.jpg";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getWidth(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: getHeight(20)),
            height: getHeight(100),
            width: getWidth(335),
            color: Colors.transparent,
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(10),
              color: const Color(0xffC7DDF2),
              strokeWidth: 2,
              dashPattern: const [5, 5],
              child: Container(
                alignment: Alignment.center,
                height: getHeight(100),
                width: getWidth(335),
                decoration: BoxDecoration(
                  color: context.watch<ProviderThemeChanger>().isLight
                      ? colorBottomNavigationBarColor
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Your ADS here",
                  style: TextStyle(
                    color: const Color(0xffAFBCBF),
                    fontSize: getHeight(24),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: getHeight(20)),
            height: getHeight(530),
            width: getWidth(335),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(6),
              color: context.watch<ProviderThemeChanger>().isLight
                  ? colorBottomNavigationBarColor
                  : Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: getHeight(21)),
                  child: Text(
                    "Game tours",
                    style: TextStyle(
                      // color: const Color(0xff6E7191),
                      fontSize: getHeight(15),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  height: getHeight(452),
                  width: getWidth(335),
                  margin: EdgeInsets.only(top: getHeight(28)),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InfoPage(
                                    firstCommandFormHomePage: firstCommand,
                                    secondCommandFormHomePage: secondCommand,
                                    firstImage: firstImage,
                                    secondImage: secondImage,
                                  ),
                                ),
                              );
                            },
                            leading: SizedBox(
                              width: getHeight(120),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: getHeight(15),
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: AssetImage(firstImage),
                                  ),
                                  Text(
                                    firstCommand,
                                    style: TextStyle(
                                      color: context
                                              .watch<ProviderThemeChanger>()
                                              .isLight
                                          ? Colors.white
                                          : Color(0xff4E4B66),
                                      fontSize: getHeight(15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            title: const Center(child: Text("____")),
                            trailing: SizedBox(
                              width: getWidth(120),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: getHeight(15),
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: AssetImage(
                                      secondImage,
                                    ),
                                  ),
                                  Text(
                                    secondCommand,
                                    style: TextStyle(
                                      color: context
                                              .watch<ProviderThemeChanger>()
                                              .isLight
                                          ? Colors.white
                                          : Color(0xff4E4B66),
                                      fontSize: getHeight(15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          DiwiderClass(),
                        ],
                      );
                    },
                    itemCount: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
