import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'dart:typed_data';
import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ppob_mpay1/app/main_page.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sizer/sizer.dart';

class EmoneyTransaksiBerhasilView extends StatefulWidget {
  String? idpel;
  String? namaPelanggan;
  String? waktu;
  String? nominal;
  String? admin;
  String? ref1;
  String? ref2;
  String? total;
  String? ket;
  EmoneyTransaksiBerhasilView({
    super.key,
    this.idpel,
    this.namaPelanggan,
    this.waktu,
    this.nominal,
    this.admin,
    this.ref1,
    this.ref2,
    this.total,
    this.ket,
  });

  @override
  State<EmoneyTransaksiBerhasilView> createState() => _EmoneyTransaksiBerhasilViewState();
}

class _EmoneyTransaksiBerhasilViewState extends State<EmoneyTransaksiBerhasilView> {
  Uint8List? _imageFile;
  ScreenshotController screenshotController2 = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            // controller.restart();
          },
          child: WillPopScope(
            onWillPop: () async => false,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 4.0.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          Get.offAll(MainPage()
                              // ShowCaseWidget(
                              //     builder: Builder(
                              //         builder: (_) => MainPage(
                              //             //fungsi
                              //             ))),
                              );
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.close,
                            color: greyTextColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.0.h,
                      ),
                      Screenshot(
                        controller: screenshotController2,
                        child: Container(
                          color: whiteColor,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 4.0.h,
                              ),
                              Stack(
                                alignment: Alignment.center,
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    // height: 65.0.h,
                                    padding: EdgeInsets.only(
                                      bottom: 2.0.h,
                                    ),
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      color: biru,
                                      borderRadius: BorderRadius.circular(3.h),
                                      border: Border.all(
                                        color: Color(0xFF005B96).withOpacity(0.2),
                                        width: 2.0,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade100.withOpacity(0.5),
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
                                                  'Transaksi Berhasil',
                                                  style: TextStyle(
                                                    fontSize: 14.0.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.green,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(
                                                  height: 2.0.h,
                                                ),
                                                Text(
                                                  'E-Money',
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: mainColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Text(
                                                  'ID Pelanggan :  ${widget.idpel!}',
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: mainColor,
                                                  ),
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
                                            padding: EdgeInsets.only(left: 1.0.h, right: 1.0.h),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  // crossAxisAlignment:
                                                  //     CrossAxisAlignment
                                                  //         .start,
                                                  children: [
                                                    Text(
                                                      'Tanggal dan Waktu',
                                                      style: TextStyle(
                                                        fontSize: 11.0.sp,
                                                        // color: Colors.grey,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                    Text(
                                                      widget.waktu!,
                                                      style: TextStyle(
                                                        fontSize: 11.0.sp,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                      textAlign: TextAlign.right,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 1.0.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'No Refrensi',
                                                      style: TextStyle(
                                                        fontSize: 11.0.sp,
                                                        // color: Colors.grey,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                    Text(
                                                      widget.ref1!,
                                                      style: TextStyle(
                                                        fontSize: 11.0.sp,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 1.0.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Nama Pelanggan',
                                                      style: TextStyle(
                                                        fontSize: 11.0.sp,
                                                        // color: Colors.grey,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                    widget.namaPelanggan != ''
                                                        ? Text(
                                                            widget.namaPelanggan!,
                                                            style: TextStyle(
                                                              fontSize: 11.0.sp,
                                                              fontWeight: FontWeight.w400,
                                                            ),
                                                          )
                                                        : Text(
                                                            '-',
                                                            style: TextStyle(
                                                              fontSize: 11.0.sp,
                                                              fontWeight: FontWeight.w400,
                                                            ),
                                                          ),
                                                    // Text(
                                                    //   '-',
                                                    //   style: TextStyle(
                                                    //     fontSize: 11.0.sp,
                                                    //     fontWeight: FontWeight.w400,
                                                    //   ),
                                                    // ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 1.0.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Nominal',
                                                      style: TextStyle(
                                                        fontSize: 11.0.sp,
                                                        // color: Colors.grey,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                    Text(
                                                      NumberFormat.currency(locale: 'id-ID', symbol: 'Rp ', decimalDigits: 0)
                                                          .format(int.parse(widget.nominal!)),
                                                      style: TextStyle(
                                                        fontSize: 11.0.sp,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 1.0.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Biaya Admin',
                                                      style: TextStyle(
                                                        fontSize: 11.0.sp,
                                                        // color: Colors.grey,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                    Text(
                                                      NumberFormat.currency(locale: 'id-ID', symbol: 'Rp ', decimalDigits: 0).format(int.parse(widget.admin!)),
                                                      style: TextStyle(
                                                        fontSize: 11.0.sp,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 1.0.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Total Bayar',
                                                      style: TextStyle(
                                                        fontSize: 16.0.sp,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                      textAlign: TextAlign.right,
                                                    ),
                                                    Text(
                                                      NumberFormat.currency(locale: 'id-ID', symbol: 'Rp ', decimalDigits: 0).format(int.parse(widget.total!)),
                                                      style: TextStyle(
                                                        fontSize: 11.0.sp,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
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
                                                Column(
                                                  children: [
                                                    Container(
                                                      height: 8.0.h,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8.0),
                                                        border: Border.all(
                                                          color: Colors.green, // Outline color
                                                          width: 2.0, // Outline width
                                                        ),
                                                        color: Colors.green.withOpacity(0.2),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(1.0.h),
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
                                                              'Transaksi  ${widget.ket!}',
                                                              style: TextStyle(fontSize: 11.sp, color: Colors.green, fontWeight: FontWeight.w400),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: -3.9.h,
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Container(
                                          height: 8.0.h,
                                          width: 8.0.h,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: whiteColor,
                                          ),
                                          child: SvgPicture.asset(
                                            'assets/images/Checkmark.svg',
                                            height: 3.5.h,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 6.0.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 40.0.w,
                              height: 6.0.h,
                              child: ElevatedButton(
                                onPressed: () async {
                                  double pixelRatio = MediaQuery.of(context).devicePixelRatio;

                                  screenshotController2.capture(pixelRatio: pixelRatio).then((Uint8List? image) async {
                                    await [Permission.storage].request();
                                    final time = DateTime.now().toIso8601String().replaceAll('.', '-').replaceAll(':', '-');
                                    final nameScreenshot = 'screenshot_$time';
                                    _imageFile = image;

                                    final result = await ImageGallerySaver.saveImage(Uint8List.fromList(image!), quality: 100, name: nameScreenshot);

                                    print('result  : $result');

                                    setState(() {});
                                  }).catchError((onError) {
                                    print(onError);
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: mainColor,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.download_rounded, color: whiteColor),
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
                                  screenshotController2.capture().then((Uint8List? image) {
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
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
