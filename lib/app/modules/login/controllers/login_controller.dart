import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/data/urlServices.dart';
import 'package:ppob_mpay1/app/main_page.dart';

class LoginController extends GetxController {
  final helperController = Get.put(HelperController());

  var pref = GetStorage();

  loginhc(
    var username,
    var password,
    BuildContext context,
  ) async {
    return helperController.post(
      path: UrlListService.login,
      // path: 'http://168.138.169.44:69/api/auth/login',
      onSuccess: (context) async {
        print('Login : $context');

        if (context['status'] == true) {
          var user = context['user'];
          var access_token = context['access_token'];
          print('user: $user');
          pref.write('nama_lengkap', user['nama_lengkap']);
          pref.write('email', user['email']);
          pref.write('created_at', user['created_at']);

          pref.write('username', user['username']);
          pref.write('nomer_tlp', user['nomer_tlp']);
          pref.write('is_active', user['is_active']);
          pref.write('access_token', context['access_token']);
          pref.write('token_type', context['type_token']);
          pref.write('expires_in', context['expires_in']);
          pref.write('user_id', user['user_id']);
          Get.to(MainPage());
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
        "username": username,
        "password": password,
      },
    );
  }

  actlogin(var username, var password, BuildContext context) async {
    await helperController.loading(context);
    return helperController.post(
      path: UrlListService.login,
      // path: 'http://168.138.169.44:69/api/auth/login',
      onSuccess: (context) async {
        print('hasil $context');

        print('hasil $context');
        if (context['status'] == true) {
          var user = context['user'];
          var access_token = context['access_token'];

          print('test $user');
          print('access $access_token');

          pref.write('nama_lengkap', user['nama_lengkap']);
          pref.write('email', user['email']);
          pref.write('created_at', user['created_at']);
          pref.write('username', user['username']);
          pref.write('nomer_tlp', user['nomer_tlp']);
          pref.write('is_active', user['is_active']);
          pref.write('access_token', context['access_token']);
          pref.write('token_type', context['type_token']);
          pref.write('expires_in', context['expires_in']);
          pref.write('user_id', user['user_id']);
          Get.offAll(MainPage());
          print(context);
        } else {
          Get.back();
          print(context);
        }
      },
      onError: (content) {
        // Get.back();
        print('Error: $content');
        helperController.popUpMessage(
            'Email yang anda masukkan tidak ditemukan.', context);
      },
      body: {
        "username": username,
        "password": password,
      },
    );
  }
}
