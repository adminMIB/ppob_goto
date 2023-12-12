import 'package:get/get.dart';

import '../controllers/transferbank_controller.dart';

class TransferbankBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransferbankController>(
      () => TransferbankController(),
    );
  }
}
