import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../main.dart';
import '../../../data/colors.dart';
import '../../../data/controller/helpercontroller.dart';
import '../controllers/saldo_controller.dart';

class Paymentsaldo extends StatefulWidget {
  final String? kode_unik;
  final String? nama_lengkap;
  final String? nik;
  final String? alamat;
  final String? nomer_tlp;
  final String? email;
  final String? nama_kerabat;
  final String? nomer_tlp_kerabat;
  final String? alamat_kerabat;
  final String? status_kerabat;
  const Paymentsaldo({
    Key? key,
    this.kode_unik,
    this.nama_lengkap,
    this.nik,
    this.alamat,
    this.nomer_tlp,
    this.email,
    this.nama_kerabat,
    this.nomer_tlp_kerabat,
    this.alamat_kerabat,
    this.status_kerabat,
  }) : super(key: key);

  @override
  State<Paymentsaldo> createState() => _PaymentsaldoState();
}

class _PaymentsaldoState extends State<Paymentsaldo> {
  HelperController helperController = HelperController();
  final saldoController = SaldoController();
  int activeStep = 0;
  int upperBound = 1;

  int dotCount = 2;

  XFile? image;
  XFile? image2;

  final ImagePicker picker = ImagePicker();

  // Future getImage(ImageSource gallery) async {
  //   var img = await picker.pickImage(source: gallery);

  //   setState(() {
  //     image = img;
  //   });
  // }

  Future getImage2(ImageSource media) async {
    var img2 = await picker.pickImage(source: media);

    setState(() {
      image2 = img2;
    });
  }

  // Future getImage2(ImageSource gallery) async {
  //   var img2 = await picker.pickImage(source: gallery);

