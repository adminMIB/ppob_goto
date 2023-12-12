import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/modules/ewallet/emoney/views/emoneykartu_view.dart';
import 'package:ppob_mpay1/app/modules/ewallet/emoney/views/emoneynfc_view.dart';
import 'package:sizer/sizer.dart';

import '../controllers/emoney_controller.dart';

class TapemoneyView extends StatefulWidget {
  const TapemoneyView({Key? key}) : super(key: key);

  @override
  _TapemoneyViewState createState() => _TapemoneyViewState();
}

class _TapemoneyViewState extends State<TapemoneyView> {
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
              SizedBox(
                height: 2.0.h,
              ),
              Container(
                width: 313,
                height: 147,
                decoration: ShapeDecoration(
                  color: Color(0xFFF4F4F4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(2.0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'No. Kartu e-money',
                        style: TextStyle(
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 1.0.h,
                      ),
                      Text(
                        '6032 9840 8433 2281',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0.sp,
                          fontFamily: 'Saira SemiCondensed',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Saldo',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      SizedBox(
                        height: 1.0.h,
                      ),
                      Text(
                        'Rp 24.000,00',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.20,
              ),
              SizedBox(
                width: 35.0.h,
                height: 6.0.h,
                child: ElevatedButton(
                  onPressed: () async {
                    Get.to(EmoneynfcView());
                  },
                  style: ElevatedButton.styleFrom(
                    primary: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'Top-Up',
                    style: TextStyle(
                      fontSize: 14.0.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFDF8F8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
