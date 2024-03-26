import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/data/controller/network_helper.dart';
import 'package:ppob_mpay1/app/data/popup/views/saldotidakcukup_view.dart';
import 'package:ppob_mpay1/app/data/urlServices.dart';
import 'package:ppob_mpay1/app/modules/pulsa/pulsa_model.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pln/views/bottmsheet_prabayar_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pln/views/listrikmodel.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pln/views/pascabayar/bottomsheetpln_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pln/views/pascabayar/transaksigagalpln_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pln/views/pascabayar/transaksisuksespln_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pln/views/prabayar_transaksi_berhasil_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pln/views/prabayar_transaksi_gagal_view.dart';

class PlnController extends GetxController {
  final helperController = Get.put(HelperController());
  var listDenomPrabayarListrik = <TokenListrikModel>[].obs; // Ubah ke RxList
  var pref = GetStorage();
  var selectedNominal = ''.obs;

  final network = Get.put(NetworkHelper());

  @override
  void onInit() {
    super.onInit();
    denomPrabayarListrik();
  }

  // void denomPrabayarListrik() {
  //   listDenomPrabayarListrik.clear();
  //   listDenomPrabayarListrik.addAll([
  //     TokenListrikModel('20000'),
  //     TokenListrikModel('50000'),
  //     TokenListrikModel('100000'),
  //     TokenListrikModel('200000'),
  //     TokenListrikModel('500000'),
  //     TokenListrikModel('1000000'),
  //   ]);
  // }

  void denomPrabayarListrik() {
    listDenomPrabayarListrik.clear();
    listDenomPrabayarListrik.addAll([
      TokenListrikModel('20000', false),
      TokenListrikModel('50000', false),
      TokenListrikModel('100000', false),
      TokenListrikModel('200000', false),
      TokenListrikModel('500000', false),
      TokenListrikModel('1000000', false),
    ]);
  }

  //pln pasca inquiry
  plnpascainquiry(var idpel, BuildContext context) async {
    await helperController.loading(context);
    var access_token = pref.read('access_token');
    return network.post(
      headers: {
        'Authorization': 'Bearer $access_token',
      },
      path: UrlListService.plnpascainquiry,
      onSuccess: (content) {
        if (content['status'] == true) {
          print('hasil pln: $content');
          Get.back();
          // List<String> periodeMonths =
          //     content['response']['periode'].split(",");
          // List<String> formattedMonths = periodeMonths.map((month) {
          //   DateTime dateTime = fromCustomTime(month.trim());
          //   return DateFormat('MMMM yyyy').format(dateTime);
          // }).toList();
          List<String> periodeMonths =
              content['response']['periode'].split(",");
          List<String> formattedMonths = [];
          formattedMonths = periodeMonths
              .map((month) => fromCustomTime(month.trim()))
              .where((dateTime) => dateTime != null)
              .map((dateTime) => DateFormat('MMMM yyyy').format(dateTime))
              .toList();

          Get.bottomSheet(
            BottomsheetplnView(
              idpel: idpel,
              nama_pelanggan: content['response']['nama_pelanggan'],
              admin: content['response']['admin'],
              harga: content['response']['nominal'],
              periode: formattedMonths.join(', ' + " "),
              total_payment: content['response']['total_bayar'],
              tarif: content['response']['tarif'],
              daya: content['response']['daya'],
              ref1: content['response']['ref1'],
              ref2: content['response']['ref2'],
            ),
          );
        }
      },
      onError: (onError) {
        print('error pln: $onError');
        Get.back();
        helperController.popUpMessage(
            'Mohon maaf sistem sedang maintenance, Coba beberapa saat lagi.',
            context);
      },
      body: {
        "productCode": 'PLNPASCH',
        "idpel": idpel,
        "user_id": pref.read('user_id'),
      },
    );
  }

