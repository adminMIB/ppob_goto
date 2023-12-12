import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:sizer/sizer.dart';

class Saldotidakcukup extends StatefulWidget {
  const Saldotidakcukup({Key? key}) : super(key: key);

  @override
  State<Saldotidakcukup> createState() => _SaldotidakcukupState();
}

class _SaldotidakcukupState extends State<Saldotidakcukup> {
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
                // SizedBox(
                //   height: 2.0.h,
                // ),
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
                    'Saldo Anda Tidak Mencukupi Untuk Melanjutkan Transaksi, Silahkan Melakukan Top Up Saldo',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: blackColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 2.0.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
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
                        'Tutup',
                        style: TextStyle(
                          fontSize: 13.0.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.0.w,
                    ),
                    ElevatedButton(
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
                        'Top Up',
                        style: TextStyle(
                          fontSize: 13.0.sp,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
