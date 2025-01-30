import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ppob_mpay1/app/data/urlservices2.dart';

import '../../../data/controller/helpercontroller.dart';
import '../../tagihan/pdam/views/bottomGoto.dart';
import '../../tagihan/pdam/views/cobawell.dart';
import '../../tagihan/pdam/views/popupGOTO.dart';
import '../../tagihan/pdam/views/transaksiGoto_sukses.dart';

class GotoController extends GetxController {
  var pref = GetStorage();
  final data = [].obs;
  final originalData = [].obs;
  final helperController = Get.put(HelperController());

  //detail goto
  detailgoto(BuildContext context) async {
    var access_token = pref.read('access_token');
    return helperController.post(
        path: 'http://192.168.50.128:3002/api/v1/goto/products-detail',
        headers: {
          'Authorization': 'Bearer $access_token',
        },
        onSuccess: (content) {
          print('hasil : $content');
          originalData.assignAll(content['response']['data']);
          data.assignAll(originalData);
          print('data : ${content['response']['data']}');
        },
        onError: (onError) {
          print('error : $onError');
        },
        body: {
          'productCode': 'kredit-home-credit',
        });
  }

  //inquiry goto
  inquirygoto(
    BuildContext context,
    var idpel,
    var productcode,
    var productname,
  ) async {
    var access_token = pref.read('access_token');
    var username = pref.read('username');
    var id = pref.read('id');
    await helperController.loading(context);
    return helperController.post(
        // path: 'http://192.168.50.128:3002/api/v1/goto/inquiry',
        path: UrlListService2.inquiryGoto,
        headers: {
          'Authorization': 'Bearer $access_token',
        },
        onSuccess: (content) async {
          await helperController.loading(context);

          Get.back();
          print('hasil inquriry :  $content');
          print('screen : ${content['response']['data']['screen']}');
          // Get.to(BottomGotoView(
          //   screen: content['response']['data']['screen'],
          // ));
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (_) => BottomGotoView(
              screen: content['response']['data']['screen'],
              idpel: idpel,
              retrievalReferenceNumber: content['response']['data']
                  ['retrievalReferenceNumber'],
              transactionDateTime: content['response']['data']
                  ['transactionDateTime'],
              amount: content['response']['data']['amount'],
              productcode: content['response']['data']['productCode'],
              productname: content['response']['data']['productName'],
              id: id.toString(),
              username: username,
              accountnumber: content['response']['data']['accountNumber'],
            ),
          );
        },
        onError: (onError) {
          print('error: $onError');
          if (onError['status'] == false) {
            var responseCode = onError['response']?['responseCode'];
            var responseMessage = onError['response']?['responseMessage'] ??
                "Tunggu beberapa saat lagi";

            if (responseCode == 400 && responseMessage == "Invalid Number") {
              helperController.popUpMessage("Tagihan sudah dibayar", context);
            } else {
              helperController.popUpMessage(responseMessage, context);
            }
          } else {
            helperController.popUpMessage("Tunggu beberapa saat lagi", context);
          }
        },
        body: {
          //pdam
          "productCode": productcode,
          "accountNumber": idpel,
          "productName": productcode,
          "username": username,
          "user_id": id

          //bpjs
          // "productCode": "bpjs-kesehatan-iuran-1month",
          // "accountNumber": idpel,
          // "productName": "BPJS Kesehatan BPJS Kesehatan - Iuran 1 bln",
          // "username": "arizd",
          // "user_id": "2"
          // "productCode": "bpjs-ketenagakerjaan-iuran-1month",
          // "accountNumber": idpel,
          // "productName":
          //     "BPJS Ketenagakerjaan BPJS Ketenagakerjaan - Iuran 1 bln",
          // "username": "arizd",
          // "user_id": "2"
        });
  }

  // payment goto
  paymentgoto(
    BuildContext context,
    var idpel,
    var retrievalReferenceNumber,
    var transactionDateTime,
    var amount,
    var productcode,
    var productname,
    var accountnumber,
    var id,
    var username,
  ) {
    var access_token = pref.read('access_token');
    var username = pref.read('username');
    var id = pref.read('id');
    return helperController.post(
      // path: 'http://192.168.50.128:3002/api/v1/goto/payment',
      path: UrlListService2.paymentGoto,
      headers: {
        'Authorization': 'Bearer $access_token',
      },
      onSuccess: (content) async {
        await helperController.loading(context);
        Get.back();
        print('idpel2 $idpel');
        print("productcode2 $productcode");
        print("productname $productname");
        print('tokern : $access_token');
        print('hasil payment : $content');
        print('screen payment : ${content['response']['data']['screen']}');
        var status = content['response']['data']['status'];
        await Future.delayed(Duration(seconds: 5));

        if (status.trim().toLowerCase() == 'pending') {
          // Hit API cek status
          cekstatus(
            context,
            retrievalReferenceNumber,
            productcode,
            productname,
            accountnumber,
            username,
            id,
          );
        } else {
          Get.to(GotoSuksesView(
            paymentscreen: content['response']['data']['screen'],
            accountNumber: idpel,
            productCode: productcode,
            productName: productname,
            retrievalReferenceNumber: content['response']['data']
                ['retrievalReferenceNumber'],
          ));
        }
      },
      onError: (onError) {
        print('Error response: $onError');

        if (onError['status'] == false) {
          var responseCode = onError['response']?['responseCode'];
          var responseMessage = onError['response']?['responseMessage'] ??
              "Tunggu beberapa saat lagi";

          if (responseCode == 400 && responseMessage == "Bill Already Paid") {
            helperController.popUpMessage("Tagihan sudah dibayar", context);
          } else {
            helperController.popUpMessage(responseMessage, context);
          }
        } else {
          helperController.popUpMessage("Tunggu beberapa saat lagi", context);
        }
        print(onError);
      },
      body: {
        "amount": amount,
        "productCode": productcode,
        "productName": productname,
        "accountNumber": idpel,
        "retrievalReferenceNumber": retrievalReferenceNumber,
        "transactionDateTime": transactionDateTime,
        "username": username,
        "user_id": id,
      },
    );
  }

  // cek status transaksi
  cekstatus(
    BuildContext context,
    var retrievalReferenceNumber,
    var productcode,
    var productname,
    var idpel,
    var username,
    var id,
  ) async {
    var access_token = pref.read('access_token');
    return helperController.post(

        // path: 'http://192.168.50.128:3002/v1/goto/check-status/order-detail',
        path: UrlListService2.cekStatus,
        headers: {
          'Authorization': 'Bearer $access_token',
        },
        onSuccess: (content) async {
          await helperController.loading(context);

          await Future.delayed(Duration(seconds: 5));
          print("idpel3 $idpel");
          print('hasil cek status : $content');
          // showDialog(
          //     context: context,
          //     builder: (BuildContext context) => PopupGOTO(
          //           paymentscreen: content['response']['data']['screen'],
          //         ));
          Get.to(Cobawel(
            paymentscreen: content['response']['data']['screen'],
          ));
        },
        onError: (onError) {
          print('Error: $onError');
          if (onError['status'] == false) {
            var responseCode = onError['response']?['responseCode'];
            var responseMessage = onError['response']?['responseMessage'];
            var defaultMessage = "Tunggu beberapa saat lagi"; // Pesan default

            // Periksa apakah responseCode dan responseMessage kosong
            if (responseCode == null || responseCode.isEmpty) {
              responseCode = "Unknown";
            }
            if (responseMessage == null || responseMessage.isEmpty) {
              responseMessage =
                  defaultMessage; // Gunakan defaultMessage jika responseMessage kosong
            }

            // Tampilkan pesan jika responseCode adalah 400 dan pesan spesifik lainnya
            if (responseCode == '400' &&
                responseMessage == "Bill Already Paid") {
              helperController.popUpMessage("Tagihan sudah dibayar", context);
            } else {
              helperController.popUpMessage(responseMessage, context);
            }
          } else {
            // Tampilkan pesan default jika status bukan `false` atau tidak ada detail lain
            helperController.popUpMessage("Tunggu beberapa saat lagi", context);
          }
        },
        body: {
          "retrievalReferenceNumber": retrievalReferenceNumber,
          "productCode": productcode,
          "productName": productname,
          "accountNumber": idpel,
          "username": username,
          "user_id": id,
        });
  }
}
