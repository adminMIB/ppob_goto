import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/modules/pulsa/pulsa_model.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pln/views/listrikmodel.dart';

// class PlnController extends GetxController {
//   final helperController = Get.put(HelperController());
//   var listDenomPrabayarListrik = <TokenListrikModel>[];

//   var pref = GetStorage();

//   denomPrabayarListrik() {
//     listDenomPrabayarListrik.clear();
//     listDenomPrabayarListrik.assignAll([
//       TokenListrikModel('20000'),
//       TokenListrikModel('50000'),
//       TokenListrikModel('100000'),
//       TokenListrikModel('200000'),
//       TokenListrikModel('500000'),
//       TokenListrikModel('1000000'),
//     ]);
//   }
// }

class PlnController extends GetxController {
  final helperController = Get.put(HelperController());
  var listDenomPrabayarListrik = <TokenListrikModel>[].obs; // Ubah ke RxList
  var pref = GetStorage();

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
}
