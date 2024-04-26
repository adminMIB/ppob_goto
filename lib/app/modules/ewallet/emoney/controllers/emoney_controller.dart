import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/data/controller/network_helper.dart';
import 'package:ppob_mpay1/app/data/popup/views/saldotidakcukup_view.dart';
import 'package:ppob_mpay1/app/data/urlServices.dart';
import 'package:ppob_mpay1/app/modules/ewallet/emoney/views/bottmsheet_emoney_view.dart';
import 'package:ppob_mpay1/app/modules/ewallet/emoney/views/emoney_transaksi_gagal_view.dart';

class EmoneyController extends GetxController {
  final helperController = Get.put(HelperController());
  final network = Get.put(NetworkHelper());
  var pref = GetStorage();

  //E-money Inquiry
  emoneyInquiry(var idPel, var nominal, BuildContext context) async {
    await helperController.loading(context);
    var access_token = pref.read('access_token');
    return network.post(
      headers: {
        'Authorization': 'Bearer $access_token',
      },
      path: UrlListService.emoneyInquiry,
      onSuccess: (onSuccess) {
        if (onSuccess['status'] == true) {
          print('masuk : $onSuccess');
          Get.back();
          Get.bottomSheet(BottmsheetEmoneyView(
            idpel: idPel,
            namaPelanggan: onSuccess['response']['nama_pelanggan'],
            tanggal: DateFormat('yyyy-MM-dd HH:mm:ss').format(CustomTime(onSuccess['response']['tanggal'])),
            ref1: onSuccess['response']['ref1'],
            ref2: onSuccess['response']['ref2'],
            nominal: onSuccess['response']['nominal'],
            admin: onSuccess['response']['admin'],
            total_bayar: onSuccess['response']['total_bayar'],
          ));
        }
      },
      onError: (onError) {
        print('data error : $onError');
      },
      body: {
        "productCode": 'EMSCIN',
        "idpel": idPel,
        "nominal": nominal,
        "user_id": pref.read('user_id'),
      },
    );
  }

  //E-Money Payment
  emoneyPayment(
    var idPel,
    var noref1,
    var noref2,
    var amount,
    var admin,
    var total_payment,
    var pin,
    BuildContext context,
  ) async {
    await helperController.loading(context);
    var access_token = pref.read('access_token');
    return network.post(
      headers: {
        'Authorization': 'Bearer $access_token',
      },
      path: UrlListService.emoneyPayment,
      onSuccess: (onSuccess) {
        // print('Transaksi Berhasil : $onSuccess');
        if (onSuccess['status'] == true) {
          print('Transaksi Berhasil : $onSuccess');

          // PersistentNavBarNavigator.pushNewScreen(
          //   context,
          //   screen: PrabayarTransaksiBerhasilView(
          //     idpel: idPel,
          //     waktu: DateFormat('yyyy-MM-dd HH:mm:ss').format(CustomTime(onSuccess['response']['date'])),
          //     noMeter: idPel,
          //     noRef: onSuccess['response']['ref'],
          //     namaPelanggan: onSuccess['response']['nama_pelanggan'],
          //     nominal: amount,
          //     tarif: onSuccess['response']['tarif'],
          //     daya: onSuccess['response']['daya'].toString(),
          //     kwh: onSuccess['response']['kwh'].toString(),
          //     token: onSuccess['response']['token'.toString()],
          //     admin: admin,
          //     total: onSuccess['response']['saldo_terpotong'].toString(),
          //     info: onSuccess['response']['info_text'],
          //     description: onSuccess['response']['description'],
          //   ),
          // );
        } else {
          print('error $onSuccess');
          Get.back();
          showDialog(
            context: context,
            builder: (BuildContext context) => Saldotidakcukup(
              pesan: onSuccess['info_text'],
            ),
          );
        }
      },
      onError: (onError) {
        print('Transaksi Gagal : $onError');
        Get.offAll(
          EmoneyTransaksiGagalView(
            idpel: idPel,
            waktu: DateFormat('yyyy-MM-dd HH:mm:ss').format(CustomTime(onError['response']['tanggal'])),
            nominal: onError['response']['nominal'].toString(),
            admin: admin,
            ref1: onError['response']['ref1'],
            ref2: onError['response']['ref2'],
            total: onError['response']['total_bayar'].toString(),
            ket: onError['response']['keterangan'],
            namaPelanggan: onError['response']['nama_pelanggan'],
          ),
        );
      },
      body: {
        "productCode": "EMSCIN",
        "idpel": idPel,
        "ref1": noref1,
        "ref2": noref2,
        "amount": amount,
        "admin": admin,
        "total_payment": total_payment,
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
