import 'package:get/get.dart';

import '../controllers/pdam_controller.dart';

class PdamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PdamController>(
      () => PdamController(),
    );
  }
}
