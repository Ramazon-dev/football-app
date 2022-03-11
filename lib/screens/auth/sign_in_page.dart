import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:softcity/constants/constants.dart';
import 'package:softcity/constants/sizeconfig.dart';
import 'package:softcity/get_storage/get_storage.dart';
import 'package:softcity/models/customer.dart';
import 'package:softcity/models/login.dart';
import 'package:softcity/screens/main/home/home_page.dart';
import 'package:softcity/screens/widgets/elevated_button.dart';
import 'package:softcity/service/auth/sign_in/sign_in_service.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // LocalSource _localsource = LocalSource();
  final GlobalKey formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: getHeight(-43),
            left: getWidth(-60),
            child: Container(
              height: getHeight(350),
              width: getWidth(494),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/sinov_uz.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: getHeight(55),
            width: MediaQuery.of(context).size.width,
            child: Container(
              height: getHeight(130),
              width: getWidth(130),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/lamp.png",
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: getHeight(200),
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Text(
                "SINOV.UZ",
                style: TextStyle(
                  color: textColor,
                  fontSize: getHeight(36),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Positioned(
            top: getHeight(275),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: getHeight(700),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(25)),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: getHeight(67),
                        ),
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: getHeight(24),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: getHeight(20)),
                        child: TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: textFormFieldColor,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            labelText: "Name",
                            labelStyle: const TextStyle(
                              color: Color(0xffA0A3BD),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: getHeight(20)),
                        child: TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: textFormFieldColor,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            labelText: "Password",
                            labelStyle: const TextStyle(
                              color: Color(0xffA0A3BD),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButtonClass(
                        nameOfButton: 'Sign in',
                        ontap: () async {
                          LogInModel token = await login(
                              nameController.text, passwordController.text);
                          String t = token.accessToken ?? '';
                          String username = token.user!.fName ?? 'ism kelmadi';
                          String status = token.user!.status.toString();
                          await GetStorage().write('token', t);
                          await GetStorage().write('username', username);
                          await GetStorage().write('status', status);
                          String asdfg = await GetStorage().read('token');
                          String st = await GetStorage().read('status');
                          String name = await GetStorage().read('username');
                          LocalSource.getInstance().setProfile(
                            Customer(
                              refreshToken: token.refreshToken,
                              accessToken: token.accessToken,
                              id: token.user!.id.toString(),
                              name: token.user!.fName,
                              phone: token.user!.phone,
                              // createdAt: token.user!.
                            ),
                          );
                          if (token.accessToken!.isNotEmpty) {
                            debugPrint(
                                'token localsource dan togri keldi: $asdfg');
                            debugPrint('Statusni koramiza endi: $st');
                            debugPrint('name kelishi kerak: $name');

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text(
                                "",
                                style: TextStyle(color: Colors.red),
                              ),
                              duration: const Duration(seconds: 3),
                              action: SnackBarAction(
                                label: 'Hush kelibsiz',
                                onPressed: () {},
                              ),
                            ));
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                                (route) => false);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text(
                                "Xato",
                                style: TextStyle(color: Colors.red),
                              ),
                              duration: const Duration(seconds: 3),
                              action: SnackBarAction(
                                label: 'email yoki parol xato kiritildi',
                                onPressed: () {},
                              ),
                            ));

                            debugPrint("token xato keldi mana qaren $token ");
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
