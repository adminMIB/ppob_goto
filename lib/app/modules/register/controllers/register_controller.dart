import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/data/urlServices.dart';
import 'package:ppob_mpay1/app/modules/register/views/OTPregister_view.dart';
import 'package:ppob_mpay1/app/modules/register/views/dialogberes_view.dart';
import 'package:ppob_mpay1/app/modules/register/views/formpersonal.dart';
import 'package:ppob_mpay1/app/modules/register/views/register_view.dart';
import 'package:dio/dio.dart' as dio;

class RegisterController extends GetxController {
  final helperController = Get.put(HelperController());

  var pref = GetStorage();
  registrasiPage() {
    Get.to(const RegisterView());
  }

  verifiksiOTP(var kodeOTP, var email, BuildContext context) async {
    return helperController.post(
        path: UrlListService.verifikasiOtp,
        onSuccess: (content) async {
          print('masuk $content');

          if (content['status_code'] == 200) {
            final pref = GetStorage();
            print('masuk $content');
            pref.write('uuid', content['data']);
            Get.to(FormPersonalView(
              email: email,
            ));
          }
        },
        onError: (content) {
          Get.back();
          print('gagal $content');
        },
        body: {
          "email": email,
          "code": kodeOTP,
        });
  }

  email(BuildContext context, var email) async {
    return helperController.post(
      path: UrlListService.email,
      onSuccess: (content) {
        print('sukses');
        Get.off(OTPregisterView(
          email: email,
        ));
      },
      onError: (content) {
        Get.back();
        print('gagal $content');
      },
      body: {
        'email': email,
      },
    );
  }

  datapersonal(
    var nama_lengkap,
    var username,
    var email,
    var password,
    var confirm_password,
    var nomer_tlp,
    var alamat,
    var foto_ktp,
    var nama_kerabat,
    var status_kerabat,
    var nik,
    var namaMerchant,
    var pin,
    var confirm_pin,
    var nomer_tlp_kerabat,
    var alamat_kerabat,
    BuildContext context,
  ) async {
    return helperController.post(
      path: UrlListService.register,
      containsFile: true,
      onSuccess: (content) {
        print('suksess : $content');
        if (content['status'] == true) {
          showDialog(
              context: context,
              builder: (BuildContext context) => const Dialogberes());
        }
      },
      onError: (content) {
        Get.back();
        print('gagal : $content');
      },
      body: {
        "nama_lengkap": nama_lengkap,
        "username": username,
        "email": email,
        "password": password,
        "confirm_password": confirm_password,
        "nomer_tlp": nomer_tlp,
        "alamat": alamat,
        "foto_ktp": await dio.MultipartFile.fromFile(
          foto_ktp.path,
          filename: foto_ktp.name,
        ),
        "nama_kerabat": nama_kerabat,
        "nomer_tlp_kerabat": nomer_tlp_kerabat,
        "alamat_kerabat": alamat_kerabat,
        "status_kerabat": status_kerabat,
        "nik": nik,
        // "foto": foto_profile,
        "namaMerchant": namaMerchant,
        "pin": pin,
        "confirm_pin": confirm_pin,
      },
    );
  }
}
