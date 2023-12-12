import 'dart:async';
import 'package:ppob_mpay1/app/modules/lupapassword/views/resetsandi_view.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:sizer/sizer.dart';

class VerifikasiOtpView extends StatefulWidget {
  const VerifikasiOtpView({Key? key}) : super(key: key);

  @override
  _VerifikasiOtpViewState createState() => _VerifikasiOtpViewState();
}

class _VerifikasiOtpViewState extends State<VerifikasiOtpView> {
  final CountdownController _controller = CountdownController(autoStart: true);
  Timer? countdown;
  TextEditingValue code = TextEditingValue();
  bool? isTimerResend = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Lupa kata sandi',
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
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 3.0.h,
              ),
              Center(
                child: Text(
                  'Kode OTP telah kami kirimkan ke',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 1.0.h,
              ),
              Text(
                'D*********@gmail.com',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 3.0.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                child: Container(
                  height: 8.0.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 4.0.w, vertical: 1.0.h),
                    child: PinFieldAutoFill(
                      onCodeChanged: (value) async {
                        if (value?.length == 6) {
                          print('masuk');
                          Get.to(ResetSandiView());
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
                      'Tidak dapat kode?',
                      style: TextStyle(
                        fontSize: 12.0.sp,
                        color: blackColor,
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
                          color: mainColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // SizedBox(height: Get.height * 0.45),
              // Center(
              //   child: SizedBox(
              //     width: 236,
              //     height: 40,
              //     child: ElevatedButton(
              //       onPressed: () async {
              //         Get.to(VerifikasiOtpView());
              //       },
              //       style: ElevatedButton.styleFrom(
              //         primary: mainColor,
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(10.0),
              //         ),
              //       ),
              //       child: Text(
              //         'Kirim',
              //         style: TextStyle(
              //           fontSize: 16,
              //           fontWeight: FontWeight.bold,
              //           color: Color(0xFFFDF8F8),
              //         ),
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ],
      ),
    );
  }
}
