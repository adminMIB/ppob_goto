// ignore_for_file: prefer_const_constructors

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/modules/pin/views/pin_view.dart';
import 'package:ppob_mpay1/app/modules/pulsa/controllers/pulsa_controller.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pln/controllers/pln_controller.dart';
import 'package:ppob_mpay1/main.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:bottom_sheet/bottom_sheet.dart';

class PascabayarView extends StatefulWidget {
  const PascabayarView({Key? key}) : super(key: key);

  @override
  _PascabayarViewState createState() => _PascabayarViewState();
}

class _PascabayarViewState extends State<PascabayarView> {
  bool status = false;
  int selectedItemIndex = -1; // -1 berarti tidak ada yang dipilih

  bool _ingatsaya = false;
  bool shouldUpdateViewPrice = false;
  final formkey = GlobalKey<FormState>();
  TextEditingController idpel = TextEditingController();
  final plnpascaController = Get.put(PlnController());
  final helperController = Get.put(HelperController());

  PhoneContact? _phoneContact;
  int wilayah = 0;
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
                                    'assets/images/pln.png',
                                    height: 5.0.h,
                                  ),
                                ),
                                SizedBox(height: 1.5.h),
                                Text(
                                  'Tagihan Listrik',
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
                                  height: 1.5.h,
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
                                'No ID Pelanggan',
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
                                      borderRadius: BorderRadius.circular(10.0),
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
                              Container(
                                padding: EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  color: Colors.amber.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  'Pembayaran tagihan listrik tidak dilakukan pada pukul 23.00 - 00.30 WIB sesuai ketentuan PLN',
                                  style: TextStyle(
                                    fontSize: 11.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.37,
                              ),
                              Container(
                                color: whiteColor,
                                padding: EdgeInsets.all(16.0),
                                child: Center(
                                  child: SizedBox(
                                    width: 41.0.h,
                                    height: 6.0.h,
                                    child: ElevatedButton(
                                      onPressed: idpel.text.length >= 7
                                          ? () async {
                                              if (formkey.currentState!
                                                  .validate()) {
                                                await plnpascaController
                                                    .plnpascainquiry(
                                                        idpel.text, context);
                                              }
                                            }
                                          : null,
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
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
