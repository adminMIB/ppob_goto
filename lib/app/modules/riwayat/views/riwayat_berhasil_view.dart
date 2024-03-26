import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/modules/riwayat/controllers/riwayat_controller.dart';
import 'package:ppob_mpay1/app/data/popup/views/loadingcustom.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class RiwayatBerhasilView extends StatefulWidget {
  const RiwayatBerhasilView({
    Key? key,
  }) : super(key: key);

  @override
  State<RiwayatBerhasilView> createState() => _RiwayatBerhasilViewState();
}

class _RiwayatBerhasilViewState extends State<RiwayatBerhasilView> {
  final isLoading = false.obs;
  final riwayatController = Get.put(RiwayatController());

  String formatCreatedAt(String createdAt) {
    DateTime parsedDate = DateTime.parse(createdAt);
    String formattedDate =
        DateFormat('dd MMMM yyyy, HH:mm:ss', 'id_ID').format(parsedDate);

    return formattedDate + ' WIB';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          Obx(
            () => isLoading.value
                ? LoadingCustomWidget() //
                : SizedBox.shrink(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.0.h),
            child: ListView(
              children: [
                Column(
                  children: [
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                            riwayatController.riwayatBerhasil.map((history) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 2.5.h),
                            child: Container(
                              width: Get.width,
                              // height: 14.h,
                              decoration: BoxDecoration(
                                color: mainContainer,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: mainColor,
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(2.0.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 42.0.w,
                                          // color: Color(0xFFBC3434),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                history['product_name'],
                                                style: TextStyle(
                                                  color: mainColor,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 1.0.h,
                                              ),
                                              Text(
                                                'No Reff : ${history['ref2']}',
                                                style: TextStyle(
                                                  color: slateTextColor,
                                                  fontSize: 9.sp,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 1.0.h,
                                              ),
                                              Text(
                                                formatCreatedAt(
                                                    history['created_at']),
                                                style: TextStyle(
                                                  color: slateTextColor,
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 1.0.h,
                                        ),
                                        Container(
                                          width: 35.5.w,
                                          // color: blackColor,
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                              'Rp. ' +
                                                  NumberFormat.currency(
                                                    locale: 'id-ID',
                                                    symbol: '',
                                                    decimalDigits: 0,
                                                  ).format(double.parse(
                                                      '${history['amount']}')),
                                              style: TextStyle(
                                                color: fourthColor,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.0.h,
                                    ),
                                    Container(
                                      width: 73.0.w,
                                      // color: greyColor,
                                      child: Text(
                                        history['description'],
                                        style: TextStyle(
                                          color: CharcoalTextColor,
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
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
