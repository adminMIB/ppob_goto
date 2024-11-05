import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/controller/helpercontroller.dart';

class TransferbankController extends GetxController {
  var pref = GetStorage();
  final data = [].obs;
  final originalData = [].obs;
  final helperController = Get.put(HelperController());

  //detail goto
  detailgoto(BuildContext context) async {
    var access_token = pref.read('access_token');
    return helperController.post(
        path: 'http://123.176.120.84:3003/api/v1/goto/products-detail',
        headers: {
          'Authorization': 'Bearer $access_token',
        },
        onSuccess: (content) {
          print('hasil : $content');
          originalData.assignAll(content['response']['data']);
          data.assignAll(originalData);
          print('hasill ${content['response']['data']}');
        },
        onError: (onError) {
          print('error : $onError');
        },
        body: {
          'productCode': 'kredit-home-credit',
        });
  }

  //inquiry goto
  inquirygoto(BuildContext context) async {
    var access_token = pref.read('access_token');

    return helperController.post(
        path: 'http://123.176.120.84:3003/api/v1/goto/inquiry',
        headers: {
          'Authorization': 'Bearer $access_token',
        },
        onSuccess: (context) {
          print('hasil inquriry :  $context');
        },
        onError: (onError) {
          print('error: $onError');
        },
        body: {
          "productCode": "pdam-dki-aetra-new",
          "accountNumber": "61114111111111",
          "productName": "AETRA Jakarta PDAM - DKI Jakarta",
          "username": "arizd",
          "user_id": "2"
        });
  }

  //payment goto
  paymentgoto(BuildContext context) {
    var access_token = pref.read('access_token');
    return helperController.post(
        path: 'http://123.176.120.84:3003/api/v1/goto/payment',
        headers: {
          'Authorization': 'Bearer $access_token',
        },
        onSuccess: (context) {
          print('hasil payment : $context');
        },
        onError: (onError) {
          print(onError);
        },
        body: {
          {
            "amount": "40300",
            "productCode": "bpjs-ketenagakerjaan-iuran-1month",
            "productName":
                "BPJS Ketenagakerjaan BPJS Ketenagakerjaan - Iuran 1 bln",
            "accountNumber": "61114111111111",
            "retrievalReferenceNumber": "790034757430",
            "transactionDateTime": "1105140034",
            "username": "arizd",
            "user_id": "2"
          }
        });
  }
}
