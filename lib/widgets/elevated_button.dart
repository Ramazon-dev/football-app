import 'package:flutter/material.dart';
import 'package:softcity/constants/constants.dart';
import 'package:softcity/constants/sizeconfig.dart';
import 'package:softcity/screens/contacts_page.dart';
import 'package:softcity/screens/home_page.dart';

class ElevatedButtonClass extends StatelessWidget {
  double weightButton;
  double heightButton;
  double marginButton;
  String nameOfButton;
  int pageCount;
  // Widget nameOfPage;

  ElevatedButtonClass({
    Key? key,
    this.heightButton = 64,
    this.weightButton = 308.0,
    this.marginButton = 58,
    this.nameOfButton = "Sing in",
    this.pageCount = 0,
    // this.nameOfPage = ,
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          fixedSize: Size(
            weightButton,
            heightButton,
          ),
        ),
        onPressed: () {
          if (pageCount == 0) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => listOfPages[0],
              ),
              (route) => false,
            );
          } else if (pageCount == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => listOfPages[1]));
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => listOfPages[2]));
          }
        },
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
