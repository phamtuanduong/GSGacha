import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_meedu_videoplayer/meedu_player.dart';
import 'package:get/get.dart';
import 'package:hs_gacha/cores/common/data_loader.dart';
import 'package:hs_gacha/cores/common/utils.dart';
import 'package:hs_gacha/models/video_effect_show_type.dart';
import 'package:hs_gacha/modules/home_page/game_screens/game_show_card_ani.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart' as trans;

class VideoEffectShowController extends GetxController {
  Rx<bool> isEndVideo = false.obs;
  Rx<VideoEffectShowType> videoType = VideoEffectShowType.fivestar.obs;
  Rx<MeeduPlayerController> meeduPlayerController = MeeduPlayerController().obs;

  @override
  void onInit() async {
    dev.log('init VideoEffectController', name: 'Video  Effect');
    videoType.value = Get.arguments[0]['videoType'] as VideoEffectShowType;
    await initVideo();
    super.onInit();
  }

  initVideo() async {
    for (var element in DataLoader.listVideoEffectShow) {
      if (element.type == videoType.value) {
        meeduPlayerController.value = element.videoController;
        meeduPlayerController.value.play();
        meeduPlayerController.value.fits = [BoxFit.fitWidth];
      }
    }
    meeduPlayerController.value.position.stream.listen(null);
    meeduPlayerController.value.position.stream.listen((event) async {
      if (meeduPlayerController.value.position.value ==
          meeduPlayerController.value.duration.value) {
        await endVideo();
      }
    });
  }

  Future<void> endVideo() async {
    isEndVideo.value = true;
  }
}
