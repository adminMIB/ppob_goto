import 'package:get/get.dart';

import '../controllers/paketdata_controller.dart';

class PaketdataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaketdataController>(
      () => PaketdataController(),
    );
  }
}
