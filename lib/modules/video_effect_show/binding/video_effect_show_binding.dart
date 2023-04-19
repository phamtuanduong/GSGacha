import 'package:get/get.dart';
import 'package:hs_gacha/modules/video_effect_show/controller/video_effect_show_controller.dart';

class VideoEffectShowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoEffectShowController>(() => VideoEffectShowController());
  }
}
