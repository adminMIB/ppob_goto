import 'package:get/get.dart';

import '../controllers/goto_controller.dart';

class GotoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GotoController>(
      () => GotoController(),
    );
  }
}
