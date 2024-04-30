import 'dart:typed_data';

import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/main_page.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sizer/sizer.dart';

class PrabayarTransaksiGagalView extends StatefulWidget {
  String? idpel;
  String? namaPelanggan;
  String? waktu;
  String? nominal;
  String? tarif;
  String? daya;
  String? kwh;
  String? token;
  String? admin;
  String? ref;
  String? total;
  String? ket;

  PrabayarTransaksiGagalView({
    super.key,
    this.idpel,
    this.namaPelanggan,
    this.waktu,
    this.nominal,
    this.tarif,
    this.daya,
    this.kwh,
    this.token,
    this.admin,
    this.ref,
    this.total,
    this.ket,
  });

  @override
  State<PrabayarTransaksiGagalView> createState() =>
      _PrabayarTransaksiGagalViewState();
}

class _PrabayarTransaksiGagalViewState
    extends State<PrabayarTransaksiGagalView> {
  Uint8List? _imageFile;
  ScreenshotController screenshotController2 = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          // controller.restart();
        },
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            backgroundColor: whiteColor,
            body: SafeArea(
              child: ListView(
                children: [
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 1.0.h,
                          left: 2.0.h,
                          right: 2.0.h,
                        ),
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
                          // height: Get.height,
                          color: whiteColor,
                          width: Get.width,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 2.0.h,
                                  right: 2.0.h,
                                  bottom: 5.0.h,
                                ),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 5.0.h,
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          // height: 65.0.h,
                                          padding: EdgeInsets.only(
                                            bottom: 2.0.h,
                                          ),
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                            color: biru,
                                            borderRadius:
                                                BorderRadius.circular(3.h),
                                            border: Border.all(
                                              color: Color(0xFF005B96)
                                                  .withOpacity(0.2),
                                              width: 2.0,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade300
                                                    .withOpacity(0.5),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0, 1),
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 2.0.h,
                                              vertical: 2.0.h,
                                            ),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 3.0.h,
                                                ),
                                                Center(
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        'Transaksi Gagal',
                                                        style: TextStyle(
                                                          fontSize: 14.0.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.red,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      SizedBox(
                                                        height: 2.0.h,
                                                      ),
                                                      Text(
                                                        'Token Listrik',
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: mainColor),
                                                      ),
                                                      SizedBox(
                                                        height: 1.h,
                                                      ),
                                                      Text(
                                                        'ID Pelanggan : ${widget.idpel!}',
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: mainColor),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Divider(
                                                  color: Colors.grey.shade400,
                                                  thickness: 1.2,
                                                ),
                                                SizedBox(
                                                  height: 1.0.h,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 1.0.h,
                                                      right: 1.0.h),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        // crossAxisAlignment:
                                                        //     CrossAxisAlignment
                                                        //         .start,
                                                        children: [
                                                          Text(
                                                            'Tanggal dan Waktu',
                                                            style: TextStyle(
                                                              fontSize: 11.0.sp,
                                                              // color: Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                          Text(
                                                            widget.waktu!,
                                                            style: TextStyle(
                                                              fontSize: 11.0.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                            textAlign:
                                                                TextAlign.right,
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1.0.h,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'No Refrensi',
                                                            style: TextStyle(
                                                              fontSize: 11.0.sp,
                                                              // color: Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                          widget.ref != ''
                                                              ? Text(
                                                                  widget.ref!,
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        11.0.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                )
                                                              : Text(
                                                                  '-',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        11.0.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1.0.h,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        // crossAxisAlignment:
                                                        //     CrossAxisAlignment
                                                        //         .start,
                                                        children: [
                                                          Text(
                                                            'Nama Pelanggan',
                                                            style: TextStyle(
                                                              fontSize: 11.0.sp,
                                                              // color: Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 40.5.w,
                                                            // color: Colors.amber,
                                                            child: FittedBox(
                                                              fit: BoxFit
                                                                  .scaleDown,
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              child: Text(
                                                                widget
                                                                    .namaPelanggan!,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      11.0.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1.0.h,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Tarif/Daya',
                                                            style: TextStyle(
                                                              fontSize: 11.0.sp,
                                                              // color: Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                          widget.tarif != '' ||
                                                                  widget.daya !=
                                                                      ''
                                                              ? Text(
                                                                  '${widget.tarif!} / ${widget.daya}',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        11.0.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                )
                                                              : Text(
                                                                  '-',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        11.0.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1.0.h,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Jumlah kwh',
                                                            style: TextStyle(
                                                              fontSize: 11.0.sp,
                                                              // color: Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                          widget.kwh != ''
                                                              ? Text(
                                                                  widget.kwh!,
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        11.0.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                )
                                                              : Text(
                                                                  '-',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        11.0.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1.0.h,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Token',
                                                            style: TextStyle(
                                                              fontSize: 11.0.sp,
                                                              // color: Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                          widget.token != ''
                                                              ? Text(
                                                                  widget.token!,
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        11.0.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                )
                                                              : Text(
                                                                  '-',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        11.0.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1.0.h,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Nominal',
                                                            style: TextStyle(
                                                              fontSize: 11.0.sp,
                                                              // color: Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                          Text(
                                                            NumberFormat.currency(
                                                                    locale:
                                                                        'id-ID',
                                                                    symbol:
                                                                        'Rp ',
                                                                    decimalDigits:
                                                                        0)
                                                                .format(int
                                                                    .parse(widget
                                                                        .nominal!)),
                                                            style: TextStyle(
                                                              fontSize: 11.0.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1.0.h,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Biaya Admin',
                                                            style: TextStyle(
                                                              fontSize: 11.0.sp,
                                                              // color: Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                          Text(
                                                            NumberFormat.currency(
                                                                    locale:
                                                                        'id-ID',
                                                                    symbol:
                                                                        'Rp ',
                                                                    decimalDigits:
                                                                        0)
                                                                .format(int
                                                                    .parse(widget
                                                                        .admin!)),
                                                            style: TextStyle(
                                                              fontSize: 11.0.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1.0.h,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Total Bayar',
                                                            style: TextStyle(
                                                              fontSize: 16.0.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                            textAlign:
                                                                TextAlign.right,
                                                          ),
                                                          Text(
                                                            NumberFormat.currency(
                                                                    locale:
                                                                        'id-ID',
                                                                    symbol:
                                                                        'Rp ',
                                                                    decimalDigits:
                                                                        0)
                                                                .format(int
                                                                    .parse(widget
                                                                        .total!)),
                                                            style: TextStyle(
                                                                fontSize:
                                                                    16.0.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1.h,
                                                      ),
                                                      Divider(
                                                        color: Colors
                                                            .grey.shade400,
                                                        thickness: 1.2,
                                                      ),
                                                      SizedBox(
                                                        height: 2.0.h,
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          border: Border.all(
                                                            color: Colors
                                                                .red, // Outline color
                                                            width:
                                                                2.0, // Outline width
                                                          ),
                                                          color: Colors.red
                                                              .withOpacity(0.2),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  1.0.h),
                                                          child: Row(
                                                            children: [
                                                              Image.asset(
                                                                'assets/images/failed.png',
                                                                height: 4.h,
                                                              ),
                                                              SizedBox(
                                                                width: 2.0.w,
                                                              ),
                                                              Container(
                                                                width: 50.0.w,
                                                                child: Text(
                                                                  // widget.error!,
                                                                  widget.ket!,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11.sp,
                                                                      color: Colors
                                                                          .red,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: Get.width * 0.45 - 25.0,
                                          top: 0.0,
                                          child: FractionalTranslation(
                                            translation: Offset(0.0, -0.5),
                                            child: Container(
                                              height: 60.h,
                                              width: 60.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: whiteColor,
                                              ),
                                              child: Image.asset(
                                                'assets/images/failed.png',
                                                height: 3.5.h,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 3.0.h,
                          right: 3.0.h,
                          // top: 2.0.h,
                          bottom: 3.0.h,
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
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
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
                                    print(
                                        'Error capturing screenshot: $onError');
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: mainColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
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
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
