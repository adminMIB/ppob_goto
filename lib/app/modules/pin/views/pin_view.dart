import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/modules/tagihan/bpjs/controllers/bpjs_controller.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pulsa/controllers/pulsa_controller.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pdam/controllers/pdam_controller.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pln/controllers/pln_controller.dart';
import 'package:ppob_mpay1/main.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class PinView extends StatefulWidget {
  final String? productName;
  final String? nomorTelepon;
  final String? productCode;
  final String? harga;
  final String? type;
  final String? provider;
  final String? idpel;
  final String? idpel2;
  final String? ref1;
  final String? ref2;
  final String? admin;
  final String? total_payment;
  final String? periode;
  final String? tipeTransaksi;
  final String? amount;
  final String? no_hp;
  const PinView({
    Key? key,
    this.productName,
    this.nomorTelepon,
    this.productCode,
    this.harga,
    this.type,
    this.provider,
    this.idpel,
    this.idpel2,
    this.ref1,
    this.ref2,
    this.admin,
    this.total_payment,
    this.periode,
    this.tipeTransaksi,
    this.amount,
    this.no_hp,
  }) : super(key: key);

  @override
  _PinViewState createState() => _PinViewState();
}

class _PinViewState extends State<PinView> {
  String currentText = "";
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  FocusNode pinFocusNode = FocusNode();

  final pulsaController = Get.put(PulsaController());
  final pdamController = Get.put(PdamController());
  final plnController = Get.put(PlnController());
  final plnprabayarController = Get.put(PlnController());
  final bpjskesehatanController = Get.put(BpjsController());

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  _onKeyboardTap(String value) {
    setState(() {
      textEditingController.text = textEditingController.text + value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      key: scaffoldKey,
      appBar: AppBar(
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 2.0.h, right: 2.0.h),
              ),
              SizedBox(
                height: 4.0.h,
              ),
              Column(
                children: [
                  Text(
                    'Masukkan PIN',
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  Text(
                    'Gunakan PIN Anda',
                    style: TextStyle(
                      color: Color(0xFF434855),
                      fontSize: 12.0.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 2.5.h,
              ),
              Form(
                key: formKey,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 75),
                  child: PinCodeTextField(
                    backgroundColor: Colors.transparent,
                    appContext: context,
                    length: 6,
                    obscureText: true,
                    obscuringWidget: Container(
                      width: 24.5,
                      height: 24.5,
                      decoration: BoxDecoration(
                        color: mainColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.circle,
                      borderRadius: BorderRadius.circular(12.0),
                      fieldHeight: 24.5,
                      fieldWidth: 24.5,
                      disabledColor: mainColor,
                      inactiveColor: mainColor,
                      selectedFillColor: mainColor,
                      activeColor: mainColor,
                      activeFillColor: mainColor,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    errorAnimationController: errorController,
                    controller: textEditingController,
                    autoDismissKeyboard: true,
                    keyboardType: TextInputType.none,
                    focusNode: pinFocusNode,
                    onCompleted: (v) async {
                      controller.restart();
                      print("Completed");
                      // print(widget.tipeTransaksi == 'pulsaDANpaketdata');
                      print(widget.tipeTransaksi);
                      if (widget.tipeTransaksi == 'pulsa') {
                        await pulsaController.transaksipulsa(
                          v,
                          widget.nomorTelepon,
                          widget.productCode,
                          widget.harga,
                          widget.productName,
                          widget.type,
                          widget.provider,
                          widget.tipeTransaksi,
                          context,
                        );
                      } else if (widget.tipeTransaksi == 'paket_data') {
                        await pulsaController.transaksipulsa(
                          v,
                          widget.nomorTelepon,
                          widget.productCode,
                          widget.harga,
                          widget.productName,
                          widget.type,
                          widget.provider,
                          widget.tipeTransaksi,
                          context,
                        );
                      } else if (widget.tipeTransaksi == 'pdam') {
                        await pdamController.pdampayment(
                            widget.productName,
                            widget.productCode,
                            widget.idpel,
                            widget.ref1,
                            widget.ref2,
                            widget.total_payment,
                            widget.harga,
                            widget.admin,
                            widget.periode,
                            v,
                            context);
                      } else if (widget.tipeTransaksi == 'plnpasca') {
                        await plnController.plnpascapayment(
                          widget.idpel,
                          widget.ref1,
                          widget.ref2,
                          widget.harga,
                          widget.total_payment,
                          widget.admin,
                          v,
                          context,
                        );
                      } else if (widget.tipeTransaksi == 'plnprabayar') {
                        await plnprabayarController.plnprabayarPayment(
                            widget.idpel,
                            widget.idpel2,
                            widget.ref1,
                            widget.ref2,
                            widget.amount,
                            widget.admin,
                            v,
                            context);
                      } else if (widget.tipeTransaksi == 'bpjskesehatan') {
                        await bpjskesehatanController.bpjskespayment(
                            widget.idpel,
                            widget.no_hp,
                            widget.periode,
                            widget.ref1,
                            widget.ref2,
                            widget.total_payment,
                            widget.admin,
                            v,
                            context);
                      }
                    },
                    onChanged: (value) {
                      if (value.length == 6) {
                        textEditingController.clear();
                      }
                      setState(
                        () {
                          currentText = value;
                        },
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 5.0.h,
              ),
              NumericKeyboard(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                onKeyboardTap: _onKeyboardTap,
                textColor: mainColor,
                rightButtonFn: () {
                  if (textEditingController.text.length == 6) {
                    textEditingController.clear();
                  }
                  setState(() {
                    textEditingController.text = textEditingController.text
                        .substring(0, textEditingController.text.length - 1);
                  });
                },
                rightIcon: const Icon(
                  Icons.arrow_back_outlined,
                  color: Color(0xFF396EB0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
