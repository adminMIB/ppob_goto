import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pdam/views/bottomGoto.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pdam/views/popupGOTO.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pdam/views/transaksiGoto_sukses.dart';

import '../../../data/controller/helpercontroller.dart';

class TransferbankController extends GetxController {
  var pref = GetStorage();
  final data = [].obs;
  final originalData = [].obs;
  final helperController = Get.put(HelperController());

  //detail goto
  // detailgoto(BuildContext context) async {
  //   var access_token = pref.read('access_token');
  //   return helperController.post(
  //       path: 'http://192.168.50.128:3002/api/v1/goto/products-detail',
  //       headers: {
  //         'Authorization': 'Bearer $access_token',
  //       },
  //       onSuccess: (content) {
  //         print('hasil : $content');
  //         originalData.assignAll(content['response']['data']);
  //         data.assignAll(originalData);
  //         print('data : ${content['response']['data']}');
  //       },
  //       onError: (onError) {
  //         print('error : $onError');
  //       },
  //       body: {
  //         'productCode': 'kredit-home-credit',
  //       });
  // }

  // //inquiry goto
  // inquirygoto(
  //   BuildContext context,
  //   var idpel,
  //   var productcode,
  //   var productname,
  // ) async {
  //   var access_token = pref.read('access_token');
  //   var username = pref.read('username');
  //   var id = pref.read('id');
  //   await helperController.loading(context);
  //   return helperController.post(
  //       path: 'http://192.168.50.128:3002/api/v1/goto/inquiry',
  //       headers: {
  //         'Authorization': 'Bearer $access_token',
  //       },
  //       onSuccess: (content) {
  //         Get.back();
  //         print('hasil inquriry :  $content');
  //         print('screen : ${content['response']['data']['screen']}');
  //         // Get.to(BottomGotoView(
  //         //   screen: content['response']['data']['screen'],
  //         // ));
  //         showModalBottomSheet(
  //           context: context,
  //           isScrollControlled: true,
  //           backgroundColor: Colors.transparent,
  //           builder: (_) => BottomGotoView(
  //             screen: content['response']['data']['screen'],
  //             idpel: idpel,
  //             retrievalReferenceNumber: content['response']['data']
  //                 ['retrievalReferenceNumber'],
  //             transactionDateTime: content['response']['data']
  //                 ['transactionDateTime'],
  //             amount: content['response']['data']['amount'],
  //             productcode: content['response']['data']['productCode'],
  //             productname: content['response']['data']['productName'],
  //           ),
  //         );
  //       },
  //       onError: (onError) {
  //         print('error: $onError');
  //         if (onError['status'] == false) {
  //           var responseCode = onError['response']?['responseCode'];
  //           var responseMessage = onError['response']?['responseMessage'] ??
  //               "Tunggu beberapa saat lagi";

  //           // Tampilkan pesan jika responseCode adalah 400 dan pesan spesifik lainnya
  //           if (responseCode == 400 && responseMessage == "Invalid Number") {
  //             helperController.popUpMessage("Tagihan sudah dibayar", context);
  //           } else {
  //             helperController.popUpMessage(responseMessage, context);
  //           }
  //         } else {
  //           // Tampilkan pesan default jika status bukan `false` atau tidak ada detail lain
  //           helperController.popUpMessage("Tunggu beberapa saat lagi", context);
  //         }
  //       },
  //       body: {
  //         //pdam
  //         "productCode": productcode,
  //         "accountNumber": idpel,
  //         "productName": productcode,
  //         "username": username,
  //         "user_id": id

  //         //bpjs
  //         // "productCode": "bpjs-kesehatan-iuran-1month",
  //         // "accountNumber": idpel,
  //         // "productName": "BPJS Kesehatan BPJS Kesehatan - Iuran 1 bln",
  //         // "username": "arizd",
  //         // "user_id": "2"
  //         // "productCode": "bpjs-ketenagakerjaan-iuran-1month",
  //         // "accountNumber": idpel,
  //         // "productName":
  //         //     "BPJS Ketenagakerjaan BPJS Ketenagakerjaan - Iuran 1 bln",
  //         // "username": "arizd",
  //         // "user_id": "2"
  //       });
  // }

  // //payment goto
  // // payment goto
  // paymentgoto(
  //   BuildContext context,
  //   var idpel,
  //   var retrievalReferenceNumber,
  //   var transactionDateTime,
  //   var amount,
  //   var productcode,
  //   var productname,
  // ) {
  //   var access_token = pref.read('access_token');
  //   var username = pref.read('username');
  //   var id = pref.read('id');
  //   return helperController.post(
  //     path: 'http://192.168.50.128:3002/api/v1/goto/payment',
  //     headers: {
  //       'Authorization': 'Bearer $access_token',
  //     },
  //     onSuccess: (content) {
  //       print('tokern : $access_token');
  //       print('hasil payment : $content');
  //       print('screen payment : ${content['response']['data']['screen']}');

