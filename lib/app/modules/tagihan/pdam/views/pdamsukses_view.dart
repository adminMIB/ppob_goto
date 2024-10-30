import 'dart:typed_data';

import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sizer/sizer.dart';

import '../../../../data/colors.dart';
import '../../../../data/controller/helpercontroller.dart';
import '../../../../main_page.dart';

class PdamsuksesView extends StatefulWidget {
  final String? productCode;
  final String? productName;
  final String? idpel;
  final String? nama_pelanggan;
  final String? stan_awal;
  final String? stan_akhir;
  final String? jumlah_bulan;
  final String? periode;
  final String? deskripsi;
  final String? harga;
  final String? total_bayar;
  final String? admin;
  final String? noref;
  final String? tglwaktu;
  const PdamsuksesView({
    super.key,
    this.productCode,
    this.productName,
    this.idpel,
    this.nama_pelanggan,
    this.stan_awal,
    this.stan_akhir,
    this.jumlah_bulan,
    this.periode,
    this.deskripsi,
    this.harga,
    this.total_bayar,
    this.admin,
    this.noref,
    this.tglwaktu,
  });

  @override
  State<PdamsuksesView> createState() => _PdamsuksesViewState();
}

class _PdamsuksesViewState extends State<PdamsuksesView> {
  //  DateTime parsedDateTime = parseDateTime(widget.tglwaktu ?? '');
  final helperController = Get.put(HelperController());

  Uint8List? _imageFile;

  var dataSplit;
  var pref = GetStorage();

