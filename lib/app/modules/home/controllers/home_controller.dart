import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/data/urlServices.dart';

//   }
class HomeController extends GetxController {
  final helperController = Get.put(HelperController());

  var isLoadBalance = false.obs;
  var balance = '0'.obs;
  var pref = GetStorage();
  var access_token;

  CheckBalance(BuildContext context) async {
    isLoadBalance(true);
    var access_token = pref.read('access_token');
    return helperController.post(
      path: UrlListService.checkbalance,
      headers: {
        'Authorization': 'Bearer $access_token',
      },
      onSuccess: (content) async {
        print('hasil: $content');

        var saldo = content['saldo'];

        balance.value = saldo;
        isLoadBalance(false);
        Get.back();
      },
      onError: (error) {
        isLoadBalance(false);
        Get.back();
        print('Kesalahan API: $error');
      },
      body: {
        "user_id": pref.read('user_id'),
      },
    );
  }
}
