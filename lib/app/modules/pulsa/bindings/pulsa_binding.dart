import 'package:get/get.dart';
import 'package:ppob_mpay1/app/modules/pulsa/controllers/pulsatransaksi_controller.dart';

import '../controllers/pulsa_controller.dart';

class PulsaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PulsatransaksiController>(
      () => PulsatransaksiController(),
    );
    Get.lazyPut<PulsaController>(
      () => PulsaController(),
    );
  }
}
