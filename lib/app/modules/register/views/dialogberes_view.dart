import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/modules/login/views/login_view.dart';
import 'package:ppob_mpay1/app/modules/register/controllers/register_controller.dart';
import 'package:sizer/sizer.dart';

class Dialogberes extends StatefulWidget {
  final String? newpin;
  const Dialogberes({super.key, this.newpin});

  @override
  State<Dialogberes> createState() => _DialogberesState();
}

class _DialogberesState extends State<Dialogberes> {
  final pinController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 5.0.h, vertical: 30.0.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: 3.0.h,
                ),
                Container(
                  height: 15.0.w,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage('assets/images/oke.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.0.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 2.0.h, right: 2.0.h),
                  child: Text(
                    'Selamat, Rekening Virtual Anda telah berhasil diaktifkan!',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: blackColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 5.0.h,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      Get.to(LoginView());
                    },
                    style: ElevatedButton.styleFrom(
                        primary: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        fixedSize: Size(15.0.h, 6.0.h)),
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
