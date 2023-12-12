import 'package:get/get.dart';

import '../controllers/ovo_controller.dart';

class OvoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OvoController>(
      () => OvoController(),
    );
  }
}
