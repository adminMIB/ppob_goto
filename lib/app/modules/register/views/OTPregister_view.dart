import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/modules/register/controllers/register_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class OTPregisterView extends StatefulWidget {
  final String? email;
  const OTPregisterView({Key? key, this.email}) : super(key: key);

  @override
  _OTPregisterViewState createState() => _OTPregisterViewState();
}

class _OTPregisterViewState extends State<OTPregisterView> {
  final helperController = Get.put(HelperController());
  final otpController = Get.put(RegisterController());

  final CountdownController _controller = CountdownController(autoStart: true);
  Timer? countdown;
  TextEditingValue code = TextEditingValue();
  bool? isTimerResend = true;
  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Verifikasi Akun',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
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
        child: Column(
          children: [
            SizedBox(
              height: 35,
            ),
            Center(
              child: Image.asset(
                'assets/images/locktrue.png',
                height: 160.5,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Kode OTP telah kami kirimkan',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF396EB0),
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.50),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'ke F*********@gmail.com',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF396EB0),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.50),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.0.w),
              child: Container(
                height: 8.0.h,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 1.0.h),
                  child: PinFieldAutoFill(
                    onCodeChanged: (value) async {
                      if (value?.length == 6) {
                        print('masuk');
                        await otpController.verifiksiOTP(
                          value,
                          widget.email,
                          context,
                        );
                      }
                    },
                    codeLength: 6,
                    textInputAction: TextInputAction.done,
                    decoration: BoxLooseDecoration(
                      radius: Radius.circular(10.0),
                      bgColorBuilder: FixedColorBuilder(Colors.grey.shade200),
                      strokeColorBuilder:
                          FixedColorBuilder(Colors.grey.shade400),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3.0.h,
            ),
            Countdown(
              controller: _controller,
              seconds: 5,
              build: (_, double time) => Visibility(
                visible: isTimerResend!,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Mohon tunggu',
                                style: TextStyle(
                                  fontSize: 12.0.sp,
                                  color: blackColor,
                                ),
                              ),
                              TextSpan(
                                text: ' ' +
                                    time.toString().substring(
                                        0, time.toString().indexOf('.')) +
                                    ' ' +
                                    'detik',
                                style: TextStyle(
                                  fontSize: 12.0.sp,
                                ),
                              ),
                              TextSpan(
                                  text: ' ' + 'Untuk mengirim ulang',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                  ))
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              interval: const Duration(milliseconds: 10),
              onFinished: () {
                setState(() {
                  isTimerResend = false;
                });
              },
            ),
            Visibility(
              visible: isTimerResend == true ? false : true,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum menerima kode?',
                    style: TextStyle(
                      fontSize: 12.0.sp,
                      color: greyTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 2.0.w,
                  ),
                  InkWell(
                    onTap: () {
                      _controller.restart();
                      setState(() {
                        isTimerResend = true;
                      });
                    },
                    child: Text(
                      ' ' + 'Kirim ulang',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFE27C00),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
