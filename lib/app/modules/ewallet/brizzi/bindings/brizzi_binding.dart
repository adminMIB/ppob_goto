import 'package:get/get.dart';

import '../controllers/brizzi_controller.dart';

class BrizziBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BrizziController>(
      () => BrizziController(),
    );
  }
}