  ScreenshotController screenshotController2 = ScreenshotController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // controller.restart();
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: whiteColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                height: Get.height * 1,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 1.0.h, left: 2.0.h, right: 2.0.h),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () async {
                            Get.offAll(MainPage()
                                // ShowCaseWidget(
                                //     builder: Builder(
                                //         builder: (_) => MainPage(
                                //             //fungsi
                                //             ))),
                                );
                          },
                          child: Icon(
                            Icons.close,
                            color: greyTextColor,
                          ),
                        ),
                      ),
                    ),
                    Screenshot(
                      controller: screenshotController2,
                      child: Container(
                        height: Get.height * 0.85,
                        color: whiteColor,
                        width: Get.width,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  'assets/images/Batik.png',
                                  height: 20.0.h,
                                  width: double.infinity,
                                  fit: BoxFit.contain,
                                ),
                                // Padding(
                                //   padding: EdgeInsets.only(
                                //       top: 1.0.h,
                                //       left: 2.0.h,
                                //       right: 2.0.h),
                                //   child: Align(
                                //     alignment: Alignment.topRight,
                                //     child: GestureDetector(
                                //       onTap: () async {
                                //         controller.restart();
                                //         Get.offAll(
                                //           ShowCaseWidget(
                                //               builder: Builder(
                                //                   builder: (_) =>
                                //                       HomeView(
                                //                           //fungsi
                                //                           ))),
                                //         );
                                //       },
                                //       child: Icon(
                                //         Icons.close,
                                //         color: greyTextColor,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 1.0.h, right: 2.0.h, left: 2.0.h),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/logo1.png',
                                        height: 5.0.h,
                                      ),
                                      SizedBox(
                                        width: 5.5.h,
                                        height: 10.21,
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            'M-PAY',
                                            style: TextStyle(
                                              fontSize: 7.0.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.0.h,
                                      ),
                                      // Text(
                                      //   'Pembelian' + ' ' + widget.deskripsi!,
                                      //   style: TextStyle(
                                      //       fontSize: 14.0.sp,
                                      //       fontWeight: FontWeight.bold),
                                      //   textAlign: TextAlign.left,
                                      // ),
                                      Text(
                                        'Transaksi' +
                                            ' ' +
                                            (widget.deskripsi == 'GAGAL'
                                                ? 'Gagal'
                                                : (widget.deskripsi == 'SUKSES'
                                                    ? 'Berhasil!!'
                                                    : widget.deskripsi!)),
                                        style: TextStyle(
                                          fontSize: 14.0.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),

                                      SizedBox(
                                        height: 0.5.h,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            // '',
                                            widget.tglwaktu ?? '',
                                            style: TextStyle(
                                                fontSize: 11.0.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey.shade400),
                                          ),
                                          SizedBox(
                                            width: 0.8.h,
                                          ),
                                          // Icon(
                                          //   Icons.circle,
                                          //   size: 0.7.h,
                                          //   color: Colors.grey.shade400,
                                          // ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 2.0.h, right: 2.0.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text(
                                  //   'Informasi Pelanggan',
                                  //   style: TextStyle(
                                  //     fontSize: 13.5.sp,
                                  //     color: blackColor,
                                  //     fontWeight: FontWeight.w600,
                                  //   ),
                                  //   textAlign: TextAlign.left,
                                  // ),
                                  // SizedBox(
                                  //   height: 1.5.h,
                                  // ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'No. Ref',
                                        style: TextStyle(
                                          fontSize: 12.0.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        // 'noref',
                                        widget.noref!,
                                        style: TextStyle(
                                            fontSize: 12.0.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'ID Pelanggan',
                                        style: TextStyle(
                                          fontSize: 12.0.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Container(
                                        width: 23.0.h,
                                        // color: oceanColor,
                                        child: Text(
                                          // 'id',
                                          widget.idpel!,
                                          style: TextStyle(
                                            fontSize: 12.0.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Nama Pelanggan',
                                        style: TextStyle(
                                          fontSize: 12.0.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                          // 'nama',
                                          widget.nama_pelanggan!,
                                          style: TextStyle(
                                              fontSize: 12.0.sp,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Divider(
                                    color: Colors.grey.shade500,
                                    thickness: 1,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  // Text(
                                  //   'Detail PDAM',
                                  //   style: TextStyle(
                                  //     fontSize: 13.5.sp,
                                  //     color: blackColor,
                                  //     fontWeight: FontWeight.w600,
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   height: 1.5.h,
                                  // ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Stan Awal',
                                        style: TextStyle(
                                          fontSize: 12.0.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                          // 'Stan a',
                                          widget.stan_awal!,
                                          style: TextStyle(
                                              fontSize: 12.0.sp,
                                              fontWeight: FontWeight.w500)),
                                      // Text(
                                      //     NumberFormat.currency(
                                      //             locale: 'id-ID',
                                      //             symbol: 'Rp ',
                                      //             decimalDigits: 0)
                                      //         .format(
                                      //             int.parse(widget.harga!)),
                                      //     style: TextStyle(
                                      //         fontSize: 12.0.sp,
                                      //         fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Stan Akhir',
                                        style: TextStyle(
                                          fontSize: 12.0.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                          // 'Stan b',
                                          widget.stan_akhir!,
                                          style: TextStyle(
                                              fontSize: 12.0.sp,
                                              fontWeight: FontWeight.w500)),
                                      // Text(
                                      //     NumberFormat.currency(
                                      //             locale: 'id-ID',
                                      //             symbol: 'Rp ',
                                      //             decimalDigits: 0)
                                      //         .format(
                                      //             int.parse(widget.harga!)),
                                      //     style: TextStyle(
                                      //         fontSize: 12.0.sp,
                                      //         fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Jumlah Bulan',
                                        style: TextStyle(
                                          fontSize: 12.0.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                          // 'Jumlah',
                                          widget.jumlah_bulan!,
                                          style: TextStyle(
                                              fontSize: 12.0.sp,
                                              fontWeight: FontWeight.w500)),
                                      // Text(
                                      //     NumberFormat.currency(
                                      //             locale: 'id-ID',
                                      //             symbol: 'Rp ',
                                      //             decimalDigits: 0)
                                      //         .format(
                                      //             int.parse(widget.harga!)),
                                      //     style: TextStyle(
                                      //         fontSize: 12.0.sp,
                                      //         fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'periode',
                                        style: TextStyle(
                                          fontSize: 12.0.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Container(
                                        width: 20.h,
                                        child: Text(
                                          // 'periode \n periode \n periode\n periode\n periode\n periode',
                                          widget.periode!,
                                          style: TextStyle(
                                              fontSize: 12.0.sp,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      // Text(
                                      //     NumberFormat.currency(
                                      //             locale: 'id-ID',
                                      //             symbol: 'Rp ',
                                      //             decimalDigits: 0)
                                      //         .format(
                                      //             int.parse(widget.harga!)),
                                      //     style: TextStyle(
                                      //         fontSize: 12.0.sp,
                                      //         fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Deskripsi',
                                        style: TextStyle(
                                          fontSize: 12.0.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                          // 'deskripsi',
                                          widget.deskripsi!,
                                          style: TextStyle(
                                              fontSize: 12.0.sp,
                                              fontWeight: FontWeight.w500)),
                                      // Text(
                                      //     NumberFormat.currency(
                                      //             locale: 'id-ID',
                                      //             symbol: 'Rp ',
                                      //             decimalDigits: 0)
                                      //         .format(
                                      //             int.parse(widget.harga!)),
                                      //     style: TextStyle(
                                      //         fontSize: 12.0.sp,
                                      //         fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Divider(
                                    color: Colors.grey.shade500,
                                    thickness: 1,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  // Text(
                                  //   'Detail Pembayaran',
                                  //   style: TextStyle(
                                  //     fontSize: 13.5.sp,
                                  //     color: blackColor,
                                  //     fontWeight: FontWeight.w600,
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   height: 1.5.h,
                                  // ),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Tagihan',
                                        style: TextStyle(
                                          fontSize: 12.0.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      // Text(
                                      //     // 'Tagihan',
                                      //     widget.harga!,
                                      //     style: TextStyle(
                                      //         fontSize: 12.0.sp,
                                      //         fontWeight: FontWeight.w500)),
                                      Text(
                                          NumberFormat.currency(
                                                  locale: 'id-ID',
                                                  symbol: 'Rp ',
                                                  decimalDigits: 0)
                                              .format(int.parse(widget.harga!)),
                                          style: TextStyle(
                                              fontSize: 12.0.sp,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Biaya Admin',
                                        style: TextStyle(
                                          fontSize: 12.0.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      // Text(
                                      //     // 'biaya a',
                                      //     widget.admin!,
                                      //     style: TextStyle(
                                      //         fontSize: 12.0.sp,
                                      //         fontWeight: FontWeight.w500)),
                                      Text(
                                          NumberFormat.currency(
                                                  locale: 'id-ID',
                                                  symbol: 'Rp ',
                                                  decimalDigits: 0)
                                              .format(int.parse(widget.admin!)),
                                          style: TextStyle(
                                              fontSize: 12.0.sp,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Total Tagihan',
                                        style: TextStyle(
                                          fontSize: 12.0.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      // Text(
                                      //     // 'Total',
                                      //     widget.total_bayar!,
                                      //     style: TextStyle(
                                      //         fontSize: 12.0.sp,
                                      //         fontWeight: FontWeight.w500)),
                                      Text(
                                          NumberFormat.currency(
                                                  locale: 'id-ID',
                                                  symbol: 'Rp ',
                                                  decimalDigits: 0)
                                              .format(int.parse(
                                                  widget.total_bayar!)),
                                          style: TextStyle(
                                              fontSize: 12.0.sp,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 3.0.h,
                        right: 3.0.h,
                        top: 2.0.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 40.0.w,
                            height: 6.0.h,
                            child: ElevatedButton(
                              onPressed: () async {
                                double pixelRatio =
                                    MediaQuery.of(context).devicePixelRatio;

                                screenshotController2
                                    .capture(pixelRatio: pixelRatio)
                                    .then((Uint8List? image) async {
                                  await [Permission.storage].request();
                                  final time = DateTime.now()
                                      .toIso8601String()
                                      .replaceAll('.', '-')
                                      .replaceAll(':', '-');
                                  final nameScreenshot = 'screenshot_$time';
                                  _imageFile = image;

                                  final result =
                                      await ImageGallerySaver.saveImage(
                                          Uint8List.fromList(image!),
                                          quality: 100,
                                          name: nameScreenshot);

                                  print('result  : $result');

                                  setState(() {});
                                }).catchError((onError) {
                                  print(onError);
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: mainColor,
                                shape: RoundedRectangleBorder(),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.download_rounded,
                                      color: whiteColor),
                                  Text(
                                    ' Unduh',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 40.0.w,
                            height: 6.0.h,
                            child: ElevatedButton(
                              onPressed: () {
                                screenshotController2
                                    .capture()
                                    .then((Uint8List? image) {
                                  if (image != null) {
                                    Share.file(
                                      'MPay',
                                      'MPay_resi.jpg',
                                      image,
                                      'image/jpg',
                                    ).then((_) {
                                      setState(() {
                                        _imageFile = image;
                                      });
                                    }).catchError((onError) {
                                      print('Error sharing file: $onError');
                                    });
                                  } else {
                                    print('Captured image is null');
                                  }
                                }).catchError((onError) {
                                  print('Error capturing screenshot: $onError');
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: mainColor,
                                shape: RoundedRectangleBorder(),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.share, color: whiteColor),
                                  Text(' Bagikan'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
