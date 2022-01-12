import 'package:flutter/material.dart';
import 'package:softcity/constants/sizeconfig.dart';
import 'package:softcity/widgets/text_widget.dart';

class AppBarClass extends StatelessWidget with PreferredSizeWidget {
  const AppBarClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      title: const TextWidget(),
      centerTitle: true,
      actions: [
        Icon(Icons.timer, size: getHeight(30), color: const Color(0xffed2e7e)),
        Container(
          margin: EdgeInsets.only(
            right: getWidth(15),
            left: getWidth(7),
          ),
          child: Container(
            margin: EdgeInsets.only(right: getWidth(8), bottom: 8),
            height: getHeight(46),
            width: getHeight(46),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(100),
              image: const DecorationImage(
                image: AssetImage(
                  "assets/images/circleavatar.jpg",
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 56);
}
