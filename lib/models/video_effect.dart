import 'package:flutter_meedu_videoplayer/meedu_player.dart';

import 'video_effect_type.dart';

class VideoEffect {
  VideoEffectType type;
  MeeduPlayerController videoController;
  VideoEffect({
    required this.type,
    required this.videoController,
  });

  VideoEffect copyWith({
    VideoEffectType? type,
    MeeduPlayerController? videoController,
  }) {
    return VideoEffect(
      type: type ?? this.type,
      videoController: videoController ?? this.videoController,
    );
  }

  @override
  String toString() => 'VideoEffect(videoController: $videoController)';

  @override
  bool operator ==(covariant VideoEffect other) {
    if (identical(this, other)) return true;

    return other.videoController == videoController;
  }

  @override
  int get hashCode => videoController.hashCode;
}
