import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/modules/login/views/login_view.dart';
import 'package:sizer/sizer.dart';

class PopupLupa extends StatefulWidget {
  const PopupLupa({Key? key}) : super(key: key);

  @override
  State<PopupLupa> createState() => _PopupLupaState();
}

class _PopupLupaState extends State<PopupLupa> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 4.5.h, vertical: 30.0.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: 2.0.h,
                ),
                Container(
                  height: 28.0.w,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage(
                        'assets/images/locktrue.png',
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.0.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 2.0.h, right: 2.0.h),
                  child: Text(
                    'Selamat, Kata Sandi Anda telah berhasil dirubah!',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: blackColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 1.0.h,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(LoginView());
                    },
                    style: ElevatedButton.styleFrom(
                        primary: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        fixedSize: Size(15.0.h, 5.0.h)),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 13.0.sp,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
