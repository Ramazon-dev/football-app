import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softcity/constants/constants.dart';
import 'package:softcity/constants/sizeconfig.dart';
import 'package:softcity/providers/provider_swich_listtile.dart';
import 'package:softcity/widgets/elevated_button.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        height: getHeight(700),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: getHeight(335),
                width: getWidth(335),
                margin: EdgeInsets.all(getHeight(20)),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(getHeight(6)),
                  color: context.watch<ProviderThemeChanger>().isLight
                      ? colorBottomNavigationBarColor
                      : bottomNavLightBarColor,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: getWidth(15),
                        top: getHeight(13),
                        // right: getWidth(30),
                      ),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "To'lov kartasi - Visa",
                        style: TextStyle(
                          color: textColor,
                          fontSize: getHeight(18),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      height: getHeight(185),
                      width: getWidth(292),
                      margin: EdgeInsets.only(
                        left: getWidth(21),
                        top: getHeight(10),
                        right: getWidth(21),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                          image: AssetImage(
                            "assets/images/visa.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            child: Text(
                              "4278   3100   2112  3468",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: getHeight(15),
                              ),
                            ),
                            top: getHeight(90),
                            left: getWidth(18),
                          ),
                          Positioned(
                            child: Text(
                              "Bekmurod",
                              style: TextStyle(
                                  color: Colors.white, fontSize: getHeight(15)),
                            ),
                            top: getHeight(142),
                            left: getWidth(20),
                          ),
                          Positioned(
                            child: Text(
                              "Kapital Bank",
                              style: TextStyle(
                                  color: Colors.white, fontSize: getHeight(8)),
                            ),
                            top: getHeight(150),
                            left: getWidth(210),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButtonClass(
                      heightButton: getHeight(64),
                      weightButton: getWidth(308),
                      nameOfButton: "Telegram",
                      marginButton: getHeight(10),
                      pageCount: 1,
                    ),
                  ],
                ),
              ),

              //sdsdfghjkljhgfdsadfgh//

              Container(
                height: getHeight(335),
                width: getWidth(335),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(getHeight(6)),
                  color: context.watch<ProviderThemeChanger>().isLight
                      ? colorBottomNavigationBarColor
                      : bottomNavLightBarColor,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: getWidth(15),
                        top: getHeight(13),
                        // right: getWidth(30),
                      ),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "To'lov kartasi - Uzcard",
                        style: TextStyle(
                          color: textColor,
                          fontSize: getHeight(18),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      height: getHeight(185),
                      width: getWidth(292),
                      margin: EdgeInsets.only(
                        left: getWidth(21),
                        top: getHeight(10),
                        right: getWidth(21),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                          image: AssetImage(
                            "assets/images/uzcard.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            child: Text(
                              "UzCard",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: getHeight(20),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            top: getHeight(30),
                            left: getWidth(215),
                          ),
                          Positioned(
                            child: Text(
                              "8600   0423   4448  7755",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: getHeight(15),
                              ),
                            ),
                            top: getHeight(90),
                            left: getWidth(18),
                          ),
                          Positioned(
                            child: Text(
                              "Gulnora Akbarboyeva",
                              style: TextStyle(
                                  color: Colors.white, fontSize: getHeight(15)),
                            ),
                            top: getHeight(142),
                            left: getWidth(20),
                          ),
                          Positioned(
                            child: Text(
                              "Agro Bank",
                              style: TextStyle(
                                  color: Colors.white, fontSize: getHeight(8)),
                            ),
                            top: getHeight(150),
                            left: getWidth(210),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButtonClass(
                      heightButton: getHeight(64),
                      weightButton: getWidth(308),
                      nameOfButton: "Telegram",
                      marginButton: getHeight(10),
                      pageCount: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
