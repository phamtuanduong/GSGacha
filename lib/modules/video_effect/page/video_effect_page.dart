import 'package:flutter/material.dart';
import 'package:flutter_meedu_videoplayer/meedu_player.dart';
import 'package:get/get.dart';
import 'package:hs_gacha/modules/video_effect/controller/video_effect_controller.dart';

class VideoEffectPage extends GetView<VideoEffectController> {
  const VideoEffectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.size.width,
      height: Get.size.height,
      child:
          MeeduVideoPlayer(controller: controller.meeduPlayerController.value),
    );
  }
}
