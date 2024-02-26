import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/data/controller/network_helper.dart';
import 'package:ppob_mpay1/app/data/urlServices.dart';
import 'package:dio/dio.dart' as dio;
import 'package:ppob_mpay1/app/modules/akun/views/akun_view.dart';
import 'package:ppob_mpay1/app/modules/akun/views/profile_view.dart';

class AkunController extends GetxController {
  final HelperController helperController = Get.put(HelperController());
  final network = Get.put(NetworkHelper());

  var userProfile = {}.obs;
  var merchant = {}.obs;
  var kerabat = {}.obs;
  var isLoading = false.obs;
  var pref = GetStorage();

  profile(BuildContext context) async {
    // isLoading.value = true;
    // await helperController.loading(context);
    var access_token = pref.read('access_token');

    return helperController.get(
      path: UrlListService.profile,
      headers: {
        'Authorization': 'Bearer $access_token',
      },
      onSuccess: (content) {
        print('berhasil $content');
        if (content['status'] == true) {
          userProfile.value = content['response']['profile'];
          merchant.value = content['response']['dataMerchant'];
          kerabat.value = content['response']['dataKerabat'];
          print('hasil: $content');
        }
      },
      onError: (error) {
        print('hasil error: $error');
      },
    );
  }

  updateprofile(
      var nama_lengkap,
      var username,
      var email,
      var nomer_tlp,
      var alamat,
      var nama_kerabat,
      var nomer_tlp_kerabat,
      var alamat_kerabat,
      var status_kerabat,
      var nik,
      // var foto_profile,
      var namaMerchant,
      var kota,
      var alamat_toko,
      BuildContext context) async {
    await helperController.loading(context);

    var access_token = pref.read('access_token');
    print('token: $access_token');
    return helperController.post(
        path: UrlListService.updateprofile,
        headers: {
          'Authorization': 'Bearer $access_token',
        },
        onSuccess: (content) {
          Get.back();
          Get.back();
          // Get.off(AkunView());
          print(content);
        },
        onError: (onError) {
          print(onError);
        },
        body: {
          "user_id": pref.read('user_id') ?? '',
          "nama_lengkap": nama_lengkap,
          "username": username,
          "email": email,
          "nomer_tlp": nomer_tlp,
          "alamat": alamat,
          "nama_kerabat": nama_kerabat,
          "nomer_tlp_kerabat": nomer_tlp_kerabat,
          "alamat_kerabat": alamat_kerabat,
          "status_kerabat": status_kerabat,
          "nik": nik,
          // "foto_profile": await dio.MultipartFile.fromFile(
          //   foto_profile.path,
          //   filename: foto_profile.name,
          // ),
          "namaMerchant": namaMerchant,
          "kota": kota,
          "alamat_toko": alamat_toko,
        });
  }
}
