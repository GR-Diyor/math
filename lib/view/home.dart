import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:math/configs/AppString.dart';
import 'package:math/utills/extensions.dart';
import 'package:math/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';
import '../configs/AppColor.dart';
import '../configs/AppSetting.dart';
import '../configs/AppSize.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      body: ChangeNotifierProvider<HomeViewmodel>(
        create: (context)=>HomeViewmodel(),
        child: Consumer<HomeViewmodel>(
          builder: (context,model,index) {
            return Container(
              width:  double.infinity,
              height:  AppSize.height(context),
              decoration:  const BoxDecoration (
                gradient:  LinearGradient (
                  begin:  Alignment(0, -1),
                  end:  Alignment(0, 1),
                  colors:  <Color>[Color(0xffe1d56b), Color(0xb51afbe0)],
                  stops:  <double>[0.446, 1],
                ),
              ),
              child:
              ClipRect(
                child:
                BackdropFilter(
                  filter:  ImageFilter.blur (
                    sigmaX:  10*AppSize.fem(context),
                    sigmaY:  10*AppSize.fem(context),
                  ),
                  child:
                  Stack(
                    alignment: Alignment.topCenter,
                    children:  [
                      //images
                      Positioned(
                        top: AppSize.height(context)*0.1,
                        child:
                        Column(
                          crossAxisAlignment:  CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Image.asset(
                                "assets/images/logo1.png",
                                height: AppSize.width(context)*0.5,
                                width: AppSize.width(context)*0.6,
                                fit:  BoxFit.cover,
                              ),
                            AppSize.SpaceHeight((AppSize.height(context)*0.05).round()),
                            Image.asset(
                              "assets/images/logo2.png",
                              fit:  BoxFit.cover,
                              height: AppSize.width(context)*0.9,
                              width: AppSize.width(context)*0.9,
                            ),
                          ],
                        ),
                      ),
                      //buttom
                      Positioned(
                        bottom: AppSize.height(context)*0.09,
                        child:
                        Align(
                          alignment: Alignment.bottomCenter,
                          child:
                          SizedBox(
                            width: AppSize.width(context)*0.6,
                            height: 60,
                            child:
                            GestureDetector(
                              onTap: ()=>HomeViewmodel.nextPage(context),
                              child: Container(
                                decoration:  BoxDecoration (
                                  borderRadius:  BorderRadius.circular(20*AppSize.fem(context)),
                                  color:  AppColor.primary,
                                  boxShadow:  [
                                    BoxShadow(
                                      color:  const Color(0x3f000000),
                                      offset:  Offset(0*AppSize.fem(context), 4*AppSize.fem(context)),
                                      blurRadius:  2*AppSize.fem(context),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child:    Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Spacer(flex: 4,),
                                      Icon(
                                        Icons.play_circle_outline,
                                        color: HexColor.fromHex("#BCD750"),
                                        size: AppSize.theme(context).headlineMedium!.fontSize,
                                      ),
                                      const Spacer(),
                                      Text(
                                        'Play',
                                        textAlign:  TextAlign.center,
                                        style:  TextStyle(
                                          fontSize:  AppSize.theme(context).headlineMedium!.fontSize,
                                          fontWeight:  FontWeight.w400,
                                            color: AppColor.textSecondary,
                                            fontFamily: AppString.fontRegular
                                        ),
                                      ),
                                      const Spacer(flex: 4,),
                                    ],
                                  ),
                                ),
                              ),
                            ),
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
