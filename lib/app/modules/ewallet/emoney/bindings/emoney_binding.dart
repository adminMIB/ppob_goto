import 'package:get/get.dart';

import '../controllers/emoney_controller.dart';

class EmoneyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmoneyController>(
      () => EmoneyController(),
    );
  }
}
