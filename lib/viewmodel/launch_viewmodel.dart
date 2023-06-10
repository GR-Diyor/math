import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:math/view/home.dart';

class LaunchViewModel extends ChangeNotifier{
  static void nextPage(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 3000), () {
Navigator.pushReplacement(context, PageRouteBuilder(
      // transitionDuration: const Duration(milliseconds: 500),
      // transitionsBuilder: (BuildContext context, Animation<double>_anim,
      //     Animation<double>_anim2,Widget child){
      //   _anim= CurvedAnimation(parent: _anim, curve: Curves.decelerate);
      //   return ScaleTransition(scale: _anim,
      //     child: child,);
      // },

      pageBuilder: (BuildContext context, Animation<double>_anim,
          Animation<double>_anim2) {
        return const Home();
      },
  ));
  });
  }
}
