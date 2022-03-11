import 'package:flutter/material.dart';
import 'package:softcity/constants/sizeconfig.dart';

class DiwiderClass extends StatelessWidget {
  double heightdiwider;
  double indentdiwider;
  double endIndentdiwider;
  double thicknessdiwider;
  Color colordiwider;

  DiwiderClass({
    Key? key,
    this.heightdiwider = 10,
    this.indentdiwider = 20,
    this.endIndentdiwider = 20,
    this.thicknessdiwider = 1.5,
    this.colordiwider = const Color(0xffD9DBE9),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Divider(
      height: heightdiwider,
      indent: indentdiwider,
      endIndent: endIndentdiwider,
      thickness: thicknessdiwider,
      color: colordiwider,
    );
  }
}
