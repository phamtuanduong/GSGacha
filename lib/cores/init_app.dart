import 'dart:developer' as dev;

import 'package:flame/flame.dart';
import 'package:flutter/services.dart';
import 'package:flutter_meedu_videoplayer/init_meedu_player.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:hs_gacha/cores/common/app_config.dart';
import 'package:hs_gacha/cores/common/data_loader.dart';

Future initApp() async {
  dev.log("initialize application", name: AppConfig.packageName);
  await initData();
  FlutterSmartDialog.init();
}

initData() async {
  dev.log('initialize Function and Data', name: AppConfig.packageName);
  initMeeduPlayer();
  Flame.device.fullScreen();
  Flame.device.setOrientation(DeviceOrientation.portraitUp);
  DataLoader.load();
}
