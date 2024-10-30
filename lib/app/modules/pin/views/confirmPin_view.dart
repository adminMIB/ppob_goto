import 'dart:async';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/modules/register/controllers/register_controller.dart';
import 'package:sizer/sizer.dart';

class ConfirmPinView extends StatefulWidget {
  final String? nama_lengkap;
  final String? username;
  final String? email;
  final String? password;
  final String? confirm_password;
  final String? nomer_tlp;
  final String? alamat;
  final File? foto_ktp;
  final String? nama_kerabat;
  final String? nomer_tlp_kerabat;
  final String? alamat_kerabat;
  final String? status_kerabat;
  final String? nik;
  final File? foto_profile;
  final String? namaMerchant;
  // final String? newPin;
  final String? pin;
  // final String? confirm_pin;

  const ConfirmPinView({
    Key? key,
    required this.nama_lengkap,
    this.username,
    this.email,
    this.password,
    this.confirm_password,
    required this.nomer_tlp,
    required this.alamat,
    required this.foto_ktp,
    this.nama_kerabat,
    this.nomer_tlp_kerabat,
    this.status_kerabat,
    this.alamat_kerabat,
    required this.nik,
    this.foto_profile,
    required this.namaMerchant,
    // required this.newPin,
    this.pin,
    // this.confirm_pin,
  }) : super(key: key);

  @override
  _ConfirmPinViewState createState() => _ConfirmPinViewState();
}

class _ConfirmPinViewState extends State<ConfirmPinView> {
  final helperController = Get.put(HelperController());
  final pinController = Get.put(RegisterController());
  var onTapRecognizer;
  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
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
                    'Konfirmasi PIN',
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                  ),
                  //
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
                    autoDismissKeyboard: true,
                    keyboardType: TextInputType.none,
                    onCompleted: (confirm_pin) async {
                      print("Completed");
                      if (confirm_pin != widget.pin) {
                        // helperController.popUpMessage(
                        //   'Pastikan PIN anda sesuai dengan PIN sebelumnya',
                        //   context,
                        // );
                        textEditingController.clear();
                      } else {
                        print('masuk');
                        await pinController.datapersonal(
                          widget.nama_lengkap,
                          widget.username,
                          widget.email,
                          widget.password,
                          widget.confirm_password,
                          widget.nomer_tlp,
                          widget.alamat,
                          widget.foto_ktp,
                          widget.nama_kerabat,
                          widget.status_kerabat,
                          widget.foto_profile,
                          widget.namaMerchant,
                          widget.nik,
                          widget.pin,
                          confirm_pin,
                          widget.nomer_tlp_kerabat,
                          widget.alamat_kerabat,
                          context,
                        );
                      }
                    },
                    onChanged: (value) {
                      if (value.length == 6) {
                        textEditingController.clear();
                        print(value);
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
