import 'package:get/get.dart';
import 'package:hs_gacha/modules/home_page/bindings/home_binding.dart';
import 'package:hs_gacha/modules/video_effect/binding/video_effect_binding.dart';
import 'package:hs_gacha/modules/video_effect/page/video_effect_page.dart';
import 'package:hs_gacha/modules/video_effect_show/binding/video_effect_show_binding.dart';
import 'package:hs_gacha/modules/video_effect_show/page/video_effect_show_page.dart';

import '../modules/home_page/game_screens/game_main.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.gameMain;

  static final routes = [
    GetPage(
      name: Routes.gameMain,
      page: () => const GameMainScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.videoEffect,
      page: () => const VideoEffectPage(),
      binding: VideoEffectBinding(),
    ),
    GetPage(
      name: Routes.videoEffectShow,
      page: () => const VideoEffectShowPage(),
      binding: VideoEffectShowBinding(),
    ),
  ];
}
