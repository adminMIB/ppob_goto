// ignore_for_file: prefer_const_constructors

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/modules/tagihan/bpjs/controllers/bpjs_controller.dart';
import 'package:ppob_mpay1/main.dart';
import 'package:sizer/sizer.dart';

import '../../../goto/controllers/goto_controller.dart';

class DendabpjsView extends StatefulWidget {
  const DendabpjsView({Key? key}) : super(key: key);

  @override
  _DendabpjsViewState createState() => _DendabpjsViewState();
}

class _DendabpjsViewState extends State<DendabpjsView> {
  int selectedItemIndex = -1; // -1 berarti tidak ada yang dipilih
  final formkey = GlobalKey<FormState>();
  int wilayah = 0;
  TextEditingController idpel = TextEditingController();

  final bpjsController = Get.put(BpjsController());
  final helperController = Get.put(HelperController());
  final gotoController = Get.put(GotoController());
  //  final detailgoto = Get.put(TransferbankController());

  var bayarHinggaValue;

  String? productname1;
  String? productcode1;

  int lengthNoTelepon = 0;

  @override
  void initState() {
    super.initState();
    // bpjsController.bpjs_ket(context);
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
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text(
                'BPJS',
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
                  padding: EdgeInsets.only(
                    left: 2.h,
                    right: 2.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                          maxLength: 15,
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
                              return 'ID pelanggan minimal 7 angka dan maximal 15 angka';
                            }
                            return null;
                          },
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          color: whiteColor,
                          padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                          child: Center(
                            child: SizedBox(
                              width: Get.width,
                              height: 6.0.h,
                              child: ElevatedButton(
                                onPressed: idpel.text.length >= 7
                                    ? () async {
                                        if (formkey.currentState!.validate()) {
                                          // await plnprabayarController
                                          //     .plnprabayarInquiry(
                                          //         idpel.text, context);
                                          print('hasil code: $productname1');
                                          await bpjsController.inquirygotobpjs(
                                            context,
                                            idpel.text,
                                          );
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
            )));
  }
}
