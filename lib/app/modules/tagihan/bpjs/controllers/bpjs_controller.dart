import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/data/controller/network_helper.dart';
import 'package:ppob_mpay1/app/data/popup/views/saldotidakcukup_view.dart';
import 'package:ppob_mpay1/app/data/urlServices.dart';
import 'package:ppob_mpay1/app/modules/saldo/views/resisukses_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/bpjs/views/bottomsheetbpjskes_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/bpjs/views/input_tlp_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/bpjs/views/resibpjskes_gagal_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/bpjs/views/resibpjskes_sukses_view.dart';

class BpjsController extends GetxController {
  final network = Get.put(NetworkHelper());
  final helperController = Get.put(HelperController());

  var pref = GetStorage();

  int currentMonth = DateTime.now().month;
  List months = [].obs;
  var monthInt;
  //  List<String> years = [].obs;
  @override
  void onInit() {
    getMonthsInYear(12);

    super.onInit();
  }

  List getMonthsInYear(int length) {
    DateFormat dateFormat = DateFormat("MMM yyyy");

    var createdDate = DateTime.now();

    int currentYear = createdDate.year;
    int currentMonth = createdDate.month;
    for (int i = 0; i < length; i++) {
      createdDate = DateTime(currentYear, currentMonth + i);
      months.add({'name': dateFormat.format(createdDate), 'value': i + 1});

      if (currentMonth + i == 1) {
        currentYear += 1;
      }
    }
    return months;
  }

//BPJS Kesehatan Inquiry
  bpjskesehatan(
    var idpel,
    var periode,
    BuildContext context,
  ) async {
    await helperController.loading(context);
    var access_token = pref.read('access_token');
    return network.post(
      path: UrlListService.bpjskesehataninquiry,
      headers: {
        'Authorization': 'Bearer $access_token',
      },
      onSuccess: (content) {
        Get.back();

        if (content['status'] == true) {
          print('sukses Inquiry: $content');

          Get.bottomSheet(BottomsheetbpjsView(
            idpel: idpel,
            nama_pelanggan: content['response']['nama_pelanggan'],
            // periode: content['response']['periode'],
            periode: periode.toString(),
            jml_keluarga: content['response']['jml_keluarga'],
            harga: content['response']['nominal'].toString(),
            admin: content['response']['admin'].toString(),
            total_payment: content['response']['total_bayar'].toString(),
            ref1: content['response']['ref1'],
            ref2: content['response']['ref2'],
            no_hp: content['response']['no_hp'].toString(),
          ));
        } else {
          print('else: $content');
          helperController.popUpMessage(content['message'], context);
        }
      },
      onError: (onError) {
        print('error: $onError');
        Get.back();
        helperController.popUpMessage(onError['message'], context);
      },
      body: {
        'idpel': idpel,
        'productCode': 'ASRBPJSKSH',
        'periode': periode,
        'user_id': pref.read('user_id'),
      },
    );
  }

  //BPJS Kesehatan Payment
  bpjskespayment(
    var idpel,
    var no_hp,
    var periode,
    var ref1,
    var ref2,
    var total_payment,
    var admin,
    var pin,
    BuildContext context,
  ) async {
    await helperController.loading(context);
    var access_token = pref.read('access_token');
    await network.post(
        path: UrlListService.bpjskesehatanpayment,
        headers: {
          'Authorization': 'Bearer $access_token',
        },
        onSuccess: (content) {
          if (content['status'] == true) {
            print('Hasil BPJS : $content');
            Get.to(ResibpjskesSuksesView(
              idpel: idpel,
              tglwaktu: DateFormat('yyyy-MM-dd HH:mm:ss')
                  .format(CustomTime(content['response']['tanggal'])),
              noref: content['response']['ref2'],
              nama_pelanggan: content['response']['nama_pelanggan'],
              jml_keluarga: content['response']['jml_keluarga'].toString(),
              periode: periode.toString(),
              no_hp: no_hp,
              harga: content['response']['nominal'].toString(),
              total_bayar: total_payment.toString(),
              admin: admin.toString(),
              deskripsi: content['response']['keterangan'],
            ));
          } else {
            print('saldo : $content');
            Get.back();
            showDialog(
                context: context,
                builder: (BuildContext context) => Saldotidakcukup(
                      pesan: content['message'],
                    ));
          }
        },
        onError: (onError) {
          if (onError['status'] == false) {
            print('Error BPJS : $onError');
            Get.to(ResibpjskesGagalView(
              noref: onError['response']['ref1'],
              idpel: idpel,
              tglwaktu: DateFormat('yyyy-MM-dd HH:mm:ss')
                  .format(CustomTime(onError['response']['tanggal'])),
              nama_pelanggan: onError['response']['nama_pelanggan'],
              harga: onError['response']['nominal'].toString(),
              admin: admin.toString(),
              total_bayar: total_payment.toString(),
              deskripsi: onError['response']['keterangan'],
              no_va_keluarga: onError['response']['no_va_keluarga'].toString(),
              jml_keluarga: onError['response']['jml_keluarga'].toString(),
              periode: periode.toString(),
            ));
            // Get.to(InputTlpView());
          } else {
            print('error pln: $onError');
            Get.back();
            helperController.popUpMessage(
                'Mohon maaf sistem sedang maintenance, Coba beberapa saat lagi.',
                context);
          }
        },
        body: {
          'productCode': 'ASRBPJSKSH',
          'idpel': idpel,
          "no_hp": no_hp,
          "periode": periode,
          "ref1": ref1,
          "ref2": ref2,
          "total_payment": total_payment,
          "admin": admin,
          "user_id": pref.read('user_id'),
          "pin": pin,
        });
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
