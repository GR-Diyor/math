import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:math/view/home.dart';

class WinViewModel extends ChangeNotifier{

  var audioPlayer = AudioPlayer();
  static void reStart(BuildContext context) {
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
          return  const Home();
        },
      ));
    });
  }


  Future<void> setAudio()async{
    await audioPlayer.setSource(AssetSource("audio/success.mp3"));
    audioPlayer.resume();
  }
}