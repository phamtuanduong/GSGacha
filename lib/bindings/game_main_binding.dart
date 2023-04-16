import 'package:get/get.dart';

import '../controllers/game_main_controller.dart';

class GameMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameMainController>(() => GameMainController());
  }
}
