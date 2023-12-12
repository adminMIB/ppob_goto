import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/modules/ewallet/emoney/views/emoneykartu_view.dart';
import 'package:ppob_mpay1/app/modules/ewallet/emoney/views/tapemoney_view.dart';
import 'package:sizer/sizer.dart';

import '../controllers/emoney_controller.dart';

class EmoneyView extends StatefulWidget {
  const EmoneyView({Key? key}) : super(key: key);

  @override
  _EmoneyViewState createState() => _EmoneyViewState();
}

class _EmoneyViewState extends State<EmoneyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Center(
                child: Image.asset(
                  'assets/images/emoney.png',
                  fit: BoxFit.contain,
                  height: 3.0.h,
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
                  'assets/images/emoneyhp.png',
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
                mainAxisAlignment: MainAxisAlignment.center,
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
                      Get.to(TapemoneyView());
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

              // Text(
              //   'Masukkan nomer kartu',
              //   style: TextStyle(
              //       fontSize: 12.0.sp,
              //       fontWeight: FontWeight.bold,
              //       color: mainColor),
              // ),
              // onTap: () {
              //   Get.to(EmoneykartuView());
              // },
            ],
          ),
        ),
      ),
    );
  }
}
