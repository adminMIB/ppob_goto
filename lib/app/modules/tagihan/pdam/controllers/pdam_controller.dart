import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/data/controller/network_helper.dart';
import 'package:ppob_mpay1/app/data/popup/views/gagalpopup_view.dart';
import 'package:ppob_mpay1/app/data/popup/views/saldotidakcukup_view.dart';
import 'package:ppob_mpay1/app/data/urlServices.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pdam/views/bottmsheetpdam_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pdam/views/pdam_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pdam/views/pdamgagal_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pdam/views/pdamsukses_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pdam/views/transaksigagal_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pdam/views/transaksisukses_view.dart';

class PdamController extends GetxController {
  final dataPdam = [].obs;
  final originalData = [].obs;
  final sortedData = [].obs;
  final helperController = Get.put(HelperController());
  final network = Get.put(NetworkHelper());
  var pref = GetStorage();
  bool shouldCallPdamApi = true;

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

// inquiry PDAM//

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
                productName: product_name,
                idpel: idpel,
                nama_pelanggan: content['response']['nama_pelanggan'],
                kodeproduk: productCode,
                admin: content['response']['admin'],
                harga: content['response']['nominal'],
                // periode: content['response']['periode'],

                periode: formattedMonths.join(', ' + " "),
                jumlahbulan: content['response']['jml_bln'],
                stan_awal: content['response']['stan_awal'],
                stan_akhir: content['response']['stan_akhir'],
                total_payment: content['response']['total_bayar'],
                ref1: content['response']['ref1'],
                ref2: content['response']['ref2'],
              ),
            );
          } else {
            helperController.popUpMessage(
                'Mohon maaf sistem sedang maintenance, Coba beberapa saat lagi.',
                context);
          }
        },
        onError: (onError) {
          print('error : $onError');
          Get.back();
          helperController.popUpMessage(
              'Mohon maaf sistem sedang maintenance, Coba beberapa saat lagi.',
              context);
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
    var productname,
    var productCode,
    var idpel,
    var ref1,
    var ref2,
    var total_payment,
    var harga,
    var admin,
    var periode,
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
          String apiTimeString = content['response']['periode'];
          DateTime apiDateTime = fromCustomTime(apiTimeString);

          List<String> periodeMonths =
              content['response']['periode'].split(",");
          List<String> formattedMonths = periodeMonths.map((month) {
            DateTime dateTime = fromCustomTime(month.trim());
            return DateFormat('MMMM yyyy').format(dateTime);
          }).toList();

          PersistentNavBarNavigator.pushNewScreen(context,
              screen: transaksisuksesView(
                noref: ref2,
                idpel: idpel,
                nama_pelanggan: content['response']['nama_pelanggan'],
                stan_awal: content['response']['stan_awal'],
                stan_akhir: content['response']['stan_akhir'],
                jumlah_bulan: content['response']['jml_bln'],
                // periode: content['response']['periode'],
                productName: productname,
                periode: formattedMonths.join(', ' + " "),
                deskripsi: content['response']['description'],
                harga: harga,
                admin: admin,
                total_bayar: total_payment,
                tglwaktu: DateFormat('yyyy-MM-dd HH:mm:ss')
                    .format(CustomTime(content['response']['date'])),
              ));
        } else
          print('error $content');
        Get.back();
        showDialog(
            context: context,
            builder: (BuildContext context) => Saldotidakcukup(
                  pesan: content['message'],
                ));
      },
      onError: (onError) {
        print("hasil error: $onError");
        // print(onError['response']['error']);

        Get.offAll(transaksigagalView(
          // tglwaktu: DateFormat('yyyy-MM-dd HH:mm:ss')
          //     .format(CustomTime(onError['response']['date'])),
          tglwaktu: onError['response']['date'],
          idpel: idpel,
          harga: onError['response']['amount'],
          admin: onError['response']['admin'],
          total_payment: onError['response']['total'].toString(),
          // deskripsi: onError['reponse']['description'],
          // jumlah_bulan: onError['response']['jml_bln'],
          // stan_awal: onError['response']['stan_awal'],
          // stan_akhir: onError['response']['stan_akhir'],
          // nama_pelanggan: onError['reponse']['nama_pelanggan'],
          periode: onError['response']['periode'],
        ));
        // if (onError['status'] == false) {
        //   if (onError['response'] == '1002') {
        //     // print('error pdm: $onError');
        //     Get.back();
        //     helperController.popUpMessage(
        //         'Mohon maaf sistem sedang maintenance, Coba beberapa saat lagi.',
        //         context);
        //   } else {
        //     Get.offAll(transaksigagalView(
        //       tglwaktu: onError['response']['date'],
        //       idpel: idpel,
        //       harga: onError['response']['amount'],
        //       admin: onError['response']['admin'],
        //       total_payment: onError['response']['total'].toString(),
        //       // deskripsi: onError['response']['description'],
        //       // jumlah_bulan: onError['response']['jml_bln'],
        //       // stan_awal: onError['response']['stan_awal'],
        //       // stan_akhir: onError['response']['stan_akhir'],
        //       // nama_pelanggan: onError['response']['nama_pelanggan'],
        //       periode: onError['response']['periode'],
        //     ));
        //   }
        // }
      },
      body: {
        "productCode": productCode,
        "idpel": idpel,
        "ref1": ref1,
        "ref2": ref2,
        "total_payment": total_payment,
        // "total_payment": amount,
        "admin": admin,
        "priode": periode,
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
