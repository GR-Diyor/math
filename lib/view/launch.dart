import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math/viewmodel/launch_viewmodel.dart';
import 'package:provider/provider.dart';
import '../configs/AppColor.dart';
import '../configs/AppSetting.dart';
import '../configs/AppSize.dart';
import '../configs/CustomWidget.dart';

class Launch extends StatefulWidget {
  const Launch({Key? key}) : super(key: key);

  @override
  State<Launch> createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  @override
  void initState() {
  AppSetting.fullScreen();
  LaunchViewModel.nextPage(context);
    super.initState();
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
      body:ChangeNotifierProvider<LaunchViewModel>(
            create: (context)=>LaunchViewModel(),
            child: Consumer<LaunchViewModel>(
              builder: (context,model,index) {
                return  CustomWidget.FullScreen(context,
                  child: Container(
                    decoration: const BoxDecoration (
                      gradient: LinearGradient (
                        begin: Alignment(0, -1),
                        end: Alignment(0, 1),
                        colors: <Color>[Color(0xff72ff99), Color(0xf2a5a136)],
                        stops: <double>[0, 1],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/logo1.png",height:AppSize.width(context)*0.5,fit: BoxFit.cover,),
                        AppSize.SpaceHeight((AppSize.height(context)*0.1).round()),
                        Image.asset("assets/images/splashLogo.png",height:AppSize.width(context)*0.8,fit: BoxFit.cover,),
                      ],
                    ),
                  ),
                );
              }
            ),
          ),
    );
  }
}
