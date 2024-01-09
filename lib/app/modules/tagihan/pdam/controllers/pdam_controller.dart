import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/data/controller/network_helper.dart';
import 'package:ppob_mpay1/app/data/popup/views/gagalpopup_view.dart';
import 'package:ppob_mpay1/app/data/urlServices.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pdam/views/bottmsheetpdam_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pdam/views/pdam_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pdam/views/pdamgagal_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pdam/views/pdamsukses_view.dart';

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

  //get pdam //

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

// inquiry //

  pdaminquiry(var idpel, var productCode, var product_name,
      BuildContext context) async {
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
          "product_name": product_name,
          "user_id": pref.read('user_id'),
        });
  }

  DateTime fromCustomTime(String time) {
    int year = int.parse(time.substring(0, 4));
    int month = int.parse(time.substring(4, 6));

    return DateTime(
      year,
      month,
    );
  }

//payment pdam //

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

          //periode//
          String apiperiodeString = content['response']['periode'];
          DateTime apiDatePeriode = fromCustomTime(apiperiodeString);
          List<String> periodeMonths =
              content['response']['periode'].split(",");
          List<String> formattedMonths = periodeMonths.map((month) {
            DateTime dateTime = fromCustomTime(month.trim());
            return DateFormat('MMMM yyyy').format(dateTime);
          }).toList();

          //date time//
          String apiTimeString = content['response']['date'];
          DateTime apiDateTime = fromCustomTime(apiTimeString);

          String TimeString = content['response']['date'];
          DateTime Tgl = CustomTime(apiTimeString);

          PersistentNavBarNavigator.pushNewScreen(context,
              screen: PdamsuksesView(
                noref: ref2,
                idpel: idpel,
                nama_pelanggan: content['response']['nama_pelanggan'],
                stan_awal: content['response']['stan_awal'],
                stan_akhir: content['response']['stan_akhir'],
                jumlah_bulan: content['response']['jml_bln'],
                periode: formattedMonths.join(', ' + " "),
                deskripsi: content['response']['description'],
                harga: amount,
                admin: admin,
                total_bayar: total_bayar,
                tglwaktu: DateFormat('yyyy-MM-dd HH:mm:ss')
                    .format(CustomTime(content['response']['date'])),
              ));
        }
      },
      onError: (onError) {
        print("hasil error: $onError");

        int responseStatus = onError['response']['status'];

        if (responseStatus == 1002) {
          print(onError['response']['error']);
          print(
              "Status 1002 terdeteksi! Tiket ID: ${onError['response']['tiket-id']}");
          Get.offAll(PdamgagalView());
          showDialog(
              context: context,
              builder: (BuildContext context) => gagalpopup(
                    error: onError['response']['error'],
                  ));
        }
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

  DateTime CustomTime(String time) {
    int year = int.parse(time.substring(0, 4));
    int month = int.parse(time.substring(4, 6));
    int day = int.parse(time.substring(6, 8));

    int hours = int.parse(time.substring(8, 10));
    int minutes = int.parse(time.substring(10, 12));
    int seconds = int.parse(time.substring(12, 14));

    return DateTime(
      year,
      month,
      day,
      hours,
      minutes,
      seconds,
    );
  }
}
