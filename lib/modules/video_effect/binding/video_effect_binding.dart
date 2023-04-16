import 'package:get/get.dart';
import 'package:hs_gacha/modules/video_effect/controller/video_effect_controller.dart';

class VideoEffectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoEffectController>(() => VideoEffectController());
  }
}
