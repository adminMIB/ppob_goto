import 'package:get/get.dart';

import '../controllers/pulsa_controller.dart';

class PulsaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PulsaController>(
      () => PulsaController(),
    );
  }
}
