import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:sizer/sizer.dart';

class gagalpopup extends StatefulWidget {
  const gagalpopup({Key? key}) : super(key: key);

  @override
  State<gagalpopup> createState() => _gagalpopupState();
}

class _gagalpopupState extends State<gagalpopup> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 4.5.h, vertical: 30.0.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: 3.0.h,
                ),
                Container(
                  height: 18.0.w,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage(
                        'assets/images/tetot.png',
                      ),
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
                    'Maaf transaksi tidak dapat dilakukan, silakan coba beberapa saat kemudian',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: blackColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 2.0.h,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Get.to(LoginView());
                    },
                    style: ElevatedButton.styleFrom(
                        primary: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        fixedSize: Size(15.0.h, 5.0.h)),
                    child: Text(
                      'OK',
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
