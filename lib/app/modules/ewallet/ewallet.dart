import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ppob_mpay1/app/modules/ewallet/brizzi/views/brizzi_view.dart';
import 'package:ppob_mpay1/app/modules/ewallet/dana/views/dana_view.dart';
import 'package:ppob_mpay1/app/modules/ewallet/emoney/views/emoney_view.dart';
import 'package:ppob_mpay1/app/modules/ewallet/gopay/views/customergopay_view.dart';
import 'package:ppob_mpay1/app/modules/ewallet/gopay/views/drivergopay_view.dart';
import 'package:ppob_mpay1/app/modules/ewallet/ovo/views/ovo_view.dart';
import 'package:ppob_mpay1/app/modules/home/views/old_home_view.dart';
import 'package:sizer/sizer.dart';
import 'package:ppob_mpay1/app/data/card.dart';

class EwalletView extends StatefulWidget {
  const EwalletView({super.key});

  @override
  State<EwalletView> createState() => _EwalletViewState();
}

class _EwalletViewState extends State<EwalletView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Uang Elektronik',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.0.sp,
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(2.0.h, 3.0.h, 2.0.h, 0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CardMenu(
                    image: 'assets/images/ovooo.png',
                    title: 'OVO',
                    onTap: () {
                      Get.to(OvoView());
                    },
                  ),
                  CardMenu(
                    image: 'assets/images/gopay.png',
                    title: 'Gopay\nCustomer',
                    onTap: () {
                      Get.to(GopayView());
                    },
                  ),
                  CardMenu(
                    image: 'assets/images/gopay.png',
                    title: 'Gopay\nDriver',
                    onTap: () {
                      Get.to(DriverGopayView());
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 5.0.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CardMenu(
                    image: 'assets/images/dana1.png',
                    title: 'Dana',
                    onTap: () {
                      Get.to(DanaView());
                    },
                  ),
                  CardMenu(
                    image: 'assets/images/emoney1.png',
                    title: 'e-Money\nMandiri',
                    onTap: () {
                      Get.to(EmoneyView());
                    },
                  ),
                  CardMenu(
                    image: 'assets/images/brizzii.png',
                    title: 'Brizzi',
                    onTap: () {
                      Get.to(OldHomeView());
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
