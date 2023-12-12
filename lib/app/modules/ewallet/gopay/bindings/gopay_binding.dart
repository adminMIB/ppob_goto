import 'package:get/get.dart';

import '../controllers/gopay_controller.dart';

class GopayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GopayController>(
      () => GopayController(),
    );
  }
}
