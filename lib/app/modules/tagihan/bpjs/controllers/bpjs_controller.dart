import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/data/controller/network_helper.dart';
import 'package:ppob_mpay1/app/data/urlServices.dart';
import 'package:ppob_mpay1/app/modules/tagihan/bpjs/views/bottomsheetbpjskes_view.dart';

class BpjsController extends GetxController {
  var network = Get.put(NetworkHelper());
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
        print('sukses bpjs: $content');
        Get.back();
        Get.bottomSheet(BottomsheetbpjsView(
          idpel: idpel,
          nama_pelanggan: content['response']['nama_pelanggan'],
          // periode: content['response']['periode'],
          periode: periode.toString(),
          jml_keluarga: content['response']['jml_keluarga'],
          harga: content['response']['nominal'].toString(),
          admin: content['response']['admin'].toString(),
          total_payment: content['response']['total_bayar'].toString(),
        ));
      },
      onError: (onError) {
        print(onError);
      },
      body: {
        'idpel': idpel,
        'productCode': 'ASRBPJSKSH',
        'periode': periode,
        'user_id': pref.read('user_id'),
      },
    );
  }
}