  DateTime fromCustomTime(String time) {
    int year = int.parse(time.substring(0, 4));
    // int month = int.parse(time.substring(4, 6));
    int month = int.parse(time.substring(4, 6));

    return DateTime(
      year,
      month,
    );
  }

  //pln pasca payment
  plnpascapayment(
    var idpel,
    var ref1,
    var ref2,
    var harga,
    var total_payment,
    var admin,
    var pin,
    BuildContext context,
  ) async {
    await helperController.loading(context);
    var access_token = pref.read('access_token');
    network.post(
      path: UrlListService.plnpascapayment,
      headers: {
        'Authorization': 'Bearer $access_token',
      },
      onSuccess: (content) {
        List<String> periodeMonths = content['response']['periode'].split(",");
        List<String> formattedMonths = [];
        formattedMonths = periodeMonths
            .map((month) => fromCustomTime(month.trim()))
            .where((dateTime) => dateTime != null)
            .map((dateTime) => DateFormat('MMMM yyyy').format(dateTime))
            .toList();

        if (content['status'] == true) {
          print('hasil pasca: ${content['response']}');
          Get.to(transaksisuksesplnView(
            idpel: idpel,
            tglwaktu: DateFormat('yyyy-MM-dd HH:mm:ss')
                .format(CustomTime(content['response']['date'])),
            nama_pelanggan: content['response']['nama_pelanggan'],
            tarif: content['response']['tarif'],
            daya: content['response']['daya'],
            harga: harga,
            admin: admin,
            // periode: content['response']['periode'],
            periode: formattedMonths.join(', ' + " "),
            total_bayar: total_payment,
            deskripsi: content['response']['description'],
            info: content['response']['info_text'],
          ));
        } else {
          print('error : $content');
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
          print('error pasca: $onError');
          // Get.back();
          // List<String> periodeMonths =
          //     onError['response']['periode'].split(",");
          // List<String> formattedMonths = periodeMonths.map((month) {
          //   DateTime dateTime = CustomTime(month.trim());
          //   return DateFormat('MMMM yyyy').format(dateTime);
          // }).toList();
          Get.to(transaksigagalplnView(
            idpel: idpel,
            tglwaktu: DateFormat('yyyy-MM-dd HH:mm:ss')
                .format(CustomTime(onError['response']['tanggal'])),
            noref: onError['response']['ref2'],
            nama_pelanggan: onError['response']['nama_pelanggan'],
            id_outlet: onError['response']['id_outlet'],
            tarif: onError['response']['tarif'],
            daya: onError['response']['daya'],
            // periode: formattedMonths.join(', ' + " "),
            periode: onError['response']['periode'],
            harga: harga,
            admin: admin,
            total_bayar: total_payment,
            deskripsi: onError['response']['keterangan'],
            info: onError['response']['infoteks'],
            jml_bulan: onError['response']['jml_bulan'],
            stanawal: onError['response']['stanawal'],
            stanakhir: onError['response']['stanakhir'],
          ));
        }
      },
      body: {
        "productCode": 'PLNPASCH',
        "idpel": idpel,
        "ref1": ref1,
        "ref2": ref2,
        "amount": harga,
        "total_payment": total_payment,
        "admin": admin,
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

  // PLN Prabayar Inquiry
  plnprabayarInquiry(var idPel, BuildContext context) async {
    await helperController.loading(context);
    var access_token = pref.read('access_token');
    return network.post(
      headers: {
        'Authorization': 'Bearer $access_token',
      },
      path: UrlListService.plnprbayarinquiry,
      onSuccess: (onSuccess) {
        if (onSuccess['status'] == true) {
          print('masuk : $onSuccess');

          Get.back();
          Get.bottomSheet(
            BottmsheetPrabayarView(
              idpel: idPel,
              idpel2: onSuccess['response']['idpel2'],
              namaPelanggan: onSuccess['response']['nama_pelanggan'],
              kodeproduk: onSuccess['response']['kodeproduk'],
              tarif: onSuccess['response']['tarif'],
              daya: onSuccess['response']['daya'],
              admin: onSuccess['response']['admin'],
              tanggal: DateFormat('yyyy-MM-dd HH:mm:ss')
                  .format(CustomTime(onSuccess['response']['tanggal'])),
              nominal: selectedNominal.value,
              // nominal: onSuccess['response']['nominal'],
              ref1: onSuccess['response']['ref1'],
              ref2: onSuccess['response']['ref2'],
            ),
          );
        }
      },
      onError: (onError) {
        print('data error : $onError');
      },
      body: {
        "productCode": 'PLNPRAH',
        "idpel": idPel,
        "user_id": pref.read('user_id'),
      },
    );
  }

  // DateTime fromCustomTime(String time) {
  //   int year = int.parse(time.substring(0, 4));
  //   int month = int.parse(time.substring(4, 6));

  //   return DateTime(
  //     year,
  //     month,
  //   );
  // }

  // DateTime CustomTime(String time) {
  //   int year = int.parse(time.substring(0, 4));
  //   int month = int.parse(time.substring(4, 6));
  //   int day = int.parse(time.substring(6, 8));

  //   int hours = int.parse(time.substring(8, 10));
  //   int minutes = int.parse(time.substring(10, 12));
  //   int seconds = int.parse(time.substring(12, 14));

  //   return DateTime(
  //     year,
  //     month,
  //     day,
  //     hours,
  //     minutes,
  //     seconds,
  //   );
  // }

  // PLN Prabayar Payment
  plnprabayarPayment(
    var idPel,
    var idPel2,
    var noref1,
    var noref2,
    var amount,
    var admin,
    var pin,
    BuildContext context,
  ) async {
    await helperController.loading(context);
    var access_token = pref.read('access_token');
    return network.post(
      headers: {
        'Authorization': 'Bearer $access_token',
      },
      path: UrlListService.plnprbayarpayment,
      onSuccess: (onSuccess) {
        // print('Transaksi Berhasil : $onSuccess');
        if (onSuccess['status'] == true) {
          print('Transaksi Berhasil : $onSuccess');

          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: PrabayarTransaksiBerhasilView(
              idpel: idPel,
              waktu: DateFormat('yyyy-MM-dd HH:mm:ss')
                  .format(CustomTime(onSuccess['response']['date'])),
              noMeter: idPel,
              noRef: onSuccess['response']['ref'],
              namaPelanggan: onSuccess['response']['nama_pelanggan'],
              nominal: amount,
              tarif: onSuccess['response']['tarif'],
              daya: onSuccess['response']['daya'].toString(),
              kwh: onSuccess['response']['kwh'].toString(),
              token: onSuccess['response']['token'.toString()],
              admin: admin,
              total: onSuccess['response']['saldo_terpotong'].toString(),
              info: onSuccess['response']['info_text'],
              description: onSuccess['response']['description'],
            ),
          );
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
          PrabayarTransaksiGagalView(
            idpel: idPel,
            namaPelanggan: onError['response']['NAMA_PELANGGAN'],
            waktu: DateFormat('yyyy-MM-dd HH:mm:ss')
                .format(CustomTime(onError['response']['WAKTU'])),
            nominal: onError['response']['NOMINAL'].toString(),
            tarif: onError['response']['TARIF'],
            daya: onError['response']['DAYA'],
            kwh: onError['response']['KWH'],
            token: onError['response']['TOKEN'],
            admin: admin,
            ref: onError['response']['REF'],
            total: onError['response']['SALDO_TERPOTONG'].toString(),
            ket: onError['response']['KET'],
          ),
        );
      },
      body: {
        "productCode": "PLNPRAH",
        "idpel": idPel,
        "idpel2": idPel2,
        "ref1": noref1,
        "ref2": noref2,
        "amount": amount,
        "admin": admin,
        "user_id": pref.read('user_id'),
        "pin": pin,
      },
    );
  }
}
