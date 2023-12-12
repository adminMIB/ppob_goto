import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PulsatransaksiController extends GetxController {
  var pref = GetStorage();

  transaksipulsa(var nomoTelepon, var ammount, BuildContext context) async {
    var access_token = pref.read('access_token');
  }
}
