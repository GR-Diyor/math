import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:lottie/lottie.dart';
import 'package:math/configs/AppSize.dart';
import 'package:math/viewmodel/win_viewmodel.dart';
import 'package:provider/provider.dart';
import '../configs/AppColor.dart';
import '../configs/AppSetting.dart';
import '../configs/AppString.dart';

class Win extends StatefulWidget {
  const Win({Key? key,required this.correctAnswersCount}) : super(key: key);
  final int correctAnswersCount;
  @override
  State<Win> createState() => _WinState();
}

class _WinState extends State<Win> {

  WinViewModel winViewModel = WinViewModel();


  @override
  void initState() {
    winViewModel.setAudio();
    super.initState();
  }

  @override
  void dispose() {
    winViewModel.audioPlayer.dispose();
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
      body: ChangeNotifierProvider<WinViewModel>(
        create: (context)=>winViewModel,
        child: Consumer<WinViewModel>(
          builder: (context,model,index) {
            return Container(
              width: AppSize.width(context),
              height: AppSize.height(context),
              decoration: const BoxDecoration (
                gradient: LinearGradient (
                  begin: Alignment(0, -1),
                  end: Alignment(0, 1),
                  colors: <Color>[Color(0xfff9c1a9), Color(0xb57babf2)],
                  stops: <double>[0.446, 0.804],
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
                            'assets/lottie/successfully.json',
                            height: AppSize.width(context)*0.5,
                            width: AppSize.width(context)*0.6,
                            fit: BoxFit.cover,
                              alignment: Alignment.center
                          ),
                        ),
                        Positioned(
                          bottom: AppSize.height(context)*0.3,
                          child: GestureDetector(
                            onTap: ()=>WinViewModel.reStart(context),
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
                                  FittedBox(
                                    child: Text(
                                      'you win!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize:  AppSize.theme(context).headlineMedium!.fontSize,
                                        fontWeight: FontWeight.w400,
                                          color: AppColor.textSecondary,
                                          fontFamily: AppString.fontRegular
                                      ),
                                    ),
                                  ),
                                  FittedBox(
                                    child: Text(
                                      'congratulation',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize:  AppSize.theme(context).headlineMedium!.fontSize,
                                        fontWeight: FontWeight.w400,
                                          color: AppColor.textSecondary,
                                          fontFamily: AppString.fontRegular
                                      ),
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
                              color: AppColor.primary,
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
