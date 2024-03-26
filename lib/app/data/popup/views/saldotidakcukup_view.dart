import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/main_page.dart';
import 'package:ppob_mpay1/app/modules/saldo/views/saldo_view.dart';
import 'package:sizer/sizer.dart';

class Saldotidakcukup extends StatefulWidget {
  String? pesan;
  Saldotidakcukup({Key? key, this.pesan}) : super(key: key);

  @override
  State<Saldotidakcukup> createState() => _SaldotidakcukupState();
}

class _SaldotidakcukupState extends State<Saldotidakcukup> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 30.0.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 3.h),
        child: Column(
          children: [
            Image.asset(
              'assets/images/tetot.png',
              height: 10.0.h,
              alignment: Alignment.center,
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Text(
              widget.pesan!,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: blackColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                    primary: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    fixedSize: Size(15.0.h, 3.0.h)),
                child: Text(
                  'Tutup',
                  style: TextStyle(
                    fontSize: 10.0.sp,
                  ),
                ),
              ),
              SizedBox(
                width: 5.0.w,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(SaldoView());
                },
                style: ElevatedButton.styleFrom(
                    primary: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    fixedSize: Size(15.0.h, 3.0.h)),
                child: Text(
                  'Top Up',
                  style: TextStyle(
                    fontSize: 10.0.sp,
                  ),
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}
