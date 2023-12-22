import 'dart:typed_data';

import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getwidget/getwidget.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/main_page.dart';
import 'package:ppob_mpay1/app/modules/home/views/home_view.dart';
import 'package:ppob_mpay1/main.dart';
import 'package:screenshot/screenshot.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:sizer/sizer.dart';
import 'package:screenshot/screenshot.dart';

class InvoiceView extends StatefulWidget {
  final String? productCode;
  final String? productName;
  final String? harga;
  final String? nomorTelepon;
  final String? status;
  final String? noref;
  final String? tglwaktu;
  const InvoiceView({
    super.key,
    this.productCode,
    this.productName,
    this.harga,
    this.nomorTelepon,
    this.status,
    this.noref,
    this.tglwaktu,
  });

  @override
  State<InvoiceView> createState() => _InvoiceViewState();
}

class _InvoiceViewState extends State<InvoiceView> {
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
              child: ListView(
            children: [
              SizedBox(
                height: Get.height * 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
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
                            color: whiteColor,
                            width: Get.width,
                            height: Get.height * 0.80,
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
                                          top: 1.0.h,
                                          right: 2.0.h,
                                          left: 2.0.h),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                                  color: Color(0xFF124688),
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
                                          //   'Pembelian' + ' ' + widget.status!,
                                          //   style: TextStyle(
                                          //       fontSize: 14.0.sp,
                                          //       fontWeight: FontWeight.bold),
                                          //   textAlign: TextAlign.left,
                                          // ),
                                          Text(
                                            'Pembelian' +
                                                ' ' +
                                                (widget.status == 'GAGAL'
                                                    ? 'Gagal'
                                                    : (widget.status == 'SUKSES'
                                                        ? 'Berhasil!!'
                                                        : widget.status!)),
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
                                                    color:
                                                        Colors.grey.shade400),
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
                                  padding: EdgeInsets.only(
                                      left: 2.0.h, right: 2.0.h),
                                  child: Column(
                                    children: [
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
                                            ),
                                          ),
                                          Text(
                                            widget.noref!,
                                            style: TextStyle(
                                                fontSize: 12.0.sp,
                                                fontWeight: FontWeight.w400),
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
                                            'Produk',
                                            style: TextStyle(
                                              fontSize: 12.0.sp,
                                            ),
                                          ),
                                          Container(
                                            width: 23.0.h,
                                            // color: oceanColor,
                                            child: Text(
                                              widget.productName!,
                                              style: TextStyle(
                                                fontSize: 12.0.sp,
                                                fontWeight: FontWeight.w400,
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
                                            'Nomor Handphone',
                                            style: TextStyle(
                                              fontSize: 12.0.sp,
                                            ),
                                          ),
                                          Text(widget.nomorTelepon!,
                                              style: TextStyle(
                                                  fontSize: 12.0.sp,
                                                  fontWeight: FontWeight.w400)),
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
                                            'Harga',
                                            style: TextStyle(
                                              fontSize: 12.0.sp,
                                            ),
                                          ),
                                          Text(
                                              NumberFormat.currency(
                                                      locale: 'id-ID',
                                                      symbol: 'Rp ',
                                                      decimalDigits: 0)
                                                  .format(
                                                      int.parse(widget.harga!)),
                                              style: TextStyle(
                                                  fontSize: 12.0.sp,
                                                  fontWeight: FontWeight.w400)),
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
                                            'Status',
                                            style: TextStyle(
                                              fontSize: 12.0.sp,
                                            ),
                                          ),
                                          Text(widget.status!,
                                              style: TextStyle(
                                                  fontSize: 10.0.sp,
                                                  color: widget.status ==
                                                          'GAGAL'
                                                      ? Colors
                                                          .red // Set text color to red for status 'gagal'
                                                      : Colors.green,
                                                  fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3.0.h,
                                      ),
                                      Divider(
                                        color: Colors.grey.shade700,
                                        thickness: 2,
                                      ),
                                      SizedBox(
                                        height: 2.0.h,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 3.0.h, right: 3.0.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 40.0.w,
                                  height: 6.0.h,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      double pixelRatio = MediaQuery.of(context)
                                          .devicePixelRatio;

                                      screenshotController2
                                          .capture(pixelRatio: pixelRatio)
                                          .then((Uint8List? image) async {
                                        await [Permission.storage].request();
                                        final time = DateTime.now()
                                            .toIso8601String()
                                            .replaceAll('.', '-')
                                            .replaceAll(':', '-');
                                        final nameScreenshot =
                                            'screenshot_$time';
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                            print(
                                                'Error sharing file: $onError');
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
                                      shape: RoundedRectangleBorder(),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.share, color: whiteColor),
                                        Text(' Bagikan'),
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
