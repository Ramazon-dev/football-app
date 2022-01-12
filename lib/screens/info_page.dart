import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softcity/constants/constants.dart';
import 'package:softcity/constants/sizeconfig.dart';
import 'package:softcity/providers/provider_swich_listtile.dart';
import 'package:softcity/widgets/appbar.dart';

class InfoPage extends StatelessWidget {
  String? firstCommandFormHomePage;
  String? secondCommandFormHomePage;

  String? firstImage;
  String? secondImage;

  InfoPage({
    Key? key,
    this.firstCommandFormHomePage,
    this.secondCommandFormHomePage,
    this.firstImage,
    this.secondImage,
  }) : super(key: key);

  List<String> lisgOfStats = [
    "Shots",
    "Shots on target",
    "Posession",
    "Passes",
    "Fauls",
    "Pass accuracy",
    "Yellow cards",
    "Red cards",
    "Offsides",
    "Corners",
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBarClass(),
      body: Container(
        height: getHeight(470),
        width: getWidth(335),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: context.watch<ProviderThemeChanger>().isLight
              ? colorBottomNavigationBarColor
              : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: getHeight(73),
              width: getWidth(335),
              margin: EdgeInsets.only(
                top: getHeight(28),
                left: getWidth(20),
                right: getWidth(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 6),
                        height: getHeight(52),
                        width: getWidth(39),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.transparent,
                          image: DecorationImage(
                            image: AssetImage(
                              firstImage.toString(),
                            ),
                          ),
                        ),
                      ),
                      Text(firstCommandFormHomePage.toString()),
                    ],
                  ),
                  Container(
                    height: getHeight(48),
                    width: getWidth(50),
                    child: Column(
                      children: [
                        Text(
                          "00:45",
                          style: TextStyle(
                            fontSize: getHeight(16),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Divider(
                          thickness: 1.5,
                        ),
                        Text(
                          "Jan 12",
                          style: TextStyle(
                            fontSize: getHeight(11),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 6),
                        height: getHeight(52),
                        width: getWidth(39),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.transparent,
                          image: DecorationImage(
                            image: AssetImage(
                              secondImage.toString(),
                            ),
                          ),
                        ),
                      ),
                      Text(secondCommandFormHomePage.toString()),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: getHeight(23)),
              child: Text(
                "TEAM STATS",
                style: TextStyle(
                  fontSize: getHeight(14),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              height: getHeight(260),
              width: getWidth(295),
              margin: EdgeInsets.only(top: getHeight(20)),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: getHeight(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                        Text(
                          "0",
                          style: TextStyle(
                            fontSize: getHeight(14),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          lisgOfStats[index],
                          style: TextStyle(
                            fontSize: getHeight(14),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "0",
                          style: TextStyle(
                            fontSize: getHeight(14),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: lisgOfStats.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ListTile(
                    leading: Text(
                      "0",
                      style: TextStyle(
                        fontSize: getHeight(14),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: Text(
                      "0",
                      style: TextStyle(
                        fontSize: getHeight(14),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    title: Center(
                      child: Text(
                        lisgOfStats[index],
                        style: TextStyle(
                          fontSize: getHeight(14),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )*/
