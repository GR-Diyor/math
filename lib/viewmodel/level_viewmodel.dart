import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:math/view/game.dart';

import 'game_viewmodel.dart';

class LevelViewModel extends ChangeNotifier{
  GameViewModel gameViewModel = GameViewModel();

   void nextPage(BuildContext context){
    Future.delayed(const Duration(milliseconds: 100), () {
      Navigator.pushReplacement(context, PageRouteBuilder(
        // transitionDuration: const Duration(milliseconds: 300),
        // transitionsBuilder: (BuildContext context, Animation<double>_anim,
        //     Animation<double>_anim2,Widget child){
        //   _anim= CurvedAnimation(parent: _anim, curve: Curves.decelerate);
        //   return ScaleTransition(scale: _anim,
        //     child: child,);
        // },
        pageBuilder: (BuildContext context, Animation<double>_anim,
            Animation<double>_anim2) {
          return  Game(level: [],);
        },
      ));
    });
  }
}