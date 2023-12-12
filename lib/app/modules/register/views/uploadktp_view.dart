import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/modules/register/views/formID_view.dart';
import 'package:ppob_mpay1/main.dart';
import 'package:sizer/sizer.dart';

class UploadKTP extends StatefulWidget {
  final String? namaMerchant;
  final String? nama_lengkap;
  final String? nik;
  final String? alamat;
  final String? nomer_tlp;
  final String? email;
  final String? nama_kerabat;
  final String? nomer_tlp_kerabat;
  final String? alamat_kerabat;
  final String? status_kerabat;
  const UploadKTP({
    Key? key,
    this.namaMerchant,
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
  State<UploadKTP> createState() => _UploadKTPState();
}

class _UploadKTPState extends State<UploadKTP> {
  HelperController helperController = HelperController();
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
        backgroundColor: Colors.transparent,
        title: Text(
          'Upload KTP anda',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
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
                        padding: EdgeInsets.only(
                          left: 3.0.h,
                          right: 3.0.h,
                          bottom: 1.0.h,
                        ),
                        child: image2 != null
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: Get.height * 0.50,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
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
                                                height: Get.height * 0.40,
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
                                                  'Pastikan informasi pada KTP jelas dan tidak ada yang terpotong atau buram',
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
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.06,
                                    width: Get.width * 0.90,
                                    child: TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: mainColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        onPressed: () async {
                                          controller.restart();
                                        },
                                        child: Text(
                                          "Upload ulang foto",
                                          style: TextStyle(
                                            color: whiteColor,
                                          ),
                                        )),
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  SizedBox(
                                    height: Get.height * 0.60,
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'Panduan Foto KTP',
                                            style: TextStyle(fontSize: 12.0.sp),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2.5.h,
                                        ),
                                        SizedBox(
                                          width: Get.width * 0.65,
                                          child: Image.asset(
                                            'assets/images/uploadktp.png',
                                            height: 25.0.h,
                                            fit: BoxFit.contain,
                                          ),
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
                                  SizedBox(
                                    height: Get.height * 0.06,
                                    width: Get.width * 0.90,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                          backgroundColor: mainColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                      onPressed: () async {
                                        controller.restart();
                                        getImage2(ImageSource.gallery);
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
                                ],
                              ),
                      ),
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
            Get.to(FormIdView(
              namaMerchant: widget.namaMerchant,
              nama_lengkap: widget.nama_lengkap,
              nik: widget.nik,
              alamat: widget.alamat,
              email: widget.email,
              nomer_tlp: widget.nomer_tlp,
              nama_kerabat: widget.nama_kerabat,
              nomer_tlp_kerabat: widget.nomer_tlp_kerabat,
              status_kerabat: widget.status_kerabat,
              foto_ktp: image2!,
            ));
          }
        },
        child: RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: "Kirim ",
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
    if (activeStep < 1) {
      return SizedBox(
        height: Get.height * 0.05,
        width: Get.width * 0.40,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: greyTextColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () async {
            controller.restart();
            Navigator.pop(context);
          },
          child: RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(
                    Icons.arrow_back,
                    size: 16,
                    color: whiteColor,
                  ),
                ),
                const TextSpan(
                  text: 'Kembali',
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return SizedBox(
        height: Get.height * 0.05,
        width: Get.width * 0.40,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: greyTextColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () async {
            controller.restart();
            if (activeStep > 0) {
              setState(() {
                activeStep--;
              });
            }
          },
          child: RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(
                    Icons.arrow_back,
                    size: 16,
                    color: whiteColor,
                  ),
                ),
                const TextSpan(
                  text: 'kembali',
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
