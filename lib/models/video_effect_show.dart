import 'package:flutter_meedu_videoplayer/meedu_player.dart';

import 'package:hs_gacha/models/video_effect_show_type.dart';

class VideoEffectShow {
  VideoEffectShowType type;
  MeeduPlayerController videoController;
  VideoEffectShow({
    required this.type,
    required this.videoController,
  });

  VideoEffectShow copyWith({
    VideoEffectShowType? type,
    MeeduPlayerController? videoController,
  }) {
    return VideoEffectShow(
      type: type ?? this.type,
      videoController: videoController ?? this.videoController,
    );
  }

  @override
  String toString() => 'VideoEffectShow(videoController: $videoController)';

  @override
  bool operator ==(covariant VideoEffectShow other) {
    if (identical(this, other)) return true;

    return other.videoController == videoController;
  }

  @override
  int get hashCode => videoController.hashCode;
}
