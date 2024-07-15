import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/modules/riwayat/controllers/riwayat_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:ppob_mpay1/app/data/popup/views/loadingcustom.dart';

class RiwayatGagalView extends StatefulWidget {
  const RiwayatGagalView({super.key});

  @override
  State<RiwayatGagalView> createState() => _RiwayatGagalViewState();
}

class _RiwayatGagalViewState extends State<RiwayatGagalView> {
  final isLoading = false.obs;
  final riwayatController = Get.put(RiwayatController());

  String formatCreatedAt(String createdAt) {
    DateTime parsedDate = DateTime.parse(createdAt);
    String formattedDate = DateFormat('dd MMMM yyyy, HH:mm:ss', 'id_ID').format(parsedDate);

    return formattedDate;
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
            padding: EdgeInsets.symmetric(horizontal: 1.0.h, vertical: 2.0.h),
            child: ListView(
              children: [
                Column(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: riwayatController.riwayatGagal.map((history) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 2.5.h),
                            child: GestureDetector(
                              onTap: () {
                                Dialogs.materialDialog(
                                  customView: Container(
                                    // color: mainColor,
                                    padding: EdgeInsets.all(2.0.h),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                history['type_transaction'],
                                                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700, color: mainColor),
                                              ),
                                            ),
                                            Positioned(
                                              right: 1.h,
                                              child: InkWell(
                                                onTap: () {
                                                  Get.back();
                                                },
                                                child: Icon(
                                                  Icons.cancel_outlined,
                                                  color: Color(0xFFE32323),
                                                  size: 3.h,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 2.0.h),
                                        _detailTransaksi("No. Ref", history['ref2']),
                                        _detailTransaksi("Nama Produk", history['type_transaction']),
                                        // _detailTransaksi("Jenis Transaksi", history['type_transaction']),
                                        _detailTransaksi("Aktivitas Transaksi", history['transaction_activities']),
                                        _detailTransaksi("Tanggal Transaksi", formatCreatedAt(history['payment_time'])),
                                        _detailTransaksi("Kode Produk", history['product_code']),
                                        _detailTransaksi(
                                            "Total Pembayaran",
                                            'Rp. ' +
                                                NumberFormat.currency(
                                                  locale: 'id-ID',
                                                  symbol: '',
                                                  decimalDigits: 0,
                                                ).format(double.parse('${history['amount']}'))),
                                        _detailTransaksi("Status", history['status']),
                                        _detailTransaksi("Deskripsi", history['description']),
                                      ],
                                    ),
                                  ),
                                  color: whiteColor,
                                  context: context,
                                );
                              },
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
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 50.0.w,
                                            // color: Color(0xFFBC3434),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  history['type_transaction'],
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
                                                  formatCreatedAt(history['payment_time']),
                                                  style: TextStyle(
                                                    color: slateTextColor,
                                                    fontSize: 7.sp,
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
                                              child: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  'Rp. ' +
                                                      NumberFormat.currency(
                                                        locale: 'id-ID',
                                                        symbol: '',
                                                        decimalDigits: 0,
                                                      ).format(double.parse('${history['amount']}')) +
                                                      ',-',
                                                  style: TextStyle(
                                                    color: thirdColor,
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w700,
                                                  ),
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

  Widget _detailTransaksi(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 35.5.w,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 10.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(width: 1.5.w),
          Text(
            ":",
            style: TextStyle(
              fontSize: 10.0.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 4.0.w),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 10.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
