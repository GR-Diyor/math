import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:math/configs/AppString.dart';
import 'package:math/viewmodel/lose_viewmodel.dart';
import 'package:provider/provider.dart';
import 'dart:ui';
import '../configs/AppColor.dart';
import '../configs/AppSetting.dart';
import '../configs/AppSize.dart';


class Lose extends StatefulWidget {
  final int correctAnswersCount;
  const Lose({Key? key, required this.correctAnswersCount}) : super(key: key);

  @override
  State<Lose> createState() => _LoseState();
}

class _LoseState extends State<Lose> {
  LoseViewModel loseViewModel = LoseViewModel();
  @override
  void initState() {
    loseViewModel.setAudio();
    super.initState();
  }

  @override
  void dispose() {
   loseViewModel.audioPlayer.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
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
      body: ChangeNotifierProvider<LoseViewModel>(
        create: (context)=>loseViewModel,
        child: Consumer<LoseViewModel>(
          builder: (context,model,index) {
            return Container(
              width: AppSize.width(context),
              height: AppSize.height(context),
              decoration:  const BoxDecoration (
                gradient: RadialGradient (
                  center: Alignment(0, -0),
                  radius: 0.75,
                  colors: <Color>[
                    Color(0xff4b52ff),
                    Color(0xb51afbe0),
                  ],
                  stops: <double>[0.446, 1],
                ),
              ),
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur (
                    sigmaX: 10*fem,
                    sigmaY: 10*fem,
                  ),
                  child: SizedBox(
                    width: AppSize.width(context),
                    height: AppSize.height(context),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: AppSize.height(context)*0.2,
                          child: Lottie.asset(
                            'assets/lottie/sad.json',
                            height: AppSize.width(context)*0.5,
                            width: AppSize.width(context)*0.6,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Positioned(
                          bottom: AppSize.height(context)*0.3,
                          child: GestureDetector(
                            onTap: ()=>LoseViewModel.reStart(context),
                            child: Container(
                              width: AppSize.width(context)*0.85,
                              height: 100,
                              decoration: BoxDecoration (
                                color: const Color(0xffffffff),
                                borderRadius: BorderRadius.circular(20*fem),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x3f000000),
                                    offset: Offset(0*fem, 4*fem),
                                    blurRadius: 2*fem,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'you lose!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize:  AppSize.theme(context).headlineMedium!.fontSize,
                                      fontWeight: FontWeight.w400,
                                        color: AppColor.textSecondary,
                                        fontFamily: AppString.fontRegular
                                    ),
                                  ),
                                  Text(
                                    // tryagainxgV (1:68)
                                    'try again',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize:  AppSize.theme(context).headlineMedium!.fontSize,
                                      fontWeight: FontWeight.w400,
                                        color: AppColor.textSecondary,
                                        fontFamily: AppString.fontRegular
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: AppSize.height(context)*0.13,
                          child: Container(
                            width: AppSize.width(context)*0.85,
                            height: 80,
                            decoration: BoxDecoration (
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.circular(20*fem),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x3f000000),
                                  offset: Offset(0*fem, 4*fem),
                                  blurRadius: 2*fem,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                '${widget.correctAnswersCount}/12',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize:  AppSize.theme(context).headlineMedium!.fontSize,
                                  fontWeight: FontWeight.w400,
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
              ),
            );
          }
        ),
      ),
    );
  }
}
