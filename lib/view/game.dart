import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:math/configs/AppString.dart';
import 'package:math/models/database.dart';
import 'package:math/models/question_model.dart';
import 'package:math/view/variants.dart';
import 'package:math/viewmodel/game_viewmodel.dart';
import 'package:provider/provider.dart';
import '../configs/AppColor.dart';
import '../configs/AppSetting.dart';
import '../configs/AppSize.dart';
import '../utills/extensions.dart';


class Game extends StatefulWidget {
  final List<QuestionModel> level;
   Game({Key? key, required this.level,}) : super(key: key);

  @override
  State<Game> createState() => _GameState();

}

class _GameState extends State<Game> {


    GameViewModel gameViewModel = GameViewModel();
    late QuestionModel question ;

  @override
  void initState() {
    if(widget.level==hard){gameViewModel.seconds=10;}
    gameViewModel.levelQuestions = widget.level;
      question = gameViewModel.levelQuestions[gameViewModel.currentQuestionIndex];
   if(widget.level!=easy){gameViewModel.setTimer(context,widget.level);}
    super.initState();
  }


  @override
  void dispose() {
    if(widget.level!=easy){gameViewModel.periodicTimer?.cancel();}
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColor.transparent,
        foregroundColor: AppColor.transparent,
        systemOverlayStyle: AppSetting.defaultUIOverlay,
        elevation: 0.0,
        bottomOpacity: 0.0,
      ),
      body: ChangeNotifierProvider<GameViewModel>(
        create: (context)=>gameViewModel,
        child: Consumer<GameViewModel>(
          builder: (context,model,index) {
            return Container(
              width: AppSize.width(context),
              height: AppSize.height(context),
              decoration: const BoxDecoration (
                gradient: LinearGradient (
                  begin: Alignment(0, -1),
                  end: Alignment(0, 1),
                  colors: <Color>[Color(0xff9af2ff), Color(0xffa0c800), Color(0xff23d5ee)],
                  stops: <double>[0, 1, 1],
                ),
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  // level and timer
                  widget.level != easy?Positioned(
                    top: AppSize.height(context)*0.03,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                             Text(
                              'Level ${gameViewModel.levelQuestions[gameViewModel.currentQuestionIndex].level}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: AppSize.theme(context).headlineMedium!.fontSize,
                                fontWeight: FontWeight.w400,
                                color: AppColor.textPrimary,
                                fontFamily: AppString.fontRegular
                              ),
                            ),
                          AppSize.SpaceWidth(15),
                          SizedBox(
                              width: 37,
                              height: 37,
                              child:  Icon(Icons.alarm_rounded,
                                color: HexColor.fromHex("#E81C00").withOpacity(0.97),
                                size: AppSize.theme(context).headlineMedium!.fontSize,
                              )
                          ),
                          AppSize.SpaceWidth(5),
                          Text(
                            '${gameViewModel.seconds}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: AppSize.theme(context).headlineMedium!.fontSize,
                              fontWeight: FontWeight.w400,
                              color: AppColor.red,
                                fontFamily: AppString.fontRegular
                            ),
                          ),
                        ],
                      ),
                    ),
                  ):Positioned(
                      top: AppSize.height(context)*0.03,
                      child: Align(
                        alignment: Alignment.topCenter,
                       child: Text(
                          'Level ${gameViewModel.levelQuestions[gameViewModel.currentQuestionIndex].level}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppSize.theme(context).headlineMedium!.fontSize,
                              fontWeight: FontWeight.w400,
                              color: AppColor.textPrimary,
                              fontFamily: AppString.fontRegular
                          ),
                        ),
                      )),
                  // image
                  Positioned(
                    top: AppSize.height(context)*0.1,
                    child: Container(
                      width: AppSize.width(context),
                      height: AppSize.height(context)/2,
                      decoration: const BoxDecoration (
                        image: DecorationImage (
                          image: AssetImage (
                            'assets/images/logo3.png',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.only(left:AppSize.width(context)*0.2,top: AppSize.width(context)*0.2),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '${gameViewModel.levelQuestions[gameViewModel.currentQuestionIndex].questionText}= ?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: AppSize.theme(context).headlineMedium!.fontSize,
                              fontWeight: FontWeight.w400,
                              color: AppColor.primary,
                                fontFamily: AppString.fontRegular
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    //top: AppSize.height(context)/1.6,
                    bottom: AppSize.height(context) * 0.04,
                    child: SizedBox(
                      width: AppSize.width(context),
                      child: VariantsView(
                        question: gameViewModel.levelQuestions[gameViewModel.currentQuestionIndex],
                        onAnswerATap: () {
                          QuestionModel question =
                          gameViewModel.levelQuestions[gameViewModel.currentQuestionIndex];
                          gameViewModel.onVariantTap(context,question.answerA,widget.level);
                        },
                        onAnswerBTap: () {
                          QuestionModel question =
                          gameViewModel.levelQuestions[gameViewModel.currentQuestionIndex];

                          gameViewModel.onVariantTap(context,question.answerB,widget.level);
                        },
                        onAnswerCTap: () {
                          QuestionModel question =
                          gameViewModel.levelQuestions[gameViewModel.currentQuestionIndex];

                          gameViewModel.onVariantTap(context,question.answerC,widget.level);
                        },
                        onAnswerDTap: () {
                          QuestionModel question =
                          gameViewModel.levelQuestions[gameViewModel.currentQuestionIndex];

                          gameViewModel.onVariantTap(context,question.answerD,widget.level);
                        },
                      ),
                    ),
                  )

                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
