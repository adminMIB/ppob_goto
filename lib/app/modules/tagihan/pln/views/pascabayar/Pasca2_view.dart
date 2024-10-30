import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pln/controllers/pln_controller.dart';
import 'package:sizer/sizer.dart';

class PascaView extends StatefulWidget {
  String? pasca;
  PascaView({
    Key? key,
    this.pasca,
  }) : super(key: key);

  @override
  _PascaViewState createState() => _PascaViewState();
}

class _PascaViewState extends State<PascaView> {
  final formkey = GlobalKey<FormState>();
  TextEditingController idpel = TextEditingController();
  final plnpascaController = Get.put(PlnController());
  int wilayah = 0;
  bool _isButtonVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 2.h, right: 2.h),
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
                          // _isButtonVisible = a.isNotEmpty;
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
                  SizedBox(
                    height: 2.h,
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
                                      await plnpascaController.plnpascainquiry(
                                          idpel.text, context);
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
