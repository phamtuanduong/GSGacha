import 'package:flutter/material.dart';
import 'package:flutter_meedu_videoplayer/meedu_player.dart';
import 'package:get/get.dart';
import 'package:hs_gacha/cores/common/data_loader.dart';
import 'package:hs_gacha/modules/games/player_game_animation.dart';
import 'package:hs_gacha/modules/video_effect_show/controller/video_effect_show_controller.dart';
import 'package:hs_gacha/routes/app_pages.dart';

class VideoEffectShowPage extends GetView<VideoEffectShowController> {
  const VideoEffectShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Obx(() => SizedBox(
            width: Get.size.width,
            height: Get.size.height,
            child: !controller.isEndVideo.value
                ? MeeduVideoPlayer(
                    controller: controller.meeduPlayerController.value)
                : DataLoader.imageMainGachaBG,
          )),
      Positioned(
          top: 10,
          child: SizedBox(
              width: Get.size.width - 10,
              height: Get.size.height - 10,
              child: PlayerGameAnimation())),
      Positioned(
          child: TextButton(
        child: const Text("back"),
        onPressed: () {
          Get.offAllNamed(
            Routes.gameMain,
          );
          // Get.back(closeOverlays: true);
        },
      )),
    ]);
  }
}
