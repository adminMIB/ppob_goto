import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/modules/pin/views/pin_view.dart';
import 'package:sizer/sizer.dart';

class BottmsheetEmoneyView extends StatefulWidget {
  String? idpel;
  String? namaPelanggan;
  String? admin;
  String? tanggal;
  String? nominal;
  String? total_bayar;
  String? ref1;
  String? ref2;
  BottmsheetEmoneyView({
    super.key,
    this.idpel,
    this.namaPelanggan,
    this.admin,
    this.tanggal,
    this.nominal,
    this.total_bayar,
    this.ref1,
    this.ref2,
  });

  @override
  State<BottmsheetEmoneyView> createState() => _BottmsheetEmoneyViewState();
}

class _BottmsheetEmoneyViewState extends State<BottmsheetEmoneyView> {
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
                        _buildInvoiceField("ID Pelanggan", widget.idpel!),
                        _buildInvoiceField("Nama Pelanggan", widget.namaPelanggan!),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Divider(
                          color: Colors.grey.shade500,
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        _buildInvoiceField(
                          "Harga",
                          NumberFormat.currency(
                            locale: 'id-ID',
                            symbol: 'Rp.',
                            decimalDigits: 0,
                          ).format(int.parse(widget.nominal!)),
                        ),
                        _buildInvoiceField(
                          "Biaya Admin",
                          NumberFormat.currency(
                            locale: 'id-ID',
                            symbol: 'Rp.',
                            decimalDigits: 0,
                          ).format(int.parse(widget.ref2!)),
                        ),
                        _buildInvoiceField(
                            "Total Pembayaran",
                            NumberFormat.currency(
                              locale: 'id-ID',
                              symbol: 'Rp.',
                              decimalDigits: 0,
                            ).format(int.parse(widget.total_bayar!)),
                            isBoldLabel: true,
                            isBoldValue: true),
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
                          Get.to(
                            PinView(
                              tipeTransaksi: 'emoney',
                              idpel: widget.idpel,
                              ref1: widget.ref1,
                              ref2: widget.ref2,
                              amount: widget.nominal,
                              admin: widget.admin,
                              total_payment: widget.total_bayar,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor,
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

  Widget _buildInvoiceField(String label, String value, {bool isBoldLabel = false, bool isBoldValue = false}) {
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
                fontSize: 12.0.sp,
                fontWeight: isBoldLabel ? FontWeight.bold : FontWeight.w400,
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
              value,
              style: TextStyle(
                fontSize: 12.0.sp,
                fontWeight: isBoldLabel ? FontWeight.bold : FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
