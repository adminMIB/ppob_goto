import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/data/urlservices2.dart';
import 'package:ppob_mpay1/app/main_page.dart';

class LoginController extends GetxController {
  final helperController = Get.put(HelperController());

  var pref = GetStorage();

  loginhc(
    var email,
    var password,
    BuildContext context,
  ) async {
    return helperController.post(
      path: UrlListService2.loginGoto,
      onSuccess: (context) async {
        // print('Login : $context');

        if (context['status'] == true) {
          // print('Login : $context');
          // var user = context['user'];
          // var access_token = context['access_token'];
          // print('user: $user');
          // pref.write('nama_lengkap', user['nama_lengkap']);
          // pref.write('email', user['email']);
          // pref.write('created_at', user['created_at']);

          // pref.write('username', user['username']);
          // pref.write('nomer_tlp', user['nomer_tlp']);
          // pref.write('is_active', user['is_active']);
          // pref.write('access_token', context['access_token']);
          // pref.write('token_type', context['type_token']);
          // pref.write('expires_in', context['expires_in']);
          // pref.write('user_id', user['user_id']);
          // // Get.offAll(MainPage());
          // Get.to(MainPage());
        } else {
          Get.back();
          print('$context');
        }
      },
      onError: (context) {
        Get.back();
        print('Error : $context');
      },
      body: {
        "email": email,
        "password": password,
      },
    );
  }

  actlogin(var email, var password, BuildContext context) async {
    await helperController.loading(context);
    return helperController.post(
      // path: UrlListService2.loginGoto,
      path: UrlListService2.loginGoto,

      onSuccess: (context) async {
        Get.back();
        // print('hasil $context');
        if (context['status'] == true) {
          print('berhasil : $context');
          print('tokenn:  ${context['acces_token']}');
          // print('hasil $context');
          var user = context['data'];
          // var access_token = context['access_token'];

          // print('test $user');
          // print('access $access_token');

          pref.write('nama_lengkap', user['nama_lengkap']);
          pref.write('username', user['username']);
          pref.write('email', user['email']);
          pref.write('password', user['password']);
          pref.write('nomer_tlp', user['nomer_tlp']);
          pref.write('foto_ktp', user['foto_ktp']);
          pref.write('foto_profile', user['foto_profile']);
          pref.write('nik', user['nik']);
          pref.write('nama_kerabat', user['nama_kerabat']);
          pref.write('nomer_tlp_kerabat', user['nomer_tlp_kerabat']);
          pref.write('alamat_kerabat', user['alamat_kerabat']);
          pref.write('status_kerabat', user['status_kerabat']);
          pref.write('namaMerchant', user['namaMerchant']);
          pref.write('createdAt', user['createdAt']);
          pref.write('updatedAt', user['updatedAt']);
          pref.write('access_token', context['acces_token']);
          pref.write('id', user['id']);

          Get.offAll(MainPage());
          // print(context);
        } else {
          Get.back();
          print(context);
        }
      },
      onError: (content) {
        Get.back();
        print('Error: $content');
        if (content is Map<String, dynamic> && content['status'] == false) {
          helperController.popUpMessage(
              content['response']['message'], context);
        } else {
          helperController.popUpMessage("Tunggu beberapa saat lagi", context);
        }
      },
      body: {
        "email": email,
        "password": password,
      },
    );
  }
}
