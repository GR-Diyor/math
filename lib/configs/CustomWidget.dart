import 'package:flutter/material.dart';

class CustomWidget{
  static Widget FullScreen(BuildContext context,{required Widget child}) {
    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: child,
    );
  }
}