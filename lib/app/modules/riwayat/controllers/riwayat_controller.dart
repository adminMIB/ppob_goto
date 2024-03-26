import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/data/urlServices.dart';

class RiwayatController extends GetxController {
  final helperController = Get.put(HelperController());

  var listRiwayat = [].obs;
  var riwayatBerhasil = [].obs;
  var riwayatGagal = [].obs;
  var isLoadBalance = false.obs;
  var pref = GetStorage();

  //Riwayat transaksi berhasil
  ListRiwayatBerhasil(BuildContext context) async {
    isLoadBalance(true);
    var access_token = pref.read('access_token');
    return helperController.get(
      path: UrlListService.riwayat,
      onSuccess: (onSuccess) {
        // print('Ini Riwayat ${onSuccess}');
        if (onSuccess['status'] == true) {
          print('Ini Riwayat Berhasil');
          print(onSuccess['response']['data']);
          listRiwayat.assignAll(onSuccess['response']['data']);
          riwayatBerhasil.assignAll(
              listRiwayat.where((element) => element['status'] == 'SUKSES'));
          // listRiwayat.assignAll(items)
        }
      },
      onError: (onError) {
        print('tidak ada ${onError}');
      },
      headers: {
        'Authorization': 'Bearer $access_token',
      },
    );
  }

  //Riwayat transaksi Gagal
  ListRiwayatGagal(BuildContext context) async {
    isLoadBalance(true);
    var access_token = pref.read('access_token');
    return helperController.get(
      path: UrlListService.riwayat,
      onSuccess: (onSuccess) {
        // print('Ini Riwayat ${onSuccess}');
        if (onSuccess['status'] == true) {
          print('Ini Riwayat Gagal');
          print(onSuccess['response']['data']);
          listRiwayat.assignAll(onSuccess['response']['data']);
          riwayatGagal.assignAll(
              listRiwayat.where((element) => element['status'] == 'GAGAL'));
          // listRiwayat.assignAll(items)
        }
      },
      onError: (onError) {
        print('tidak ada ${onError}');
      },
      headers: {
        'Authorization': 'Bearer $access_token',
      },
    );
  }
}
