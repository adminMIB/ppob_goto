// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/modules/pulsa/controllers/pulsa_controller.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pdam/controllers/pdam_controller.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pdam/views/wilayah_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pln/views/nontaglis_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pln/views/prabayar_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pln/views/tagihanlistrik_view.dart';
import 'package:ppob_mpay1/main.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PdamView extends StatefulWidget {
  List? dataPdam;
  PdamView({Key? key, this.dataPdam}) : super(key: key);

  @override
  _PdamViewState createState() => _PdamViewState();
}

class _PdamViewState extends State<PdamView> {
  final pdamController = Get.put(PdamController());
  final isLoading = false.obs;

  bool status = false;
  int selectedItemIndex = -1;

  bool _ingatsaya = false;
  TextEditingController searchController = TextEditingController();

  final pulsaController = Get.put(PulsaController());
  final helperController = Get.put(HelperController());

  PhoneContact? _phoneContact;

  int lengthNoTelepon = 0;
  var pickNumber = '';

  @override
  void initState() {
    super.initState();
    pdamController.pdam(context); // Make sure this is called
    // print(pdamController.dataPdam); // Check if data is populated
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        controller.restart();
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              SafeArea(
                  child: Column(
                children: [
                  AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                  Stack(
                    children: [
                      Column(
                        children: [
                          Center(
                            child: SvgPicture.asset(
                              'assets/images/air.svg',
                              fit: BoxFit.contain,
                              width: 5.0.h,
                              height: 5.0.h,
                            ),
                          ),
                          SizedBox(height: 1.0.h),
                          Text(
                            'PDAM',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Divider(
                            color: Colors.grey.shade500,
                            indent: 2.0.h,
                            endIndent: 2.0.h,
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 2.0.h,
                              right: 2.0.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pilih Wilayah',
                                  style: TextStyle(
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  height: 1.0.h,
                                ),
                                TextField(
                                  controller: searchController,
                                  onChanged: (value) {
                                    pdamController.filterData(value);
                                  },
                                  // onChanged: (text) {
                                  //   // Trigger the search when the text changes
                                  //   pdamController.updateSearchText(text);
                                  // },
                                  // onChanged: (query) {
                                  //   pdamController.search(query);
                                  // },
                                  decoration: InputDecoration(
                                    hintText: 'Cari Wilayah...',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    prefixIcon: Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.0.h,
                                ),
                                SizedBox(
                                  height: Get.height * 0.60,
                                  child: Obx(
                                    () => SingleChildScrollView(
                                      child: Column(
                                        children: pdamController.dataPdam
                                            .map((element) {
                                          return Container(
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  leading: SvgPicture.asset(
                                                    'assets/images/air.svg',
                                                    fit: BoxFit.contain,
                                                    width: 5.0.h,
                                                    height: 4.0.h,
                                                  ),
                                                  title: Text(
                                                    element['product_name'],
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  trailing: Icon(
                                                    Icons
                                                        .keyboard_arrow_right_outlined,
                                                  ),
                                                  onTap: () {
                                                    Get.to(WilayahView(
                                                      productName: element[
                                                          'product_name'],
                                                      productCode: element[
                                                          'product_code'],
                                                    ));
                                                  },
                                                ),
                                                Divider(
                                                  color: Colors.grey.shade300,
                                                  indent: 1.0,
                                                  endIndent: 1.0,
                                                ),
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
