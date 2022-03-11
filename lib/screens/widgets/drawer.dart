import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:softcity/constants/constants.dart';
import 'package:softcity/constants/sizeconfig.dart';
import 'package:softcity/get_storage/get_storage.dart';
import 'package:softcity/providers/provider_bottom_nav_bar.dart';
import 'package:softcity/screens/auth/sign_in_page.dart';
import 'package:softcity/screens/main/cards/cards_page.dart';
import 'package:softcity/screens/main/contacts/contacts_page.dart';
import 'package:softcity/screens/main/home/home_body.dart';
import 'package:softcity/screens/main/settings/settings_page.dart';
import 'package:softcity/screens/main/news/yangiliklar_page.dart';
import 'package:softcity/screens/widgets/diwider.dart';

class DraverClass extends StatelessWidget {
  DraverClass({Key? key}) : super(key: key);
  List<Widget> listOfPages = [
     HomeBody(),
    const YangiliklarPage(),
    const CardsPage(),
    const SettingPage(),
  ];
  List<String> listOfText = [
    "Home",
    "News",
    "Payment",
    "Settings",
    "About",
  ];
  String name = GetStorage().read('name') ?? '';
  String status = GetStorage().read('status') ?? '';
  late ProviderBottomNavBar _bottomNavBar;

  @override
  Widget build(BuildContext context) {
    debugPrint(
      'getstoragedan keladigan status $status va ism $name',
    );
    _bottomNavBar = context.watch();

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: SizedBox(
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.amber,
                        width: 5,
                      ),
                      borderRadius: BorderRadius.circular(80),
                      color: Colors.transparent,
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(80),
                        image: const DecorationImage(
                          image: AssetImage(
                            "assets/images/circleavatar.jpg",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: getHeight(50)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            color: drawerTextColor,
                            fontSize: getHeight(18),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: getHeight(6)),
                          alignment: Alignment.center,
                          height: getHeight(18),
                          width: getWidth(58),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(getHeight(27)),
                              color: const Color(0xffFFDFED)),
                          child: Text(
                            status == '0' ? "Active" : "Not active",
                            style: TextStyle(
                              fontSize: getHeight(7),
                              color: const Color(0xffED2E7E),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: getHeight(320),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        if (index != 4) {
                          _bottomNavBar.setCurrentIndex(index);
                          Navigator.pop(context);
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ContactsPage(),
                            ),
                          );
                        }
                      },
                      leading: Text(
                        listOfText[index],
                        style: TextStyle(
                          color: drawerTextColor,
                          fontSize: getHeight(18),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    DiwiderClass(),
                  ],
                );
              },
              itemCount: listOfText.length,
            ),
          ),
          SizedBox(height: getHeight(200)),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInPage(),
                  ),
                );
                GetStorage().remove('token');
                GetStorage().remove('status');
                GetStorage().remove('username');
                LocalSource.getInstance().removeProfile();
              },
              child: const Text("log out"),
            ),
          ),
        ],
      ),
    );
  }
}
