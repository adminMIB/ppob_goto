import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/data/controller/network_helper.dart';
import 'package:ppob_mpay1/app/data/urlServices.dart';
import 'package:ppob_mpay1/app/modules/saldo/views/inquirysaldo_view.dart';
import 'package:ppob_mpay1/app/modules/saldo/views/resisukses_view.dart';
import 'package:dio/dio.dart' as dio;

class SaldoController extends GetxController {
  var pref = GetStorage();
  final helperController = Get.put(HelperController());
  final network = Get.put(NetworkHelper());

  Topupsaldo(BuildContext context, var amount, var metode_pembayran) async {
    await helperController.loading(context);
    var access_token = pref.read('access_token');

    return network.post(
      path: UrlListService.topupsaldo,
      headers: {
        'Authorization': 'Bearer $access_token',
      },
      onSuccess: (content) {
        Get.back();
        if (content['status'] == true) {
          print('masuk $content');
          // Get.to(Inquirsyaldo(
          //   amount: content['response']['amount'].toString(),
          //   jenis_bank: content['response']['jenis_bank'],
          //   metode_pembayaran: content['response']['metode_pembayaran'],
          //   nomer_rekening: content['response']['nomer_rekening'].toString(),
          //   expired: content['response']['expired'],
          //   kode_unik: content['response']['kode_unik'].toString(),
          //   tanggal: content['response']['tanggal'],
          //   status: content['response']['status'],
          // ));
          Get.to(InquirysaldoView(
            amount: content['response']['amount'].toString(),
            jenis_bank: content['response']['jenis_bank'],
            metode_pembayaran: content['response']['metode_pembayaran'],
            nomer_rekening: content['response']['nomer_rekening'].toString(),
            expired: content['response']['expired'],
            kode_unik: content['response']['kode_unik'].toString(),
            tanggal: content['response']['tanggal'],
            status: content['response']['status'],
          ));
        }
      },
      onError: (onError) {
        print('error: $onError');
      },
      body: {
        "user_id": pref.read('user_id'),
        "amount": amount,
        "metode_pembayran": metode_pembayran,
      },
    );
  }

  Uploadbukti(
    var bukti_transaksi,
    var kode_unik,
    BuildContext context,
  ) async {
    await helperController.loading(context);
    var access_token = pref.read('access_token');
    return helperController.post(
      path: UrlListService.uploadbukti,
      headers: {
        'Authorization': 'Bearer $access_token',
      },
      containsFile: true,
      onSuccess: (content) {
        print('sukses $content');
        print(kode_unik);
        Get.back();
        // DateTime tanggal = DateTime.parse(content['response']['tanggal']);

        Get.to(ResisuksesView(
          kode_unik: kode_unik.toString(),
          status: content['response']['status'],
          message: content['response']['message'].toString(),
          kontak: content['response']['kontak'].toString(),
          // tanggal: DateFormat('yyyy-MM-dd HH:mm:ss').format(tanggal),
          tanggal: content['response']['tanggal'],

          // tanggal: formattedDate,
        ));
      },
      onError: (content) {
        Get.back();
        print('gagal : $content');
      },
      body: {
        "user_id": pref.read('user_id'),
        "bukti_transaksi": await dio.MultipartFile.fromFile(
          bukti_transaksi.path,
          filename: bukti_transaksi.name,
        ),
        "kode_unik": kode_unik,
      },
    );
  }
}
