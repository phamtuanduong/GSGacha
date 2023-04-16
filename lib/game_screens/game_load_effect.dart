import 'package:flutter/material.dart';
import 'package:flutter_meedu_videoplayer/meedu_player.dart';
import 'package:get/get.dart';
import 'package:hs_gacha/data_loader.dart';
import 'package:hs_gacha/game_screens/game_show_card_ani.dart';
import 'package:hs_gacha/models/model.dart';

class GameLoadEffect extends StatelessWidget {
  const GameLoadEffect({super.key, required this.videoType});
  final VideoEffectType videoType;

  @override
  Widget build(BuildContext context) {
    MeeduPlayerController? controller;

    for (var element in DataLoader.listVideoEffect) {
      if (element.type == videoType) {
        controller = element.videoController;
        controller.play();
        controller.fits = [BoxFit.fitWidth];
      }
    }

    if (controller == null) {
      controller = DataLoader.loadVideo('assets/videos/fivestarmulti.mp4');
      DataLoader.listVideoEffect.add(VideoEffect(
          type: VideoEffectType.fivestarmuti, videoController: controller));
    }

    checkEndVideo(controller, context);

    return SizedBox(
        width: Get.size.width,
        height: Get.size.height,
        child: MeeduVideoPlayer(
          controller: controller,
        ));
  }

  Future<void> checkEndVideo(
      MeeduPlayerController controller, BuildContext context) async {
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
