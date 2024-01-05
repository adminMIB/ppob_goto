import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/data/controller/network_helper.dart';
import 'package:ppob_mpay1/app/data/urlServices.dart';
import 'package:ppob_mpay1/app/modules/register/views/dialogberes_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pdam/views/bottmsheetpdam_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pdam/views/pdam_view.dart';

class PdamController extends GetxController {
  final dataPdam = [].obs;
  final originalData = [].obs;
  final sortedData = [].obs;
  final helperController = Get.put(HelperController());
  final network = Get.put(NetworkHelper());
  var pref = GetStorage();

  // pdam(BuildContext context) async {
  //   // await helperController.loading(context);
  //   var access_token = pref.read('access_token');
  //   print('token : $access_token');
  //   return helperController.post(
  //     path: UrlListService.pdam,
  //     headers: {
  //       'Authorization': 'Bearer $access_token',
  //     },
  //     onSuccess: (content) {
  //       if (content['status'] == true) {
  //         print('hasil');
  //         print(content['response']['content']);
  //         dataPdam.assignAll(content['response']['content']);
  //         Get.to(PdamView());
  //       }
  //     },
  //     onError: (onError) {
  //       print('error : $onError');
  //     },
  //     body: {},
  //   );
  // }
  pdam(BuildContext context) async {
    // await helperController.loading(context);
    var access_token = pref.read('access_token');
    print('token : $access_token');
    return helperController.post(
      path: UrlListService.pdam,
      headers: {
        'Authorization': 'Bearer $access_token',
      },
      onSuccess: (content) {
        if (content['status'] == true) {
          print('hasil');
          print(content['response']['content']);
          originalData.assignAll(content['response']['content']);
          dataPdam.assignAll(originalData);
          Get.to(PdamView());
        }
      },
      onError: (onError) {
        print('error : $onError');
      },
      body: {},
    );
  }

  void filterData(String query) {
    if (query.isEmpty) {
      dataPdam.assignAll(originalData);
    } else {
      dataPdam.assignAll(originalData.where((element) =>
          element['product_name'].toLowerCase().contains(query.toLowerCase())));
    }
  }

  pdaminquiry(var idpel, var productCode, BuildContext context) async {
    await helperController.loading(context);
    var access_token = pref.read('access_token');
    return network.post(
        path: UrlListService.pdaminqury,
        headers: {
          'Authorization': 'Bearer $access_token',
        },
        onSuccess: (content) async {
          if (content['status'] == true) {
            print(content);
            print('masuk : $content');
            String apiTimeString = content['response']['periode'];
            DateTime apiDateTime = fromCustomTime(apiTimeString);

            List<String> periodeMonths =
                content['response']['periode'].split(",");
            List<String> formattedMonths = periodeMonths.map((month) {
              DateTime dateTime = fromCustomTime(month.trim());
              return DateFormat('MMMM yyyy').format(dateTime);
            }).toList();

            Get.back();
            Get.bottomSheet(
              BottmsheetpdamView(
                idpel: idpel,
                nama_pelanggan: content['response']['nama_pelanggan'],
                kodeproduk: productCode,
                admin: content['response']['admin'],
                harga: content['response']['nominal'],
                // periode: DateFormat('MMMM, yyyy')
                //     .format(fromCustomTime(content['response']['periode'])),
                periode: formattedMonths.join(', ' + " "),
                jumlahbulan: content['response']['jml_bln'],
                stan_awal: content['response']['stan_awal'],
                stan_akhir: content['response']['stan_akhir'],
                total_bayar: content['response']['total_bayar'],
                ref1: content['response']['ref1'],
                ref2: content['response']['ref2'],
              ),
            );
          }
        },
        onError: (onError) {
          print('error : $onError');
        },
        body: {
          "idpel": idpel,
          "productCode": productCode,
          // "pin": pin,
          "user_id": pref.read('user_id'),
        });
  }

  DateTime fromCustomTime(String time) {
    int year = int.parse(time.substring(0, 4));
    int month = int.parse(time.substring(4, 6));
    // int day = int.parse(time.substring(6, 8));

    // int hours = int.parse(time.substring(8, 10));
    // int minutes = int.parse(time.substring(10, 12));
    // int seconds = int.parse(time.substring(12, 14));

    return DateTime(
      year,
      month,
      // day,
      // hours,
      // minutes,
      // seconds,
    );
  }

  pdampayment(
    var productCode,
    var idpel,
    var ref1,
    var ref2,
    var amount,
    var admin,
    var total_bayar,
    var pin,
    BuildContext context,
  ) async {
    await helperController.loading(context);
    var access_token = pref.read('access_token');
    return network.post(
      path: UrlListService.pdampayment,
      headers: {
        'Authorization': 'Bearer $access_token',
      },
      onSuccess: (content) {
        if (content['status'] == true) {
          print('hasil : $content');
        }
      },
      onError: (onError) {
        print(onError);
      },
      body: {
        "productCode": productCode,
        "idpel": idpel,
        "ref1": ref1,
        "ref2": ref2,
        "amount": amount,
        "admin": admin,
        "total_bayar": total_bayar,
        "user_id": pref.read('user_id'),
        "pin": pin,
      },
    );
  }
}
