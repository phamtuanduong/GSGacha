import 'package:flutter/material.dart';
import 'package:flame/widgets.dart';
import 'package:flutter_meedu_videoplayer/meedu_player.dart';
import 'package:hs_gacha/models/model.dart';

class DataLoader {
  static late Image imageMainBG;
  static late Image imageMainGachaBG;
  static late MeeduPlayerController videoMainBGController;

  static List<VideoEffect> listVideoEffect = [];

  static void load() async {
    imageMainBG = Image.asset('assets/images/background.png', fit: BoxFit.fill);

    imageMainGachaBG =
        Image.asset('assets/images/Wish_template.png', fit: BoxFit.fill);

    videoMainBGController =
        loadVideo('assets/videos/Gi_Wishbg.mp4', isLoop: true);

    listVideoEffect.add(VideoEffect(
        type: VideoEffectType.fivestarmuti,
        videoController: loadVideo('assets/videos/fivestarmulti.mp4')));
    listVideoEffect.add(VideoEffect(
        type: VideoEffectType.fivestar,
        videoController: loadVideo('assets/videos/fivestar.mp4')));

    listVideoEffect.add(VideoEffect(
        type: VideoEffectType.fourstarmuti,
        videoController: loadVideo('assets/videos/fourstarmulti.mp4')));
    listVideoEffect.add(VideoEffect(
        type: VideoEffectType.fourstar,
        videoController: loadVideo('assets/videos/fourstar.mp4')));

    listVideoEffect.add(VideoEffect(
        type: VideoEffectType.threestar,
        videoController: loadVideo('assets/videos/threestar.mp4')));
  }

  static MeeduPlayerController loadVideo(String src, {bool isLoop = false}) {
    MeeduPlayerController controller;
    controller = MeeduPlayerController(
      controlsStyle: ControlsStyle.primary,
      controlsEnabled: false,
      fits: [BoxFit.fitWidth],
    );

    controller.setDataSource(
      DataSource(
        type: DataSourceType.asset,
        source: src,
      ),
      autoplay: false,
    );

    return controller;
  }

  static SpriteButton loadButton(String src, String srcPressed, double width,
      double height, Function() onPressed, Widget child) {
    return SpriteButton.asset(
      path: src,
      pressedPath: srcPressed,
      width: width,
      height: height,
      label: child,
      onPressed: onPressed(),
    );
  }
}
