import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/modules/pin/views/pin_view.dart';
import 'package:sizer/sizer.dart';

class BottmsheetPrabayarView extends StatefulWidget {
  String? idpel;
  String? idpel2;
  String? namaPelanggan;
  String? kodeproduk;
  String? tarif;
  String? daya;
  String? admin;
  String? tanggal;
  String? nominal;
  String? ref1;
  String? ref2;
  BottmsheetPrabayarView({
    super.key,
    this.idpel,
    this.idpel2,
    this.namaPelanggan,
    this.kodeproduk,
    this.tarif,
    this.daya,
    this.admin,
    this.tanggal,
    this.nominal,
    this.ref1,
    this.ref2,
  });

  @override
  State<BottmsheetPrabayarView> createState() => _BottmsheetPrabayarViewState();
}

class _BottmsheetPrabayarViewState extends State<BottmsheetPrabayarView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(2.5.h, 2.0.h, 2.5.h, 0.0.h),
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Container(
                  height: 35.0.h,
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
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Divider(
                          color: Colors.grey.shade500,
                        ),
                        SizedBox(
                          height: 1.0.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ID Pelanggan',
                                  style: TextStyle(
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  'Nama Pelanggan',
                                  style: TextStyle(
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  'Daya / Tarif',
                                  style: TextStyle(
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                // SizedBox(
                                //   height: 1.h,
                                // ),
                                // Text(
                                //   'No Referensi',
                                //   style: TextStyle(
                                //     fontSize: 12.0.sp,
                                //     fontWeight: FontWeight.w400,
                                //   ),
                                // ),
                                // SizedBox(
                                //   height: 1.h,
                                // ),
                                // Text(
                                //   'Nominal',
                                //   style: TextStyle(
                                //     fontSize: 12.0.sp,
                                //     fontWeight: FontWeight.w400,
                                //   ),
                                // ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  'Tanggal',
                                  style: TextStyle(
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ':',
                                  style: TextStyle(
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  ':',
                                  style: TextStyle(
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  ':',
                                  style: TextStyle(
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                // SizedBox(
                                //   height: 1.h,
                                // ),
                                // Text(
                                //   ':',
                                //   style: TextStyle(
                                //     fontSize: 12.0.sp,
                                //     fontWeight: FontWeight.w400,
                                //   ),
                                // ),
                                // SizedBox(
                                //   height: 1.h,
                                // ),
                                // Text(
                                //   ':',
                                //   style: TextStyle(
                                //     fontSize: 12.0.sp,
                                //     fontWeight: FontWeight.w400,
                                //   ),
                                // ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  ':',
                                  style: TextStyle(
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text(
                                //   widget.idpel!,
                                //   style: TextStyle(
                                //     fontSize: 12.0.sp,
                                //     fontWeight: FontWeight.w400,
                                //   ),
                                // ),
                                Text(
                                  widget.idpel!,
                                  style: TextStyle(
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Container(
                                  width: Get.width * 0.50,
                                  // color: Colors.amber,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      widget.namaPelanggan!,
                                      style: TextStyle(
                                        fontSize: 12.0.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  widget.daya! + '/' + widget.tarif!,
                                  style: TextStyle(
                                    fontSize: 11.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                                // SizedBox(
                                //   height: 1.h,
                                // ),
                                // Text(
                                //   'Nominal',
                                //   style: TextStyle(
                                //     fontSize: 12.0.sp,
                                //     fontWeight: FontWeight.w400,
                                //   ),
                                // ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  widget.tanggal!,
                                  style: TextStyle(
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                // Container(
                                //   width: Get.width * 0.50,
                                //   child: Text(
                                //     '',
                                //     style: TextStyle(
                                //       fontSize: 12.0.sp,
                                //       fontWeight: FontWeight.w400,
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Divider(
                          color: Colors.grey.shade500,
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nominal',
                                  style: TextStyle(
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  'Biaya Admin',
                                  style: TextStyle(
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                // SizedBox(
                                //   height: 1.h,
                                // ),
                                // Text(
                                //   'Total Tagihan',
                                //   style: TextStyle(
                                //     fontSize: 12.0.sp,
                                //     fontWeight: FontWeight.bold,
                                //   ),
                                // ),
                              ],
                            ),
                            SizedBox(
                              width: 5.0.w,
                            ),
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ':',
                                  style: TextStyle(
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  ':',
                                  style: TextStyle(
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                // SizedBox(
                                //   height: 1.h,
                                // ),
                                // Text(
                                //   ':',
                                //   style: TextStyle(
                                //     fontSize: 12.0.sp,
                                //     fontWeight: FontWeight.w400,
                                //   ),
                                // ),
                              ],
                            ),
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  NumberFormat.currency(
                                    locale: 'id-ID',
                                    symbol: 'Rp.',
                                    decimalDigits: 0,
                                  ).format(int.parse(widget.nominal!)),
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  NumberFormat.currency(
                                    locale: 'id-ID',
                                    symbol: 'Rp.',
                                    decimalDigits: 0,
                                  ).format(int.parse(widget.admin!)),
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Container(
                                  width: Get.width * 0.50,
                                  // child: Text(
                                  //   '100.000',
                                  //   style: TextStyle(
                                  //     fontSize: 12.sp,
                                  //     fontWeight: FontWeight.bold,
                                  //   ),
                                  // ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.0.h,
                        ),
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
                Container(
                  color: whiteColor,
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: SizedBox(
                      width: 35.0.h,
                      height: 6.0.h,
                      child: ElevatedButton(
                        onPressed: () async {
                          // Get.to(PdamstrukView());
                          Get.to(
                            PinView(
                              tipeTransaksi: 'plnprabayar',
                              productCode: widget.kodeproduk,
                              idpel: widget.idpel,
                              idpel2: widget.idpel2,
                              ref1: widget.ref1,
                              ref2: widget.ref2,
                              amount: widget.nominal,
                              admin: widget.admin,
                            ),
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
                            color: Color(0xFFFDF8F8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
