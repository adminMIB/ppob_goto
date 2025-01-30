import 'dart:typed_data';

import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/main_page.dart';
import 'package:sizer/sizer.dart';
import 'package:screenshot/screenshot.dart';

class Cobawel extends StatefulWidget {
  final String? paymentscreen;
  const Cobawel({
    Key? key,
    this.paymentscreen,
  }) : super(key: key);

  @override
  State<Cobawel> createState() => _CobawelState();
}

class _CobawelState extends State<Cobawel> {
  late Map<String, String> screenData;

  ScreenshotController screenshotController2 = ScreenshotController();
  Uint8List? _imageFile;

  @override
  void initState() {
    super.initState();
    // Parsing data screen menjadi Map
    screenData = _parseScreenData(widget.paymentscreen ?? '');
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
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: mainColor,
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 2.h, right: 2.h, top: 1.h, bottom: 2.h),
                  child: Column(
                    children: [
                      Screenshot(
                        controller: screenshotController2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.offAll(MainPage());
                              },
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 6.w,
                              ),
                            ),
                            Center(
                              child: Text(
                                'Bukti transaksi',
                                style: GoogleFonts.dmSans(
                                  fontSize: 16.sp,
                                  color: whiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            Container(
                              height: Get.height * 0.8,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(2.5.h),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(2.h),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/Checkmark.svg',
                                      height: 6.h,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                      'Transaksi sukses',
                                      style: GoogleFonts.dmSans(
                                        fontSize: 14.sp,
                                        color: blackColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1,
                                    ),
                                    SizedBox(
                                      height: 1.2.h,
                                    ),
                                    ...screenData.entries.map(
                                      (entry) => Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 0.5.h),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 35.5.w,
                                              child: Text(
                                                entry.key,
                                                style: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 1.5.w),
                                            Text(
                                              ":",
                                              style: TextStyle(
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(width: 4.0.w),
                                            Expanded(
                                              child: Text(
                                                entry.value,
                                                style: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            // left: 3.0.h,
                            // right: 3.0.h,
                            // // top: 2.0.h,
                            ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                  primary: whiteColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.download_rounded,
                                        color: mainColor),
                                    Text(
                                      ' Unduh',
                                      style: TextStyle(
                                        color: mainColor,
                                      ),
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
                                  primary: whiteColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.share, color: mainColor),
                                    Text(
                                      ' Bagikan',
                                      style: TextStyle(
                                        color: mainColor,
                                      ),
                                    ),
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
            ],
          ),
        ),
      ),
    );
  }
}
