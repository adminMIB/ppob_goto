import 'package:get/get.dart';

import '../controllers/telco_controller.dart';

class TelcoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TelcoController>(
      () => TelcoController(),
    );
  }
}
