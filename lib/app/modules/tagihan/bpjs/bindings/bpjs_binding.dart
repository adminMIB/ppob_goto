import 'package:get/get.dart';

import '../controllers/bpjs_controller.dart';

class BpjsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BpjsController>(
      () => BpjsController(),
    );
  }
}
