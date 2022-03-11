import 'package:flutter/material.dart';
import 'package:softcity/constants/sizeconfig.dart';
import 'package:softcity/screens/main/contacts/contacts_page.dart';
import 'package:softcity/screens/main/home/home_page.dart';

class ElevatedButtonClass extends StatelessWidget {
  double weightButton;
  double heightButton;
  double marginButton;
  String nameOfButton;
  Function ontap;

  ElevatedButtonClass({
    Key? key,
    this.heightButton = 64,
    this.weightButton = 308.0,
    this.marginButton = 58,
    required this.nameOfButton,
    required this.ontap,
  }) : super(key: key);
  List<Widget> listOfPages = [
    HomePage(),
    ContactsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        top: marginButton,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          fixedSize: Size(
            weightButton,
            heightButton,
          ),
        ),
        onPressed: () => ontap(),
        child: Text(
          nameOfButton,
          style: TextStyle(
            color: Colors.white,
            fontSize: getHeight(16),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
