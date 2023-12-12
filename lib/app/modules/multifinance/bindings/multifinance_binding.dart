import 'package:get/get.dart';

import '../controllers/multifinance_controller.dart';

class MultifinanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MultifinanceController>(
      () => MultifinanceController(),
    );
  }
}