  //   if (img2 != null) {
  //     setState(() {
  //       image2 = img2;
  //     });
  //   } else {
  //     setState(() {
  //       image2 = img2;
  //     });
  //   }
  // }

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        title: Text(
          'Upload bukti transaksi',
          style: TextStyle(
            color: whiteColor,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: whiteColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Expanded(
                child: ListView(
                  children: [
                    Visibility(
                      visible: activeStep == 0 ? true : false,
                      child: Container(
                        // padding: EdgeInsets.only(
                        //   left: 3.0.h,
                        //   right: 3.0.h,
                        //   bottom: 1.0.h,
                        // ),
                        child: image2 != null
                            ? Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 2.h, right: 2.h, top: 2.h),
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.file(
                                                File(image2!.path),
                                                fit: BoxFit.cover,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: Get.height * 0.70
                                                // height: Get.height * 0.40,
                                                )
                                            // Image.file(
                                            //   FIle(image2!.path),
                                            //   fit: BoxFit.cover,
                                            //   width: MediaQuery.of(context)
                                            //       .size
                                            //       .width,
                                            //   height: Get.height * 0.40,
                                            // ),
                                            ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '*.',
                                              style: TextStyle(
                                                color: greyTextColor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2.0.w,
                                            ),
                                            SizedBox(
                                              width: Get.width * 0.75,
                                              child: Text(
                                                'Pastikan bukti transaksi jelas dan tidak ada yang terpotong atau buram',
                                                style: TextStyle(
                                                  color: greyTextColor,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1.0.h,
                                        )
                                      ],
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: Get.height * 0.06,
                                  //   width: Get.width * 0.90,
                                  //   child: TextButton(
                                  //       style: TextButton.styleFrom(
                                  //         backgroundColor: mainColor,
                                  //         shape: RoundedRectangleBorder(
                                  //           borderRadius:
                                  //               BorderRadius.circular(20),
                                  //         ),
                                  //       ),
                                  //       onPressed: () async {
                                  //         controller.restart();
                                  //         getImage2(ImageSource.gallery);
                                  //       },
                                  //       child: Text(
                                  //         "Upload ulang foto",
                                  //         style: TextStyle(
                                  //           color: whiteColor,
                                  //         ),
                                  //       )),
                                  // )
                                  // SizedBox(
                                  //   height: Get.height * 0.06,
                                  //   width: Get.width * 0.90,
                                  //   // color: Colors.black,
                                  //   child: TextButton(
                                  //     style: TextButton.styleFrom(
                                  //       backgroundColor: mainColor,
                                  //       shape: RoundedRectangleBorder(
                                  //         borderRadius:
                                  //             BorderRadius.circular(20),
                                  //       ),
                                  //     ),
                                  //     onPressed: () async {
                                  //       controller.restart();
                                  //       getImage2(ImageSource.gallery);
                                  //     },
                                  //     child: Text(
                                  //       "Upload Ulang Foto",
                                  //       style: TextStyle(
                                  //         color: const Color(0xffffffff),
                                  //         fontSize: 11.0.sp,
                                  //         fontWeight: FontWeight.bold,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              )
                            : Column(
                                children: [
                                  Container(
                                    height: Get.height,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                        color: whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(3.5.h)),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: 2.h, left: 2.h, top: 2.h),
                                      child: Column(
                                        children: [
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Bukti Transfer :',
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.06,
                                                  width: Get.width * 0.30,
                                                  child: TextButton(
                                                    style: TextButton.styleFrom(
                                                        backgroundColor:
                                                            mainColor,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20))),
                                                    onPressed: () async {
                                                      controller.restart();
                                                      getImage2(
                                                          ImageSource.gallery);
                                                      widget.kode_unik;
                                                    },
                                                    child: Text(
                                                      'Upload Foto',
                                                      style: TextStyle(
                                                        color: whiteColor,
                                                        fontSize: 12.0.sp,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                          SizedBox(
                                            height: 2.5.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text('1.'),
                                              SizedBox(
                                                width: 2.0.w,
                                              ),
                                              SizedBox(
                                                width: Get.width * 0.80,
                                                child: const Text(
                                                  'Pastikan KTP belum pernah di gunakan untuk registrasi.',
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 1.0.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text('2.'),
                                              SizedBox(
                                                width: 2.0.w,
                                              ),
                                              SizedBox(
                                                width: Get.width * 0.80,
                                                child: const Text(
                                                  'Foto KTP asli (bukan salinan).',
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 1.0.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text('3.'),
                                              SizedBox(
                                                width: 2.0.w,
                                              ),
                                              SizedBox(
                                                width: Get.width * 0.80,
                                                child: const Text(
                                                  'Informasi pada KTP harus jelas dan tidak ada yang terpotong atau buram.',
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 1.0.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text('4.'),
                                              SizedBox(
                                                width: 2.0.w,
                                              ),
                                              SizedBox(
                                                width: Get.width * 0.80,
                                                child: const Text(
                                                    'Pastikan tidak ada pantulan cahaya dan bayangan di foto KTP.'),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 1.0.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text('5.'),
                                              SizedBox(
                                                width: 2.0.w,
                                              ),
                                              SizedBox(
                                                width: Get.width * 0.80,
                                                child: const Text(
                                                  'Foto memenuhi area dari frame foto.',
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    image2 != null
                        ? Container(
                            padding: EdgeInsets.only(
                              left: 3.0.h,
                              right: 3.0.h,
                              bottom: 5.0.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                previousButton(),
                                nextButton(),
                              ],
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.only(
                              left: 3.0.h,
                              right: 3.0.h,
                              bottom: 5.0.h,
                            ),
                            child: const Text(''),
                          ),
                    SizedBox(
                      height: 5.0.h,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget nextButton() {
    return SizedBox(
      height: Get.height * 0.05,
      width: Get.width * 0.40,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () async {
          controller.restart();
          if (_formKey.currentState!.validate()) {
            await saldoController.Uploadbukti(
              image2,
              widget.kode_unik,
              context,
            );
          }
        },
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Kirim ",
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 11.0.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              WidgetSpan(
                child: Icon(
                  Icons.check,
                  size: 16,
                  color: whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget previousButton() {
    return SizedBox(
      height: Get.height * 0.05,
      width: Get.width * 0.40,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: greyColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () async {
          controller.restart();
          getImage2(ImageSource.gallery);
        },
        child: Text(
          "Upload Ulang",
          style: TextStyle(
            color: const Color(0xffffffff),
            fontSize: 11.0.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
