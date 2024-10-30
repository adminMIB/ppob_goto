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

class transaksigagalView extends StatefulWidget {
  final String? productCode;
  final String? productName;
  final String? tglwaktu;
  final String? idpel;
  final String? harga;
  final String? admin;
  final String? total_payment;
  final String? deskripsi;
  final String? jumlah_bulan;
  final String? stan_awal;
  final String? stan_akhir;
  final String? nama_pelanggan;

  final String? periode;
  final String? noref;

  final String? statusgagal;
  const transaksigagalView({
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
    this.total_payment,
    this.admin,
    this.noref,
    this.tglwaktu,
    this.statusgagal,
  });

  @override
  State<transaksigagalView> createState() => _transaksigagalViewState();
}

class _transaksigagalViewState extends State<transaksigagalView> {
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
                        child: Column(
                          children: [
                            Container(
                              height: Get.height * 0.90,
                              color: blackColor,
                              width: Get.width,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 2.0.h, right: 2.0.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 5.0.h,
                                        ),
                                        Stack(
                                          children: [
                                            Container(
                                              height: 60.0.h,
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
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors.red,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                          SizedBox(
                                                            height: 2.0.h,
                                                          ),
                                                          Text(
                                                            'Pembayaran PDAM',
                                                            style: TextStyle(
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color:
                                                                    mainColor),
                                                          ),
                                                          SizedBox(
                                                            height: 1.h,
                                                          ),
                                                          Text(
                                                            'ID Pelanggan :' +
                                                                ' ' +
                                                                (widget.idpel!),
                                                            style: TextStyle(
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color:
                                                                    mainColor),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 1.h,
                                                    ),
                                                    Divider(
                                                      color:
                                                          Colors.grey.shade400,
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
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Tanggal dan Waktu',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      11.0.sp,
                                                                  // color: Colors.grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                              Text(
                                                                widget
                                                                    .tglwaktu!,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      11.0.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
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
                                                                'Periode',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      11.0.sp,
                                                                  // color: Colors.grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                              Text(
                                                                widget.periode!,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      11.0.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
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
                                                                'Tagihan',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      11.0.sp,
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
                                                                      .format(int.parse(
                                                                          widget
                                                                              .harga!)),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11.0
                                                                              .sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400)),
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
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      11.0.sp,
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
                                                                      .format(int.parse(
                                                                          widget
                                                                              .admin!)),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11.0
                                                                              .sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400)),
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
                                                                'Total Tagihan',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      16.0.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
                                                              ),
                                                              Text(
                                                                  NumberFormat.currency(
                                                                          locale:
                                                                              'id-ID',
                                                                          symbol:
                                                                              'Rp ',
                                                                          decimalDigits:
                                                                              0)
                                                                      .format(int.parse(
                                                                          widget
                                                                              .total_payment!)),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16.0
                                                                              .sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
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
                                                            // height: 8.0.h,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .red, // Outline color
                                                                width:
                                                                    2.0, // Outline width
                                                              ),
                                                              color: Colors.red
                                                                  .withOpacity(
                                                                      0.2),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(1.0
                                                                          .h),
                                                              child: Row(
                                                                children: [
                                                                  Image.asset(
                                                                      'assets/images/failed.png'),
                                                                  SizedBox(
                                                                    width:
                                                                        2.0.w,
                                                                  ),
                                                                  Container(
                                                                    width: 60.w,
                                                                    child: Text(
                                                                      // widget.error!,
                                                                      'Transaksi' +
                                                                          ' ' +
                                                                          (widget
                                                                              .statusgagal!),
                                                                      style: TextStyle(
                                                                          fontSize: 11
                                                                              .sp,
                                                                          color: Colors
                                                                              .red,
                                                                          fontWeight:
                                                                              FontWeight.w400),
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
                            SizedBox(
                              height: 3.0.h,
                            )
                          ],
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
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
