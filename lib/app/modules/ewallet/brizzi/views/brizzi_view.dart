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
      backgroundColor: mainColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: mainColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 45.h,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      Container(
                        width: 40.w,
                        height: 10.h,
                        child: Center(
                          child: Image.asset(
                            'assets/images/emoney.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 70,
            left: 10,
            right: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/emoneyhp.png',
                    height: 40.0.h,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Tempel dan tahan kartu di belakang handphone untuk cek, update, dan top-up saldo",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12.0.sp, fontWeight: FontWeight.w400, color: whiteColor),
                  ),
                  SizedBox(
                    height: Get.height * 0.20,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Get.to(InputKartuView());
                    },
                    child: Text(
                      'Masukan nomor kartu?',
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 12.0.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
