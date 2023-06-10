import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:math/models/question_model.dart';
import 'package:math/view/game.dart';
import 'package:math/view/lose.dart';
import '../models/database.dart';
import '../view/win.dart';

class GameViewModel extends ChangeNotifier{
    late  List<QuestionModel> levelQuestions;
   int currentQuestionIndex = 0;
   int correctQuestionsCount = 0;

    //timer
    int remainingSecond = 1;
   Timer? periodicTimer;
    int seconds = 20;


    void nextPage(BuildContext context,List<QuestionModel> level){
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
            return  Game(level:level,);
          },
        ));
      });
    }

  onVariantTap(BuildContext context,String answer,List<QuestionModel> level) {
    QuestionModel question = levelQuestions[currentQuestionIndex];
    if (question.trueAnswer == answer) {
      correctQuestionsCount++;
      print(correctQuestionsCount);
    }
    if (levelQuestions.length-1 > currentQuestionIndex) {
     if(level!=easy){ periodicTimer?.cancel();}
      currentQuestionIndex++;
     if(level!=easy){ setTimer(context,level);}
      notifyListeners();
    } else {
      correctQuestionsCount ==12?
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Win(correctAnswersCount: correctQuestionsCount);
          },
        ),
      ): Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Lose(correctAnswersCount: correctQuestionsCount);
          },
        ),
      );
    }
    notifyListeners();
  }




     setTimer(BuildContext context,List<QuestionModel> level) {
       int second = level!=hard?20:10;
       remainingSecond=second;
       notifyListeners();
      periodicTimer = Timer.periodic(
          const Duration(seconds: 1),
              (timer) {
            print("TIME:${remainingSecond} ");
            if (remainingSecond == 0) {
              seconds=int.parse("0");
              timer.cancel();
              if (levelQuestions.length - 1 > currentQuestionIndex) {
                currentQuestionIndex++;
               // seconds = 20;
                timer.cancel();
                setTimer(context,level);
                notifyListeners();
              } else {
                timer.cancel();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Lose(
                          correctAnswersCount: correctQuestionsCount);
                    },
                  ),
                );
              }
            }else{
              int second = (remainingSecond%60);
              seconds = int.parse(second.toString().padLeft(2,"0") );
              remainingSecond--;
            }
            notifyListeners();
          });
    }

}