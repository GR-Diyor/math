import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'CustomPainting.dart';

class AppSetting{
  static Future<void>init()async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

  }
  static Future<void>fullScreen()async{
    SystemChrome.setSystemUIOverlayStyle(CustomPainting.systemUiOverlayStyle);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);
  }
  static Future<void>manualScreen()async{
    SystemChrome.setSystemUIOverlayStyle(CustomPainting.systemUiOverlayStyle);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);
  }

  //AppBar

  static SystemUiOverlayStyle defaultUIOverlay = SystemUiOverlayStyle.light;
}