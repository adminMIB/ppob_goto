import 'package:get/get.dart';

import '../controllers/pln_controller.dart';

class PlnBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlnController>(
      () => PlnController(),
    );
  }
}
