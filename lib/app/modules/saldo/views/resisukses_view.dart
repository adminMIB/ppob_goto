import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sizer/sizer.dart';

import '../../../data/colors.dart';
import '../../../data/controller/helpercontroller.dart';
import '../../../main_page.dart';

class ResisuksesView extends StatefulWidget {
  final String? kode_unik;
  final String? status;
  final String? message;
  final String? kontak;

  final String? tanggal;
  const ResisuksesView({
    super.key,
    this.kode_unik,
    this.status,
    this.message,
    this.kontak,
    this.tanggal,
  });

  @override
  State<ResisuksesView> createState() => _ResisuksesViewState();
}

class _ResisuksesViewState extends State<ResisuksesView> {
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
                                            // boxShadow: [
                                            //   BoxShadow(
                                            //     color: Colors.grey
                                            //         .withOpacity(0.3),
                                            //     spreadRadius: 5,
                                            //     blurRadius: 7,
                                            //     offset: Offset(0, 1),
                                            //   ),
                                            // ],
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
                                                        'Upload Bukti Transfer Berhasil',
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
                                                        height: 1.h,
                                                      ),
                                                      Text(
                                                        widget.tanggal!,
                                                        style: TextStyle(
                                                          fontSize: 11.0.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        textAlign:
                                                            TextAlign.right,
                                                      ),
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
                                                  height: 2.0.h,
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 1.0.h,
                                                        right: 1.0.h),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          widget.message! +
                                                              ', ' +
                                                              widget.kontak!,
                                                          style: TextStyle(
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        )
                                                      ],
                                                    )),
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
                                  primary: greyColor,
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
                                  Get.offAll(MainPage());
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: mainColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.home, color: whiteColor),
                                    Text(' Home'),
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
