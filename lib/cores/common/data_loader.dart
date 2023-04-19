import 'package:flutter/material.dart';
import 'package:flame/widgets.dart';
import 'package:flutter_meedu_videoplayer/meedu_player.dart';
import 'package:hs_gacha/models/model.dart';
import 'package:hs_gacha/models/video_effect_show.dart';
import 'package:hs_gacha/models/video_effect_show_type.dart';

class DataLoader {
  static late Image imageMainBG;
  static late Image imageMainGachaBG;
  static late MeeduPlayerController videoMainBGController;

  static List<VideoEffect> listVideoEffect = [];

  static List<VideoEffectShow> listVideoEffectShow = [];

  static void load() async {
    imageMainBG = Image.asset('assets/images/background.png', fit: BoxFit.fill);

    imageMainGachaBG =
        Image.asset('assets/images/Wish_template.png', fit: BoxFit.fill);

    videoMainBGController =
        await loadVideo('assets/videos/Gi_Wishbg.mp4', isLoop: true);

    listVideoEffect.add(VideoEffect(
        type: VideoEffectType.fivestarmuti,
        videoController: await loadVideo('assets/videos/fivestarmulti.mp4')));
    listVideoEffect.add(VideoEffect(
        type: VideoEffectType.fivestar,
        videoController: await loadVideo('assets/videos/fivestar.mp4')));

    listVideoEffect.add(VideoEffect(
        type: VideoEffectType.fourstarmuti,
        videoController: await loadVideo('assets/videos/fourstarmulti.mp4')));
    listVideoEffect.add(VideoEffect(
        type: VideoEffectType.fourstar,
        videoController: await loadVideo('assets/videos/fourstar.mp4')));

    listVideoEffect.add(VideoEffect(
        type: VideoEffectType.threestar,
        videoController: await loadVideo('assets/videos/threestar.mp4')));

    listVideoEffectShow.add(VideoEffectShow(
        type: VideoEffectShowType.fivestar,
        videoController: await loadVideo('assets/videos/fivestareffect.m4v')));

    listVideoEffectShow.add(VideoEffectShow(
        type: VideoEffectShowType.fourstar,
        videoController: await loadVideo('assets/videos/fourstareffect.m4v')));

    listVideoEffectShow.add(VideoEffectShow(
        type: VideoEffectShowType.threestar,
        videoController: await loadVideo('assets/videos/threestarnew.m4v')));
  }

  static Future<MeeduPlayerController> loadVideo(String src,
      {bool isLoop = false}) async {
    MeeduPlayerController controller;
    controller = MeeduPlayerController(
      controlsStyle: ControlsStyle.primary,
      controlsEnabled: false,
      fits: [BoxFit.fitWidth],
    );

    await controller.setDataSource(
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
