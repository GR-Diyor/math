import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:math/configs/AppSize.dart';
import 'package:math/configs/AppString.dart';
import 'package:math/models/database.dart';
import 'package:math/viewmodel/game_viewmodel.dart';
import 'package:math/viewmodel/level_viewmodel.dart';
import 'package:provider/provider.dart';
import 'dart:ui';
import '../configs/AppColor.dart';
import '../configs/AppSetting.dart';

class Level extends StatefulWidget {
  const Level({Key? key}) : super(key: key);

  @override
  State<Level> createState() => _LevelState();
}



class _LevelState extends State<Level> {

  LevelViewModel levelViewModel =LevelViewModel();
  GameViewModel gameViewModel = GameViewModel();

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
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create:  (context)=>gameViewModel,),
          ChangeNotifierProvider(create: (context)=>levelViewModel),
        ],
        child: Consumer<LevelViewModel>(
          builder: (context,model,index) {
            return Container(
              width: AppSize.width(context),
              height: AppSize.height(context),
              decoration: const BoxDecoration (
                gradient: LinearGradient (
                  begin: Alignment(0, -1),
                  end: Alignment(0, 1),
                  colors: <Color>[Color(0xffe1d56b), Color(0xb51afbe0)],
                  stops: <double>[0.446, 1],
                ),
              ),
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur (
                    sigmaX: 10*AppSize.fem(context),
                    sigmaY: 10*AppSize.fem(context),
                  ),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        top: AppSize.height(context)*0.1,
                        child: Image.asset(
                          "assets/images/logo1.png",
                          height: AppSize.width(context)*0.5,
                          width: AppSize.width(context)*0.6,
                          fit:  BoxFit.cover,
                        ),
                      ),
                      //buttons
                      Positioned(
                        bottom: AppSize.height(context)*0.1,
                        child: SizedBox(
                          child: Column(
                            children: [
                              //button: easy
                              GestureDetector(
                                onTap: (){
                                  gameViewModel.nextPage(context,easy);
                                },
                                child: Container(
                                  width: AppSize.width(context)*0.6,
                                  height: 60,
                                  decoration: BoxDecoration (
                                    color: const Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(20*AppSize.fem(context)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0x3f000000),
                                        offset: Offset(0*AppSize.fem(context), 4*AppSize.fem(context)),
                                        blurRadius: 2*AppSize.fem(context),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      'easy',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize:  AppSize.theme(context).headlineMedium!.fontSize,
                                        fontWeight: FontWeight.w400,
                                        height: 1.25*AppSize.ffem(context)/AppSize.fem(context),
                                        color: AppColor.textSecondary,
                                        fontFamily: AppString.fontRegular
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              AppSize.SpaceHeight((AppSize.height(context)*0.01+10).toInt()),

                              //button: medium
                              GestureDetector(
                                onTap: (){
                                  gameViewModel.nextPage(context,medium);
                                },
                                child: Container(
                                  width: AppSize.width(context)*0.6,
                                  height: 60,
                                  decoration: BoxDecoration (
                                    color: Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(20*AppSize.fem(context)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x3f000000),
                                        offset: Offset(0*AppSize.fem(context), 4*AppSize.fem(context)),
                                        blurRadius: 2*AppSize.fem(context),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      'medium',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize:  AppSize.theme(context).headlineMedium!.fontSize,
                                        fontWeight: FontWeight.w400,
                                        height: 1.25*AppSize.ffem(context)/AppSize.fem(context),
                                          color: AppColor.textSecondary,
                                          fontFamily: AppString.fontRegular
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              AppSize.SpaceHeight((AppSize.height(context)*0.01+10).toInt()),

                              // button : hard
                              GestureDetector(
                                onTap: (){
                                  gameViewModel.nextPage(context,hard);
                                },
                                child: Container(
                                  width: AppSize.width(context)*0.6,
                                  height: 60,
                                  decoration: BoxDecoration (
                                    color: Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(20*AppSize.fem(context)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x3f000000),
                                        offset: Offset(0*AppSize.fem(context), 4*AppSize.fem(context)),
                                        blurRadius: 2*AppSize.fem(context),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      'hard',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize:  AppSize.theme(context).headlineMedium!.fontSize,
                                        fontWeight: FontWeight.w400,
                                        height: 1.25*AppSize.ffem(context)/AppSize.fem(context),
                                          color: AppColor.textSecondary,
                                          fontFamily: AppString.fontRegular
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}