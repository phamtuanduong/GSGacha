import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_meedu_videoplayer/meedu_player.dart';
import 'package:get/get.dart';
import 'package:hs_gacha/cores/common/data_loader.dart';
import 'package:hs_gacha/modules/home_page/game_screens/game_show_card_ani.dart';
import 'package:hs_gacha/models/video_effect_type.dart';

class VideoEffectController extends GetxController {
  Rx<VideoEffectType> videoType = VideoEffectType.fivestarmuti.obs;
  Rx<MeeduPlayerController> meeduPlayerController = MeeduPlayerController().obs;

  @override
  void onInit() async {
    dev.log('init VideoEffectController', name: 'Video  Effect');
    videoType.value = Get.arguments[0]['videoType'] as VideoEffectType;
    await initVideo();
    super.onInit();
  }

  initVideo() async {
    for (var element in DataLoader.listVideoEffect) {
      if (element.type == videoType.value) {
        meeduPlayerController.value = element.videoController;
        meeduPlayerController.value.play();
        meeduPlayerController.value.fits = [BoxFit.fitWidth];
      }
    }
  }

  Future<void> checkEndVideo(MeeduPlayerController controller) async {
    int tick = 0;
    while (tick < 6) {
      await Future.delayed(const Duration(seconds: 1));
      tick++;
    }
    await Future.delayed(const Duration(milliseconds: 500));
    controller.pause();
    controller.seekTo(const Duration());

    Get.to(const GameShowCardAnimation(),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 0));
  }
}