  //       Get.to(GotoSuksesView(
  //         paymentscreen: content['response']['data']['screen'],
  //         accountNumber: content['response']['data']['accountNumber'],
  //         productCode: content['response']['data']['productCode'],
  //         productName: content['response']['data']['productName'],
  //         retrievalReferenceNumber: content['response']['data']
  //             ['retrievalReferenceNumber'],
  //       ));
  //     },
  //     onError: (onError) {
  //       print('Error response: $onError');

  //       // Cek jika response memiliki status `false` dan `responseCode` 400
  //       if (onError['status'] == false) {
  //         var responseCode = onError['response']?['responseCode'];
  //         var responseMessage = onError['response']?['responseMessage'] ??
  //             "Tunggu beberapa saat lagi";

  //         // Tampilkan pesan jika responseCode adalah 400 dan pesan spesifik lainnya
  //         if (responseCode == 400 && responseMessage == "Bill Already Paid") {
  //           helperController.popUpMessage("Tagihan sudah dibayar", context);
  //         } else {
  //           helperController.popUpMessage(responseMessage, context);
  //         }
  //       } else {
  //         // Tampilkan pesan default jika status bukan `false` atau tidak ada detail lain
  //         helperController.popUpMessage("Tunggu beberapa saat lagi", context);
  //       }
  //     },
  //     body: {
  //       "amount": amount,
  //       "productCode": productcode,
  //       "productName": productname,
  //       "accountNumber": idpel,
  //       "retrievalReferenceNumber": retrievalReferenceNumber,
  //       "transactionDateTime": transactionDateTime,
  //       "username": username,
  //       "user_id": id,
  //     },
  //   );
  // }

  // // cek status transaksi
  // cekstatus(
  //   BuildContext context,
  //   var retrievalReferenceNumber,
  //   var productCode,
  //   var productName,
  //   var accountNumber,
  // ) async {
  //   var access_token = pref.read('access_token');
  //   return helperController.post(
  //       path: 'http://192.168.50.128:3002/v1/goto/check-status/order-detail',
  //       headers: {
  //         'Authorization': 'Bearer $access_token',
  //       },
  //       onSuccess: (content) {
  //         print('hasil cek status : $content');
  //         showDialog(
  //             context: context,
  //             builder: (BuildContext context) => PopupGOTO(
  //                   paymentscreen: content['response']['data']['screen'],
  //                 ));
  //       },
  //       onError: (onError) {
  //         // print('error : $onError');
  //         // if (onError['status'] == false) {
  //         //   var responseCode = onError['response']?['responseCode'];
  //         //   var responseMessage = onError['response']?['responseMessage'] ??
  //         //       "Tunggu beberapa saat lagi";

  //         //   // Tampilkan pesan jika responseCode adalah 400 dan pesan spesifik lainnya
  //         //   if (responseCode == 400 &&
  //         //       responseMessage == "Bill Already Paidr") {
  //         //     helperController.popUpMessage("Tagihan sudah dibayar", context);
  //         //   } else {
  //         //     helperController.popUpMessage(responseMessage, context);
  //         //   }
  //         // } else {
  //         //   // Tampilkan pesan default jika status bukan `false` atau tidak ada detail lain
  //         //   helperController.popUpMessage("Tunggu beberapa saat lagi", context);
  //         // }

  //         print('Error: $onError');
  //         if (onError['status'] == false) {
  //           var responseCode = onError['response']?['responseCode'];
  //           var responseMessage = onError['response']?['responseMessage'];
  //           var defaultMessage = "Tunggu beberapa saat lagi"; // Pesan default

  //           // Periksa apakah responseCode dan responseMessage kosong
  //           if (responseCode == null || responseCode.isEmpty) {
  //             responseCode = "Unknown"; // Menangani jika responseCode kosong
  //           }
  //           if (responseMessage == null || responseMessage.isEmpty) {
  //             responseMessage =
  //                 defaultMessage; // Gunakan defaultMessage jika responseMessage kosong
  //           }

  //           // Tampilkan pesan jika responseCode adalah 400 dan pesan spesifik lainnya
  //           if (responseCode == '400' &&
  //               responseMessage == "Bill Already Paid") {
  //             helperController.popUpMessage("Tagihan sudah dibayar", context);
  //           } else {
  //             helperController.popUpMessage(responseMessage, context);
  //           }
  //         } else {
  //           // Tampilkan pesan default jika status bukan `false` atau tidak ada detail lain
  //           helperController.popUpMessage("Tunggu beberapa saat lagi", context);
  //         }
  //       },
  //       body: {
  //         "retrievalReferenceNumber": retrievalReferenceNumber,
  //         "productCode": productCode,
  //         "productName": productCode,
  //         "accountNumber": accountNumber,
  //         "username": "arizd",
  //         "user_id": "1"
  //       });
  // }
}
