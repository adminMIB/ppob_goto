import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/modules/pin/views/confirmPin_view.dart';
import 'package:sizer/sizer.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class SetPinView extends StatefulWidget {
  final String? nama_lengkap;
  final String? username;
  final String? email;
  final String? password;
  final String? confirm_password;
  final String? nomer_tlp;
  final String? alamat;
  final XFile? foto_ktp;
  final String? nama_kerabat;
  final String? nomer_tlp_kerabat;
  final String? alamat_kerabat;
  final String? status_kerabat;
  final String? nik;
  final String? foto_profile;
  final String? namaMerchant;
  final String? pin;
  // final String? newPin;

  const SetPinView(
      {Key? key,
      this.nama_lengkap,
      this.username,
      this.email,
      this.password,
      this.confirm_password,
      this.nomer_tlp,
      this.alamat,
      this.foto_ktp,
      this.nama_kerabat,
      this.nomer_tlp_kerabat,
      this.status_kerabat,
      this.alamat_kerabat,
      this.nik,
      this.foto_profile,
      this.namaMerchant,
      this.pin
      // this.newPin,
      })
      : super(key: key);

  @override
  _SetPinViewState createState() => _SetPinViewState();
}

class _SetPinViewState extends State<SetPinView> {
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // Perbaiki penulisan initState
    super.initState();
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
  }

  _onKeyboardTap(String value) {
    setState(() {
      textEditingController.text = textEditingController.text + value;
    });
  }

  @override
  void dispose() {
    errorController?.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 10, 24, 20),
              ),
              SizedBox(
                height: 4.0.h,
              ),
              Column(
                children: [
                  Text(
                    'Masukkan PIN baru',
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0.h,
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
                      width: 24.0,
                      height: 24.0,
                      decoration: BoxDecoration(
                        color: mainColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.circle,
                      borderRadius: BorderRadius.circular(12.0),
                      fieldHeight: 24.0,
                      fieldWidth: 24.0,
                      disabledColor: mainColor,
                      inactiveColor: mainColor,
                      selectedFillColor: mainColor,
                      activeColor: mainColor,
                      activeFillColor: mainColor,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    errorAnimationController: errorController,
                    controller: textEditingController,
                    // autoDismissKeyboard: true,

                    onCompleted: (pin) async {
                      print('Completed');
                      textEditingController.clear();
                      Get.to(ConfirmPinView(
                        namaMerchant: widget.namaMerchant,
                        nama_lengkap: widget.nama_lengkap,
                        nik: widget.nik,
                        alamat: widget.alamat,
                        email: widget.email,
                        nomer_tlp: widget.nomer_tlp,
                        nama_kerabat: widget.nama_kerabat,
                        nomer_tlp_kerabat: widget.nomer_tlp_kerabat,
                        alamat_kerabat: widget.alamat_kerabat,
                        status_kerabat: widget.status_kerabat,
                        foto_ktp: widget.foto_ktp,
                        username: widget.username,
                        password: widget.password,
                        confirm_password: widget.confirm_password,
                        // newPin: v,
                        pin: pin,
                      ));
                    },
                    onChanged: (value) {
                      setState(() {
                        currentText = value;
                      });
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
