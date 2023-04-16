import 'package:flutter/material.dart';
import 'package:flutter_meedu_videoplayer/meedu_player.dart';

class VideoPlayerComponent extends StatelessWidget {
  const VideoPlayerComponent({super.key, required this.controller});
  final MeeduPlayerController controller;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 16,
      child: MeeduVideoPlayer(
        controller: controller,
      ),
    );
  }
}
