import 'package:flutter/material.dart';

class FIleClass extends StatelessWidget with PreferredSizeWidget {
  const FIleClass({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 150);
}