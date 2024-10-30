// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../data/colors.dart';
import '../../../../data/controller/helpercontroller.dart';
import '../controllers/pdam_controller.dart';

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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'PDAM',
            style: TextStyle(
              color: mainColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: mainColor,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 2.h, right: 2.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        widget.productName!,
                        style: TextStyle(
                          fontSize: 11.0.sp,
                          fontWeight: FontWeight.w400,
                          color: whiteColor,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    'No Meter/ID Pelanggan',
                    style: TextStyle(
                      fontSize: 11.0.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
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
                    height: 2.h,
                  ),
                  // Container(
                  //   padding: EdgeInsets.all(16.0),
                  //   decoration: BoxDecoration(
                  //     color: Colors.amber.withOpacity(0.4),
                  //     borderRadius: BorderRadius.circular(5),
                  //   ),
                  //   child: Text(
                  //     'Pembayaran tagihan listrik tidak dilakukan pada pukul 23.00 - 00.30 WIB sesuai ketentuan PLN',
                  //     style: TextStyle(
                  //       fontSize: 11.0.sp,
                  //       fontWeight: FontWeight.w400,
                  //     ),
                  //     textAlign: TextAlign.justify,
                  //   ),
                  // ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.only(bottom: 2.h),
                      child: Center(
                        child: SizedBox(
                          width: Get.width,
                          height: 6.0.h,
                          child: ElevatedButton(
                            onPressed: idpel.text.length >= 7
                                // idpel.text.length >= 7
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
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
