import 'package:get/get.dart';

import '../bindings/game_main_binding.dart';
import '../game_screens/game_main.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.gameMain;

  static final routes = [
    GetPage(
      name: Routes.gameMain,
      page: () => const GameMainScreen(),
      binding: GameMainBinding(),
    ),
  ];
}
