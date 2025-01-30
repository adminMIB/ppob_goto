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

import '../../../../data/urlservices2.dart';
import '../../pdam/views/bottomGoto.dart';

class BpjsController extends GetxController {
  final network = Get.put(NetworkHelper());
  final helperController = Get.put(HelperController());

  var pref = GetStorage();

  int currentMonth = DateTime.now().month;
  List months = [].obs;
  final originalData = [].obs;
  var filteredData = [].obs; // Data yang telah difilter dan diurutkan
  final dataBPJSKES = [].obs;
  var monthInt;
  //  List<String> years = [].obs;
  @override
  void onInit() {
    getMonthsInYear(12);

    super.onInit();
  }

  inquirygotobpjs(
    BuildContext context,
    var idpel,
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
        onSuccess: (content) {
          Get.back();
          print('hasil inquriry :  $content');
          print('screen : ${content['response']['data']['screen']}');
          // Get.to(BottomGotoView(
          //   screen: content['response']['data']['screen'],

          // ));
          print('idpelll $idpel');
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
              productcode: 'bpjs-denda',
              productname: 'BPJS Denda BPJS Denda',
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
          "productCode": 'bpjs-denda',
          "accountNumber": idpel,
          "productName": 'BPJS Denda BPJS Denda',
          "username": username,
          "user_id": id
        });
  }

  bpjs_ket(
    BuildContext context,
  ) async {
    await helperController.loading(context);
    var access_token = pref.read('access_token');
    return helperController.get(
      path: UrlListService2.getProduct,
      headers: {
        'Authorization': 'Bearer $access_token',
      },
      onSuccess: (content) {
        Get.back();
        print("token $access_token");
        var products = content['response']['data'];

        // Filter data untuk menghapus produk dengan '-gopay' atau '-keluarga'
        // var filteredProducts = products.where((product) {
        //   return !(product['id'].contains('-gopay') ||
        //       product['id'].contains('-keluarga'));
        // }).toList();

        // Membersihkan duplikasi pada productName
        for (var product in products) {
          product['productName'] = product['productName']
              .replaceFirst(RegExp(r'^BPJS Ketenagakerjaan '), '');
        }

        // Urutkan berdasarkan bulan (angka pada 'id')
        products.sort((a, b) {
          // Ekstraksi angka bulan dari id
          int monthA = int.parse(
              RegExp(r'(\d+)month').firstMatch(a['id'])?.group(1) ?? '0');
          int monthB = int.parse(
              RegExp(r'(\d+)month').firstMatch(b['id'])?.group(1) ?? '0');
          return monthA.compareTo(monthB);
        });

        originalData.assignAll(products);
        dataBPJSKES.assignAll(originalData);

        print('Filtered Products: $originalData');
      },
      onError: (onError) {
        print('error : $onError');
      },
      body: {
        'keyword': 'bpjs-ketenagakerjaan',
      },
    );
  }

  bpjs_kes(
    BuildContext context,
  ) async {
    await helperController.loading(context);
    var access_token = pref.read('access_token');
    return helperController.get(
      path: UrlListService2.getProduct,
      headers: {
        'Authorization': 'Bearer $access_token',
      },
      onSuccess: (content) {
        Get.back();
        print("token $access_token");
        var products = content['response']['data'];

        // Filter data untuk menghapus produk dengan '-gopay' atau '-keluarga'
        var filteredProducts = products.where((product) {
          return !(product['id'].contains('-gopay') ||
              product['id'].contains('-keluarga'));
        }).toList();

        // Membersihkan duplikasi pada productName
        for (var product in filteredProducts) {
          product['productName'] = product['productName']
              .replaceFirst(RegExp(r'^BPJS Kesehatan '), '');
        }

        // Urutkan berdasarkan bulan (angka pada 'id')
        filteredProducts.sort((a, b) {
          // Ekstraksi angka bulan dari id
          int monthA = int.parse(
              RegExp(r'(\d+)month').firstMatch(a['id'])?.group(1) ?? '0');
          int monthB = int.parse(
              RegExp(r'(\d+)month').firstMatch(b['id'])?.group(1) ?? '0');
          return monthA.compareTo(monthB);
        });

        originalData.assignAll(filteredProducts);
        dataBPJSKES.assignAll(originalData);

        print('Sorted and Cleaned Products: $filteredProducts');
      },
      onError: (onError) {
        print('error : $onError');
      },
      body: {
        'keyword': 'bpjs-kesehatan',
      },
    );
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
              no_va_keluarga: content['response']['no_va_keluarga'].toString(),
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
