import 'dart:typed_data';

import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sizer/sizer.dart';

import '../../../../../data/colors.dart';
import '../../../../../data/controller/helpercontroller.dart';
import '../../../../../main_page.dart';

class transaksisuksesplnView extends StatefulWidget {
  final String? productCode;
  final String? productName;
  final String? idpel;
  final String? nama_pelanggan;
  final String? periode;
  final String? deskripsi;
  final String? harga;
  final String? total_bayar;
  final String? admin;
  final String? noref;
  final String? tglwaktu;
  final String? error;
  final String? tarif;
  final String? daya;
  final String? info;
  const transaksisuksesplnView({
    super.key,
    this.productCode,
    this.productName,
    this.idpel,
    this.nama_pelanggan,
    this.periode,
    this.deskripsi,
    this.harga,
    this.total_bayar,
    this.admin,
    this.noref,
    this.tglwaktu,
    this.error,
    this.tarif,
    this.daya,
    this.info,
  });

  @override
  State<transaksisuksesplnView> createState() => _transaksisuksesplnViewState();
}

class _transaksisuksesplnViewState extends State<transaksisuksesplnView> {
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
                        child: Container(
                          height: Get.height * 0.75,
                          color: whiteColor,
                          width: Get.width,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 2.0.h, right: 2.0.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 5.0.h,
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          height: 70.0.h,
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
                                                        'Transaksi Berhasil',
                                                        style: TextStyle(
                                                          fontSize: 14.0.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.green,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      SizedBox(
                                                        height: 2.0.h,
                                                      ),
                                                      Text(
                                                        'Pembayaran Tagihan Listrik',
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
                                                        'ID Pelanggan :' +
                                                            ' ' +
                                                            (widget.idpel!),
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
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
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
                                                            widget.tglwaktu!,
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
                                                            // color: oceanColor,
                                                            width: 40.w,
                                                            child: Text(
                                                              widget
                                                                  .nama_pelanggan!,
                                                              style: TextStyle(
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
                                                          SizedBox(
                                                            height: 1.0.h,
                                                          ),
                                                          Text(
                                                            widget.tarif! +
                                                                '/' +
                                                                widget.daya!,
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
                                                            'Periode',
                                                            style: TextStyle(
                                                              fontSize: 11.0.sp,
                                                              // color: Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                          Text(
                                                            widget.periode!,
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
                                                            'Harga',
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
                                                                          .harga!)),
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      11.0.sp,
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
                                                                  fontSize:
                                                                      11.0.sp,
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
                                                            'Total Harga',
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
                                                                          .total_bayar!)),
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      16.0.sp,
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
                                                        height: 1.0.h,
                                                      ),
                                                      Text(
                                                        widget.info!,
                                                        style: TextStyle(
                                                          fontSize: 11.0.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 2.0.h,
                                                      ),
                                                      Container(
                                                        height: 8.0.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          border: Border.all(
                                                            color: Colors
                                                                .green, // Outline color
                                                            width:
                                                                2.0, // Outline width
                                                          ),
                                                          color: Colors.green
                                                              .withOpacity(0.2),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  1.0.h),
                                                          child: Row(
                                                            children: [
                                                              SvgPicture.asset(
                                                                'assets/images/Checkmark.svg',
                                                                height: 3.5.h,
                                                              ),
                                                              SizedBox(
                                                                width: 2.0.w,
                                                              ),
                                                              Text(
                                                                // widget.error!,
                                                                'Transaksi' +
                                                                    ' ' +
                                                                    (widget
                                                                        .deskripsi!),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        11.sp,
                                                                    color: Colors
                                                                        .green,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
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
                                              child: SvgPicture.asset(
                                                'assets/images/Checkmark.svg',
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
