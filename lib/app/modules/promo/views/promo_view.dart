import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/data/popup/views/loadingcustom.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

import '../controllers/promo_controller.dart';

class PromoView extends StatefulWidget {
  const PromoView({super.key});

  @override
  State<PromoView> createState() => _PromoViewState();
}

class _PromoViewState extends State<PromoView> {
  final isLoading = false.obs;
  var pref = GetStorage();
  String? greeting;

  void initState() {
    super.initState();

    initGreeting();
  }

  void initGreeting() async {
    int time = DateTime.now().hour;
    if (time >= 0 && time <= 10) {
      greeting = 'Pagi,';
    } else if (time >= 10 && time <= 15) {
      greeting = 'Siang,';
    } else if (time >= 14 && time <= 18) {
      greeting = 'Sore,';
    } else {
      greeting = 'Malam,';
    }

    print('time : $time');
    print('Selamat $greeting');
  }

  String getInitials(String userNamalengkap) => userNamalengkap.isNotEmpty
      ? userNamalengkap.trim().split(' ').map((l) => l[0]).take(2).join()
      : '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          Obx(
            () => isLoading.value
                ? LoadingCustomWidget() // Show custom loading widget if isLoading is true
                : SizedBox.shrink(),
          ),
          SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      height: 9.h,
                      color: mainColor,
                      child: Padding(
                        padding: EdgeInsets.all(2.0.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: greyishColor,
                                  child: Text(
                                    getInitials(
                                      pref.read('nama_lengkap'),
                                    ).toUpperCase(),
                                    style: TextStyle(
                                      color: secondColor,
                                      fontSize: 15.0.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 2.0.h,
                                ),
                                Container(
                                  // color: blackColor,
                                  width: 63.w,
                                  height: 7.h,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Selamat ${greeting} ${pref.read('nama_lengkap').substring(0, 1).toUpperCase()}${pref.read('nama_lengkap').substring(1)}',
                                            style: TextStyle(
                                              color: whiteColor,
                                              fontSize: 11.0.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 0.5.h,
                                      ),
                                      Text(
                                        '${pref.read('nomer_tlp')}',
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontSize: 8.0.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              // color: blackColor,
                              child: Image.asset(
                                'assets/images/Notif.png',
                                height: 3.0.h,
                                width: 3.0.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.0.h,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
