import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:softcity/constants/constants.dart';
import 'package:softcity/constants/sizeconfig.dart';
import 'package:softcity/get_storage/get_storage.dart';
import 'package:softcity/providers/provider_swich_listtile.dart';
import 'package:softcity/screens/auth/sign_in_page.dart';
import 'package:softcity/screens/widgets/diwider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  // late ProviderSwickListTile _providerSwickListTile;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
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
                "Settings",
                style: TextStyle(
                  color: textColor,
                  fontSize: getHeight(18),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: getHeight(15)),
              child: ListTile(
                leading: Text(
                  "Dark mode",
                  style: TextStyle(
                    color: textColor,
                    fontSize: getHeight(18),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: CupertinoSwitch(
                  value: context.watch<ProviderThemeChanger>().isLight,
                  onChanged: (bool v) {
                    context.read<ProviderThemeChanger>().changerTheme(v);
                  },
                ),
              ),
            ),
            DiwiderClass(
              thicknessdiwider: 2,
              colordiwider: const Color(0xffECECEC),
            ),
            ListTile(
              leading: Text(
                "Language",
                style: TextStyle(
                  color: textColor,
                  fontSize: getHeight(18),
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: getHeight(15),
                color: textColor,
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 58),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  fixedSize: Size(
                    getWidth(308),
                    getHeight(64),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getHeight(16),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(fixedSize: const Size(50, 50)),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => const SignInPage(),
            //       ),
            //     );
            //     GetStorage().remove('token');
            //     GetStorage().remove('status');
            //     GetStorage().remove('username');
            //     LocalSource.getInstance().removeProfile();
            //   },
            //   child: const Text("data"),
            // ),
          ],
        ),
      ),
    );
  }
}
