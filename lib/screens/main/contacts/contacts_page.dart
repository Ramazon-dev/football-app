import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softcity/constants/constants.dart';
import 'package:softcity/constants/sizeconfig.dart';
import 'package:softcity/providers/provider_bottom_nav_bar.dart';
import 'package:softcity/providers/provider_swich_listtile.dart';
import 'package:softcity/screens/widgets/appbar.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsPage extends StatelessWidget {
  ContactsPage({Key? key}) : super(key: key);
  late ProviderBottomNavBar _bottomNavBar;

  @override
  Widget build(BuildContext context) {
    _bottomNavBar = context.watch();

    return Scaffold(
      appBar: const AppBarClass(),
      // bottomNavigationBar: MyBottomBar(),
      body: Container(
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
              : Colors.white,
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(
                left: getWidth(13),
                top: getHeight(13),
                right: getWidth(30),
              ),
              child: Text(
                "Contacts",
                style: TextStyle(
                  color: textColor,
                  fontSize: getHeight(18),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // ListTile(
            //   title: const Text("Launch Web Page (with Web View)"),
            //   onTap: () async {
            //     const url = 'https://google.com';

            //     if (await canLaunch(url)) {
            //       await launch(url, forceWebView: true);
            //     } else {
            //       throw 'Could not launch $url';
            //     }
            //   },
            // ),
            ListTile(
              // leading: UrlTextWidget(
              //   url: 'https://t.me/ramazon1681',
              //   text: '+998(90) 962 16 81',
              // ),
              onTap: () async {
                const url = 'tel: +998994098220';
                if (await canLaunch(url)) {
                  await launch(url, forceSafariVC: false);
                } else {
                  throw 'Could not launch $url';
                }
              },
              leading: Text(
                "Tel: +998 (99) 409 82 20",
                style: TextStyle(
                  color: textColor,
                  fontSize: getHeight(18),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Divider(
              thickness: 2,
              endIndent: 15,
              indent: 15,
              color: Color(0xffECECEC),
            ),
            ListTile(
              onTap: () async {
                const url = 'https://t.me/softcity_admin';
                if (await canLaunch(url)) {
                  await launch(url, forceSafariVC: false);
                } else {
                  throw 'Could not launch $url';
                }
              },
              leading: Text(
                "E-mail: info@mail.site",
                style: TextStyle(
                  color: textColor,
                  fontSize: getHeight(18),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: getHeight(25), left: getWidth(12)),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () async {
                      const url = 'https://facebook.com/SoftcityCompany/';
                      if (await canLaunch(url)) {
                        await launch(url, forceSafariVC: false);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: getWidth(15)),
                      height: getHeight(36),
                      width: getWidth(36),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/facebook.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      const url = 'https://instagram.com/softcitycompany/';
                      if (await canLaunch(url)) {
                        await launch(url, forceSafariVC: false);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: getWidth(15)),
                      height: getHeight(36),
                      width: getWidth(36),
                      decoration: const BoxDecoration(
                        color: Colors.yellow,
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/instagram.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      const url = 'https://t.me/softcity_fm/';
                      if (await canLaunch(url)) {
                        await launch(url, forceSafariVC: false);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: getWidth(15)),
                      height: getHeight(36),
                      width: getWidth(36),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/telegram.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
