import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/data/urlservices2.dart';
import 'package:ppob_mpay1/app/modules/register/views/OTPregister_view.dart';
import 'package:ppob_mpay1/app/modules/register/views/dialogberes_view.dart';
import 'package:ppob_mpay1/app/modules/register/views/formpersonal.dart';
import 'package:ppob_mpay1/app/modules/register/views/register_view.dart';
import 'package:dio/dio.dart' as dio;
import 'package:path/path.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

class RegisterController extends GetxController {
  final helperController = Get.put(HelperController());

  var pref = GetStorage();
  registrasiPage() {
    Get.to(const RegisterView());
  }

  verifiksiOTP(var kodeOTP, var email, BuildContext context) async {
    await helperController.loading(context);
    return helperController.post(
        path: Urlservice2.otp,
        onSuccess: (content) async {
          print('masuk : $content');

          if (content['status'] == true) {
            final pref = GetStorage();
            print('masuk : $content');
            // pref.write('uuid', content['data']);
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
    await helperController.loading(context);
    return helperController.post(
      path: Urlservice2.email,
      onSuccess: (content) {
        print('sukses : $content');
        Get.off(OTPregisterView(
          email: email,
        ));
      },
      onError: (content) {
        Get.back();
        print('gagal : $content');
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
    File? foto_ktp,
    var nama_kerabat,
    var status_kerabat,
    File? foto_profile,
    var namaMerchant,
    var nik,
    var pin,
    var confirm_pin,
    var nomer_tlp_kerabat,
    var alamat_kerabat,
    BuildContext context,
  ) async {
    String nama_profile = foto_profile!.path.split('/').last;
    String nama_ktp = foto_ktp!.path.split('/').last;
    final mimeType_profile = lookupMimeType(foto_profile.path) ??
        nama_profile.split('.').last; // Cek tipe MIME file
    final mimeType_ktp = lookupMimeType(foto_ktp.path) ??
        nama_ktp.split('.').last; // Cek tipe MIME file
    // var name_profile = foto_profile.path.split('/').last ;
    // var name_profile = ;
    await helperController.loading(context);
    return helperController.post(
      path: Urlservice2.registrasiV1,
      // path: 'https://3328-139-192-57-138.ngrok-free.app/api/v1/auth/register',
      containsFile: true,
      onSuccess: (content) {
        Get.back();
        print('object');
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
        'nama_lengkap': nama_lengkap,
        'username': username,
        'email': email,
        'password': password,
        'confirm_password': confirm_password,
        'nomer_tlp': nomer_tlp,
        'alamat': alamat,
        'foto_ktp': await dio.MultipartFile.fromFile(
          foto_ktp.path,
          filename: nama_ktp,
          contentType: MediaType.parse(mimeType_ktp),
        ),
        'foto_profile': await dio.MultipartFile.fromFile(
          foto_profile.path,
          filename: nama_profile,
          contentType: MediaType.parse(mimeType_profile),
        ),
        'nama_kerabat': nama_kerabat,
        'nomer_tlp_kerabat': 081266767,
        'alamat_kerabat': alamat_kerabat,
        'status_kerabat': status_kerabat,
        'nik': nik,
        'namaMerchant': namaMerchant,
        'pin': pin,
        'confirm_pin': confirm_pin,
        'kota': '-',
        'alamat_toko': '-'
      },
    );
  }
}
