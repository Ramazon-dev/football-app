import 'package:flutter/material.dart';
import 'package:softcity/constants/constants.dart';
import 'package:softcity/constants/sizeconfig.dart';
import 'package:softcity/screens/home_page.dart';
import 'package:softcity/widgets/elevated_button.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  String name = "ramazon";
  String password = "tojiboyev";
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
                          validator: (value) {
                            if (value != name) {
                              return "Name was writen wrong";
                            } else {
                              return null;
                            }
                          },
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
                          validator: (value) {
                            if (value != name) {
                              return "Password was writen wrong";
                            } else {
                              return null;
                            }
                          },
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
