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
import 'package:ppob_mpay1/app/modules/tagihan/pdam/controllers/pdam_controller.dart';
import 'package:ppob_mpay1/main.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class WilayahView extends StatefulWidget {
  final String? productName;
  final String? productCode;
  const WilayahView({
    Key? key,
    this.productName,
    this.productCode,
  }) : super(key: key);

  @override
  _WilayahViewState createState() => _WilayahViewState();
}

class _WilayahViewState extends State<WilayahView> {
  final formkey = GlobalKey<FormState>();
  bool status = false;
  int selectedItemIndex = -1; // -1 berarti tidak ada yang dipilih

  bool _ingatsaya = false;
  bool shouldUpdateViewPrice = false;
  TextEditingController idpel = TextEditingController();

  final pdamController = Get.put(PdamController());
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
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: ListView(
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
                        SizedBox(height: 1.5.h),
                        Text(
                          widget.productName!,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.0.sp,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
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
                        'Nomer ID Pelanggan',
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: TextFormField(
                          minLines: 1,
                          maxLength: 10,
                          controller: idpel,
                          onChanged: (a) {
                            setState(() {
                              wilayah = a.length;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
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
                              return 'ID pelanggan minimal 7 angka dan maximal 10 angka';
                            }
                            return null;
                          },
                        ),
                      ),
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
                              onPressed: idpel.text.length >= 7
                                  ? () async {
                                      if (formkey.currentState!.validate()) {
                                        await pdamController.pdaminquiry(
                                            idpel.text,
                                            widget.productCode,
                                            widget.productName,
                                            context);
                                      }
                                    }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                primary: idpel.text.length >= 7
                                    ? mainColor
                                    : Colors.grey.shade700,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
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
          )
        ],
      )),
    );
  }
}
