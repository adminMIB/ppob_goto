import 'dart:typed_data';

import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ppob_mpay1/app/modules/goto/controllers/goto_controller.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sizer/sizer.dart';

import '../../../../data/colors.dart';
import '../../../../data/controller/helpercontroller.dart';
import '../../../../main_page.dart';
import '../../../transferbank/controllers/transferbank_controller.dart';

class GotoSuksesView extends StatefulWidget {
  final String? paymentscreen;
  final String? retrievalReferenceNumber;
  final String? productCode;
  final String? productName;
  final String? accountNumber;
  final String? id;
  final String? username;
  const GotoSuksesView({
    super.key,
    this.paymentscreen,
    this.retrievalReferenceNumber,
    this.productCode,
    this.productName,
    this.accountNumber,
    this.id,
    this.username,
  });

  @override
  State<GotoSuksesView> createState() => _GotoSuksesViewState();
}

class _GotoSuksesViewState extends State<GotoSuksesView> {
  final detailgoto = Get.put(GotoController());

  late Map<String, String> screenData;
  //  DateTime parsedDateTime = parseDateTime(widget.tglwaktu ?? '');
  final helperController = Get.put(HelperController());

  Uint8List? _imageFile;

  var dataSplit;
  var pref = GetStorage();

  ScreenshotController screenshotController2 = ScreenshotController();
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
                                      height: 1.5.h,
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
                                                Text(
                                                  'Bukti Transaksi',
                                                  style: TextStyle(
                                                    fontSize: 14.0.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(
                                                  height: 0.5,
                                                ),
                                                Divider(
                                                  color: Colors.grey.shade700,
                                                  thickness: 1,
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                ...screenData.entries
                                                    .map((entry) => Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      0.5.h),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                width: 35.5.w,
                                                                child: Text(
                                                                  entry.key,
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12.0.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width: 1.5.w),
                                                              Text(
                                                                ":",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      12.0.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width: 4.0.w),
                                                              Expanded(
                                                                child: Text(
                                                                  entry.value,
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12.0.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )),
                                                SizedBox(
                                                  height: 2.h,
                                                ),
                                              ],
                                            ), ////halo
                                          ),
                                        ),
                                        // Positioned(
                                        //   left: Get.width * 0.45 - 25.0,
                                        //   top: 0.0,
                                        //   child: FractionalTranslation(
                                        //     translation: Offset(0.0, -0.5),
                                        //     child: Container(
                                        //       height: 60.h,
                                        //       width: 60.0,
                                        //       decoration: BoxDecoration(
                                        //         shape: BoxShape.circle,
                                        //         color: whiteColor,
                                        //       ),
                                        //       child: SvgPicture.asset(
                                        //         'assets/images/Checkmark.svg',
                                        //         height: 3.5.h,
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   width: 30.h,
                      //   height: 10.h,
                      //   child: Align(
                      //     alignment: Alignment.bottomCenter,
                      //     child: Container(
                      //       color: Colors.transparent,
                      //       padding: EdgeInsets.only(bottom: 2.h),
                      //       child: Center(
                      //         child: SizedBox(
                      //           width: Get.width,
                      //           height: 6.0.h,
                      //           child: ElevatedButton(
                      //             onPressed: () async {
                      //               await detailgoto.cekstatus(
                      //                   context,
                      //                   widget.retrievalReferenceNumber,
                      //                   widget.productCode,
                      //                   widget.productName,
                      //                   widget.accountNumber);
                      //             },
                      //             style: ElevatedButton.styleFrom(
                      //               primary: Color(0xFF78B3CE),
                      //               shape: RoundedRectangleBorder(
                      //                   borderRadius:
                      //                       BorderRadius.circular(10)),
                      //             ),
                      //             child: Text(
                      //               'Cek status',
                      //               style: TextStyle(
                      //                 fontSize: 14.0.sp,
                      //                 fontWeight: FontWeight.bold,
                      //                 color: Color(0xFFFDF8F8),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 3.0.h,
                          right: 3.0.h,
                          // top: 2.0.h,
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
                            // SizedBox(
                            //   width: 40.0.w,
                            //   height: 6.0.h,
                            //   child: ElevatedButton(
                            //     onPressed: () {
                            //       screenshotController2
                            //           .capture()
                            //           .then((Uint8List? image) {
                            //         if (image != null) {
                            //           Share.file(
                            //             'MPay',
                            //             'MPay_resi.jpg',
                            //             image,
                            //             'image/jpg',
                            //           ).then((_) {
                            //             setState(() {
                            //               _imageFile = image;
                            //             });
                            //           }).catchError((onError) {
                            //             print('Error sharing file: $onError');
                            //           });
                            //         } else {
                            //           print('Captured image is null');
                            //         }
                            //       }).catchError((onError) {
                            //         print(
                            //             'Error capturing screenshot: $onError');
                            //       });
                            //     },
                            //     style: ElevatedButton.styleFrom(
                            //       primary: mainColor,
                            //       shape: RoundedRectangleBorder(
                            //           borderRadius: BorderRadius.circular(10)),
                            //     ),
                            //     child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       children: [
                            //         Icon(Icons.share, color: whiteColor),
                            //         Text(' Bagikan'),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            SizedBox(
                              width: 40.0.w,
                              height: 6.0.h,
                              child: ElevatedButton(
                                onPressed: () async {
                                  await detailgoto.cekstatus(
                                    context,
                                    widget.retrievalReferenceNumber,
                                    widget.productCode,
                                    widget.productName,
                                    widget.accountNumber,
                                    widget.id,
                                    widget.username,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: mainColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Icon(Icons.share, color: whiteColor),
                                    Text('Cek Status'),
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
