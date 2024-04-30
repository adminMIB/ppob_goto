import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/modules/pin/views/pin_view.dart';
import 'package:sizer/sizer.dart';

class BottmsheetpdamView extends StatefulWidget {
  String? productName;
  String? idpel;
  String? nama_pelanggan;
  String? kodeproduk;
  String? harga;
  String? admin;
  String? periode;
  String? jumlahbulan;
  String? stan_awal;
  String? stan_akhir;
  String? total_payment;
  String? ref1;
  String? ref2;
  BottmsheetpdamView({
    super.key,
    this.productName,
    this.idpel,
    this.nama_pelanggan,
    this.kodeproduk,
    this.harga,
    this.admin,
    this.periode,
    this.jumlahbulan,
    this.stan_awal,
    this.stan_akhir,
    this.total_payment,
    this.ref1,
    this.ref2,
  });

  @override
  State<BottmsheetpdamView> createState() => _BottmsheetpdamViewState();
}

class _BottmsheetpdamViewState extends State<BottmsheetpdamView> {
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
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildInvoiceField("ID Pelanggan", widget.idpel!),
                              _buildInvoiceField(
                                  "Nama Pelanggan", widget.nama_pelanggan!),
                              _buildInvoiceField(
                                "Stan Awal",
                                (widget.stan_awal! == "0")
                                    ? widget.stan_awal!
                                    : "—",
                              ),
                              _buildInvoiceField(
                                "Stan Akhir",
                                (widget.stan_akhir! == "0")
                                    ? widget.stan_awal!
                                    : "—",
                              ),
                              _buildInvoiceField(
                                  "Jumlah Bulan", widget.jumlahbulan!),
                              _buildInvoiceField("Periode", widget.periode!),
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
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildInvoiceField(
                                "Tagihan",
                                NumberFormat.currency(
                                  locale: 'id-ID',
                                  symbol: 'Rp.',
                                  decimalDigits: 0,
                                ).format(int.parse(widget.harga!)),
                              ),
                              _buildInvoiceField(
                                "Biaya Admin",
                                NumberFormat.currency(
                                  locale: 'id-ID',
                                  symbol: 'Rp.',
                                  decimalDigits: 0,
                                ).format(int.parse(widget.admin!)),
                              ),
                              _buildInvoiceField(
                                "Total Tagihan",
                                NumberFormat.currency(
                                  locale: 'id-ID',
                                  symbol: 'Rp.',
                                  decimalDigits: 0,
                                ).format(int.parse(widget.total_payment!)),
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
                            Get.to(PinView(
                              tipeTransaksi: 'pdam',
                              productName: widget.productName,
                              productCode: widget.kodeproduk,
                              idpel: widget.idpel,
                              ref1: widget.ref1,
                              ref2: widget.ref2,
                              harga: widget.harga,
                              admin: widget.admin,
                              total_payment: widget.total_payment,
                              periode: widget.periode,
                            ));
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
        ));
  }

  Widget _buildInvoiceField(String label, String value) {
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
              value,
              style: TextStyle(
                fontSize: 12.0.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
