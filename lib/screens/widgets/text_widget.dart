import 'package:flutter/material.dart';
import 'package:softcity/constants/constants.dart';
import 'package:softcity/constants/sizeconfig.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Text(
      "SINOV.UZ",
      style: TextStyle(
        color: textColor,
        fontSize: getHeight(24),
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
