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

class PdamgagalView extends StatefulWidget {
  final String? error;
  // final String? productCode;
  // final String? productName;
  // final String? idpel;
  // final String? nama_pelanggan;
  // final String? stan_awal;
  // final String? stan_akhir;
  // final String? jumlah_bulan;
  // final String? periode;
  // final String? deskripsi;
  // final String? harga;
  // final String? total_bayar;
  // final String? admin;
  // final String? noref;
  // final String? tglwaktu;
  const PdamgagalView({
    super.key,
    this.error,
    // this.productCode,
    // this.productName,
    // this.idpel,
    // this.nama_pelanggan,
    // this.stan_awal,
    // this.stan_akhir,
    // this.jumlah_bulan,
    // this.periode,
    // this.deskripsi,
    // this.harga,
    // this.total_bayar,
    // this.admin,
    // this.noref,
    // this.tglwaktu,
  });
  // "terjadi kesalahan, tiket-id anda : ticket-1704782449 (1002)"
  @override
  State<PdamgagalView> createState() => _PdamgagalViewState();
}

class _PdamgagalViewState extends State<PdamgagalView> {
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
                            Get.offAll(MainPage());
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
                            Stack(
                              children: [
                                Image.asset(
                                  'assets/images/Batik.png',
                                  height: 20.0.h,
                                  width: double.infinity,
                                  fit: BoxFit.contain,
                                ),
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
                                      Text(
                                        'Transaksi Gagal',
                                        style: TextStyle(
                                            fontSize: 14.0.sp,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 0.5.h,
                                      ),
                                      Text(
                                          DateFormat('dd-MM-yyyy  HH:mm:ss')
                                              .format(DateTime.now()),
                                          textScaleFactor: 1.0,
                                          style: TextStyle(
                                            fontSize: 12.0.sp,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                          )),
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
                                  Text(
                                    (widget.error!) + ' ' + '(1002)',
                                    style: TextStyle(
                                        fontSize: 14.0.sp,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.left,
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
