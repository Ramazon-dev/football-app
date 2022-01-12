import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softcity/providers/provider_bottom_nav_bar.dart';
import 'package:softcity/providers/provider_swich_listtile.dart';
import 'package:softcity/screens/sign_in_page.dart';
import 'package:softcity/theme/dark_theme.dart';
import 'package:softcity/theme/light_theme.dart';

void main() {
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
    return MaterialApp(
      home: SignInPage(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: context.watch<ProviderThemeChanger>().themeMode,
      theme: context.watch<ProviderThemeChanger>().isLight
          ? getDarkThemeData()
          : getLightThemeData(),
      // ThemeData(
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: Colors.white,
      //   ),
      //   primarySwatch: Colors.blue,
      // ),

      // darkTheme: ThemeData(
      //   drawerTheme: DrawerThemeData(),
      //   brightness: Brightness.dark,
      //   primarySwatch: Colors.orange,
      //   primaryColor: Colors.orange,
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: Colors.grey,
      //   ),
      // ),
    );
  }
}
