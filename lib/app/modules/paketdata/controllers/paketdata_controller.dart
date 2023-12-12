import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/data/urlServices.dart';
import 'package:ppob_mpay1/app/modules/paketdata/views/modelPaketdata.dart';
import 'package:ppob_mpay1/app/modules/pulsa/pulsa_model.dart';

class PaketdataController extends GetxController {
  final helperController = Get.put(HelperController());

  var nomorPonsel;
  var provider = ''.obs;
  var logoProvider = ''.obs;
  var listNominalPaketdata = [].obs;
  var listPulsaOnly = [].obs;
  final isCek = true.obs;

  var pref = GetStorage();

  var codeProduct;

  checkNomorPonsel(nomorPonsel, BuildContext context) {
    if (nomorPonsel.toString().contains('0812') ||
        nomorPonsel.toString().contains('0811') ||
        nomorPonsel.toString().contains('0821') ||
        nomorPonsel.toString().contains('0822') ||
        nomorPonsel.toString().contains('0815') ||
        nomorPonsel.toString().contains('0813') ||
        nomorPonsel.toString().contains('0853') ||
        nomorPonsel.toString().contains('0852') ||
        nomorPonsel.toString().contains('0823') ||
        nomorPonsel.toString().contains('0851') ||
        nomorPonsel.toString().contains('+62812') ||
        nomorPonsel.toString().contains('+62811') ||
        nomorPonsel.toString().contains('+62821') ||
        nomorPonsel.toString().contains('+62822') ||
        nomorPonsel.toString().contains('+62815') ||
        nomorPonsel.toString().contains('+62813') ||
        nomorPonsel.toString().contains('+62853') ||
        nomorPonsel.toString().contains('+62823') ||
        nomorPonsel.toString().contains('+62851') ||
        nomorPonsel.toString().contains('+62 812') ||
        nomorPonsel.toString().contains('+62 821') ||
        nomorPonsel.toString().contains('+62 822') ||
        nomorPonsel.toString().contains('+62 811') ||
        nomorPonsel.toString().contains('+62 815') ||
        nomorPonsel.toString().contains('+62 813') ||
        nomorPonsel.toString().contains('+62 853') ||
        nomorPonsel.toString().contains('+62 823') ||
        nomorPonsel.toString().contains('+62 851') ||
        nomorPonsel.toString().contains('+62 852') ||
        nomorPonsel.toString().contains('+62852')) {
      provider('Telkomsel');
      logoProvider('assets/images/telkomsel.png');
      listNominalPaketdata.clear();
      productPaketdata(context, 'TELKOMSEL');
      codeProduct = "100001";
      isCek(true);
    } else if (nomorPonsel.toString().contains('0831') ||
        nomorPonsel.toString().contains('0832') ||
        nomorPonsel.toString().contains('0833') ||
        nomorPonsel.toString().contains('0838') ||
        nomorPonsel.toString().contains('+62831') ||
        nomorPonsel.toString().contains('+62832') ||
        nomorPonsel.toString().contains('+62833') ||
        nomorPonsel.toString().contains('+62838') ||
        nomorPonsel.toString().contains('+62 831') ||
        nomorPonsel.toString().contains('+62 832') ||
        nomorPonsel.toString().contains('+62 833') ||
        nomorPonsel.toString().contains('+62 838')) {
      isCek(true);
      provider('AXIS');
      listNominalPaketdata.clear();
      productPaketdata(context, 'AXIS / XL');

      codeProduct = "100003";
      logoProvider('assets/images/logo_axis.png');
    } else if (nomorPonsel.toString().contains('0881') ||
        nomorPonsel.toString().contains('0882') ||
        nomorPonsel.toString().contains('0887') ||
        nomorPonsel.toString().contains('0888') ||
        nomorPonsel.toString().contains('+62881') ||
        nomorPonsel.toString().contains('+62882') ||
        nomorPonsel.toString().contains('+62887') ||
        nomorPonsel.toString().contains('+62888') ||
        nomorPonsel.toString().contains('+62 881') ||
        nomorPonsel.toString().contains('+62 882') ||
        nomorPonsel.toString().contains('+62 887') ||
        nomorPonsel.toString().contains('+62 888')) {
      listNominalPaketdata.clear();
      isCek(true);
      provider('Smartfren');
      productPaketdata(context, 'SMARTFREN');
      codeProduct = "";
      // helperController.popUpMessage('Biller tidak tersedia.', context);
      logoProvider('assets/images/more.png');
    } else if (nomorPonsel.toString().contains('0896') ||
        nomorPonsel.toString().contains('0897') ||
        nomorPonsel.toString().contains('0898') ||
        nomorPonsel.toString().contains('0899') ||
        nomorPonsel.toString().contains('+62896') ||
        nomorPonsel.toString().contains('+62897') ||
        nomorPonsel.toString().contains('+62898') ||
        nomorPonsel.toString().contains('+62899') ||
        nomorPonsel.toString().contains('+62 896') ||
        nomorPonsel.toString().contains('+62 897') ||
        nomorPonsel.toString().contains('+62 898') ||
        nomorPonsel.toString().contains('+62 899')) {
      isCek(true);
      provider('Three');
      listNominalPaketdata.clear();
      productPaketdata(context, 'THREE');
      codeProduct = "100004";
      logoProvider('assets/images/tree.png');
    } else if (nomorPonsel.toString().contains('0816') ||
        nomorPonsel.toString().contains('0856') ||
        nomorPonsel.toString().contains('0857') ||
        nomorPonsel.toString().contains('0858') ||
        nomorPonsel.toString().contains('+62815') ||
        nomorPonsel.toString().contains('+62816') ||
        nomorPonsel.toString().contains('+62856') ||
        nomorPonsel.toString().contains('+62857') ||
        nomorPonsel.toString().contains('+62858') ||
        nomorPonsel.toString().contains('+62 815') ||
        nomorPonsel.toString().contains('+62 816') ||
        nomorPonsel.toString().contains('+62 856') ||
        nomorPonsel.toString().contains('+62 858') ||
        nomorPonsel.toString().contains('+62 857')) {
      isCek(true);
      provider('Indosat');
      listNominalPaketdata.clear();
      productPaketdata(context, 'INDOSAT');
      codeProduct = "100002";
      logoProvider('assets/images/indosat.jpg');
    } else if (nomorPonsel.toString().contains('0817') ||
        nomorPonsel.toString().contains('0818') ||
        nomorPonsel.toString().contains('0819') ||
        nomorPonsel.toString().contains('0859') ||
        nomorPonsel.toString().contains('0877') ||
        nomorPonsel.toString().contains('0878') ||
        nomorPonsel.toString().contains('0879') ||
        nomorPonsel.toString().contains('+62817') ||
        nomorPonsel.toString().contains('+62818') ||
        nomorPonsel.toString().contains('+62819') ||
        nomorPonsel.toString().contains('+62859') ||
        nomorPonsel.toString().contains('+62877') ||
        nomorPonsel.toString().contains('+62878') ||
        nomorPonsel.toString().contains('+62879') ||
        nomorPonsel.toString().contains('+62 817') ||
        nomorPonsel.toString().contains('+62 818') ||
        nomorPonsel.toString().contains('+62 819') ||
        nomorPonsel.toString().contains('+62 877') ||
        nomorPonsel.toString().contains('+62 878') ||
        nomorPonsel.toString().contains('+62 879') ||
        nomorPonsel.toString().contains('+62 859')) {
      isCek(true);
      provider('XL');
      listNominalPaketdata.clear();
      productPaketdata(context, 'AXIS / XL');
      codeProduct = "100003";

      logoProvider('assets/images/xl.png');
    } else {
      logoProvider('assets/images/more.png');
      isCek(true);
    }
  }

  productPaketdata(BuildContext context, var provider) async {
    var access_token = pref.read('access_token');

    return helperController.post(
      path: UrlListService.productProvider,
      headers: {
        'Authorization': 'Bearer $access_token',
      },
      onSuccess: (content) async {
        if (content['status'] == true) {
          print(content['response']['content']);
          listNominalPaketdata.assignAll(content['response']['content']);
          listPulsaOnly.assignAll(listNominalPaketdata
              .where((element) => element['type'] == 'paket_data'));
          // List product = content['response']['content'];
          // listNominalPulsa.assignAll(
          //     listNominalPulsa.where((product) => product['type'] == 'pulsa'));
        }
      },
      onError: (context) {
        Get.back();
        print('Error: $context');
      },
      body: {'provider': provider},
    );
  }
}
