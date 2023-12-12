import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/modules/pulsa/controllers/pulsa_controller.dart';
import 'package:ppob_mpay1/app/modules/pulsa/invoice.dart';
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
  const PinView({
    Key? key,
    this.productName,
    this.nomorTelepon,
    this.productCode,
    this.harga,
  }) : super(key: key);

  @override
  _PinViewState createState() => _PinViewState();
}

class _PinViewState extends State<PinView> {
  final pulsaController = Get.put(PulsaController());
  String currentText = "";
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  FocusNode pinFocusNode = FocusNode();

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

                      await pulsaController.transaksipulsa(
                        v,
                        widget.nomorTelepon,
                        widget.productCode,
                        widget.harga,
                        widget.productName,
                        context,
                      );
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
