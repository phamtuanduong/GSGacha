import 'package:get/get.dart';
import 'package:hs_gacha/modules/home_page/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
