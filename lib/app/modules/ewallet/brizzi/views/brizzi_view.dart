import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/modules/ewallet/brizzi/controllers/brizzi_controller.dart';
import 'package:ppob_mpay1/app/modules/ewallet/brizzi/views/brizzikartu_view.dart';
import 'package:sizer/sizer.dart';

class BrizziView extends GetView<BrizziController> {
  const BrizziView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
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
        child: Padding(
          padding: EdgeInsets.only(left: 2.0.h, right: 2.0.h),
          child: Column(
            children: [
              Text(
                'Brizzi',
                style: TextStyle(
                  fontSize: 14.0.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 1.0.h,
              ),
              Divider(
                color: Colors.grey.shade500,
                indent: 1.0.h,
                endIndent: 1.0.h,
              ),
              SizedBox(
                height: 2.0.h,
              ),
              Center(
                child: Image.asset(
                  'assets/images/Brizzi.png',
                  height: 30.0.h,
                ),
              ),
              Text(
                'Tempel dan tahan kartu di belakang handphone untuk cek, update, atau top-up saldo atau',
                style: TextStyle(
                  fontSize: 13.0.sp,
                  fontWeight: FontWeight.w400,
                  color: mainColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: Get.height * 0.35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Menempatkan row di tengah-tengah
                children: [
                  Text(
                    'Masukkan nomer kartu?',
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 13.0.sp,
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: 0.25,
                    ),
                  ),
                  SizedBox(width: 1.0.h),
                  GestureDetector(
                    onTap: () {
                      Get.to(BrizzikartuView());
                    },
                    child: Text(
                      'Top up',
                      style: TextStyle(
                        color: mainColor,
                        fontSize: 14.0.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.50,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
