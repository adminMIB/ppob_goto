// ignore_for_file: prefer_const_constructors

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/modules/pin/views/pin_view.dart';
import 'package:ppob_mpay1/app/modules/pulsa/controllers/pulsa_controller.dart';
import 'package:ppob_mpay1/app/modules/pulsa/invoice.dart';
import 'package:ppob_mpay1/app/modules/pulsa/views/kontak_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/bpjs/views/kesehatan_view.dart';
import 'package:ppob_mpay1/main.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KesehatanView extends StatefulWidget {
  const KesehatanView({Key? key}) : super(key: key);

  @override
  _KesehatanViewState createState() => _KesehatanViewState();
}

class _KesehatanViewState extends State<KesehatanView> {
  bool status = false;
  int selectedItemIndex = -1;
  bool isSelected = false;

  bool shouldUpdateViewPrice = false;
  final formkey = GlobalKey<FormState>();
  TextEditingController idpel = TextEditingController();

  final helperController = Get.put(HelperController());

  int wilayah = 0;
  int lengthNoTelepon = 0;
  var pickNumber = '';

  @override
  void initState() {
    super.initState();
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
        body: Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: GetBuilder<PulsaController>(
                      init: PulsaController(),
                      builder: (_data) => ListView(
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
                                    child: Image.asset(
                                      'assets/images/kesehatan.png',
                                      height: 1.8.h,
                                    ),
                                  ),
                                  SizedBox(height: 1.5.h),
                                  Text(
                                    'BPJS Kesehatan',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0.sp,
                                        fontWeight: FontWeight.w600),
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
                                    height: 2.h,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.0.h, right: 2.0.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'No. ID Pelanggan / Kode bayar',
                                  style: TextStyle(
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.0.h,
                                ),
                                Form(
                                  key: formkey,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  child: TextFormField(
                                    minLines: 1,
                                    maxLength: 15,
                                    controller: idpel,
                                    onChanged: (a) {
                                      setState(() {
                                        wilayah = a.length;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      hintText: 'Masukkan Kode ',
                                      hintStyle: TextStyle(
                                        fontSize: 12.0.sp,
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (wilayah < 7) {
                                        return 'ID pelanggan minimal 7 angka dan maximal 15 angka';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                //
                                //Akhir nominal Token Listrik
                                SizedBox(
                                  height: Get.height * 0.45,
                                ),
                                Container(
                                  color: whiteColor,
                                  padding: EdgeInsets.all(16.0),
                                  child: Center(
                                    child: SizedBox(
                                      width: 41.0.h,
                                      height: 6.0.h,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          print('masuk');
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: idpel.text.length >= 7
                                              ? mainColor
                                              : Colors.grey.shade700,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          // elevation: 10,
                                        ),
                                        child: Text(
                                          'Lanjutkan',
                                          style: TextStyle(
                                            fontSize: 14.0.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFFDF8F8),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
