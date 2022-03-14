import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:softcity/get_storage/get_storage.dart';
import 'package:softcity/providers/provider_bottom_nav_bar.dart';
import 'package:softcity/providers/provider_swich_listtile.dart';
import 'package:softcity/screens/auth/sign_in_page.dart';
import 'package:softcity/screens/main/home/home_page.dart';
import 'package:softcity/theme/dark_theme.dart';
import 'package:softcity/theme/light_theme.dart';

void main() async {
  await GetStorage.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProviderBottomNavBar()),
        ChangeNotifierProvider(create: (context) => ProviderThemeChanger()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool aaa = LocalSource.getInstance().hasProfile();
    debugPrint("Has profile $aaa 1");
    String token = LocalSource.getInstance().token() ?? '';
    debugPrint("local source dan token olindi $token 1");
    String taken = GetStorage().read('token') ?? '';
    debugPrint("get storage dan token olindi $taken 1");
    // bool torimi = JwtDecoder.isExpired(token);
    // debugPrint("token srogi tugasa true chiqaradi ungacha $torimi 1");
    // late bool saga;
    // if (taken.isNotEmpty) {
    //   saga = true;
    // } else {
    //   saga = false;
    // }

    return MaterialApp(
      // home: SignInPage(),

      home: token != '' ? HomePage() : const SignInPage(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: context.watch<ProviderThemeChanger>().themeMode,
      theme: context.watch<ProviderThemeChanger>().isLight
          ? getDarkThemeData()
          : getLightThemeData(),
    );
  }
}
