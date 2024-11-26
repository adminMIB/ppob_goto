import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pdam/views/transaksiGoto_sukses.dart';
import 'package:sizer/sizer.dart';

import '../../../../data/colors.dart';
import '../../../transferbank/controllers/transferbank_controller.dart';

class BottomGotoView extends StatefulWidget {
  final String? screen;
  final String? idpel;
  final String? retrievalReferenceNumber;
  final String? transactionDateTime;
  final String? amount;
  final String? productcode;
  final String? productname;
  BottomGotoView({
    super.key,
    this.screen,
    this.idpel,
    this.retrievalReferenceNumber,
    this.transactionDateTime,
    this.amount,
    this.productcode,
    this.productname,
  });

  @override
  State<BottomGotoView> createState() => _BottomGotoViewState();
}

class _BottomGotoViewState extends State<BottomGotoView> {
  final detailgoto = Get.put(TransferbankController());

  late Map<String, String> screenData;

  @override
  void initState() {
    super.initState();
    // Parsing data screen menjadi Map
    screenData = _parseScreenData(widget.screen ?? '');
  }

  Map<String, String> _parseScreenData(String screen) {
    Map<String, String> parsedData = {};
    List<String> items = screen.split('|');

    for (var item in items) {
      var parts = item.split(':');
      if (parts.length > 1) {
        parsedData[parts[0].trim()] = parts[1].trim();
      }
    }
    return parsedData;
  }

  @override
  Widget build(BuildContext context) {
    final heightFactor = MediaQuery.of(context).size.height > 700 ? 0.7 : 0.9;

    return FractionallySizedBox(
      heightFactor: heightFactor,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 1.5.h, left: 1.5.h, right: 2.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Konfirmasi Pembayaran',
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 14.0.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.close,
                      color: blackColor,
                      size: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.5.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Apa anda yakin ingin melanjutkan\ntransaksi ini?',
                          style: TextStyle(
                            fontSize: 12.0.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 1.0.h),
                      Divider(color: Colors.grey.shade500),
                      SizedBox(height: 1.0.h),
                      // Tampilkan data screen yang sudah di-parse
                      ...screenData.entries.map((entry) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 0.5.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 35.5.w,
                                  child: Text(
                                    entry.key,
                                    style: TextStyle(
                                      fontSize: 12.0.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 1.5.w),
                                Text(
                                  ":",
                                  style: TextStyle(
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(width: 4.0.w),
                                Expanded(
                                  child: Text(
                                    entry.value,
                                    style: TextStyle(
                                      fontSize: 12.0.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Divider(color: Colors.grey.shade500),
                      SizedBox(height: 1.0.h),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Harga jual akan tampil pada struk bukti pembelian',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 8.0.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.0.h),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      // Get.to(GotoSuksesView());
                      await detailgoto.paymentgoto(
                        context,
                        widget.idpel,
                        widget.retrievalReferenceNumber,
                        widget.transactionDateTime,
                        widget.amount,
                        widget.productcode,
                        widget.productname,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Konfirmasi',
                      style: TextStyle(
                        fontSize: 14.0.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
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
