import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/modules/pin/views/pin_view.dart';
import 'package:sizer/sizer.dart';

class InputTlpView extends StatefulWidget {
  String? idpel;
  String? periode;
  String? ref1;
  String? ref2;
  String? total_payment;
  String? admin;
  InputTlpView(
      {Key? key,
      this.idpel,
      this.periode,
      this.ref1,
      this.ref2,
      this.total_payment,
      this.admin})
      : super(key: key);

  @override
  _InputTlpViewState createState() => _InputTlpViewState();
}

class _InputTlpViewState extends State<InputTlpView> {
  final formkey = GlobalKey<FormState>();
  int wilayah = 0;
  TextEditingController no_telp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.only(left: 2.h, right: 2.h, top: 1.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'No. Handphone',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Form(
                key: formkey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  minLines: 1,
                  maxLength: 20,
                  controller: no_telp,
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
                    hintText: 'Masukkan No. Handphone ',
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
                  color: Colors.transparent,
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: SizedBox(
                      width: 41.0.h,
                      height: 6.0.h,
                      child: ElevatedButton(
                        onPressed: no_telp.text.length >= 7
                            // idpel.text.length >= 7
                            ? () async {
                                if (formkey.currentState!.validate()) {
                                  Get.to(PinView(
                                    tipeTransaksi: 'bpjskesehatan',
                                    idpel: widget.idpel,
                                    no_hp: no_telp.text,
                                    periode: widget.periode,
                                    ref1: widget.ref1,
                                    ref2: widget.ref2,
                                    total_payment: widget.total_payment,
                                    admin: widget.admin,
                                  ));
                                }
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          primary: no_telp.text.length >= 7
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
        )));
  }
}
