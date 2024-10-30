import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:ppob_mpay1/app/modules/register/controllers/register_controller.dart';
import 'package:ppob_mpay1/app/modules/register/views/datakerabat.dart';
import 'package:sizer/sizer.dart';

import '../../../../main.dart';
import '../../../data/colors.dart';
import '../../../data/controller/helpercontroller.dart';
import 'formID_view.dart';

class Upload_profile extends StatefulWidget {
  final String? namaMerchant;
  final String? nama_lengkap;
  final String? nik;
  final String? alamat;
  final String? nomer_tlp;
  final String? email;

  const Upload_profile({
    Key? key,
    this.namaMerchant,
    this.nama_lengkap,
    this.nik,
    this.alamat,
    this.nomer_tlp,
    this.email,
  }) : super(key: key);

  @override
  State<Upload_profile> createState() => _Upload_profileState();
}

class _Upload_profileState extends State<Upload_profile> {
  HelperController helperController = HelperController();
  final uploadProfile = Get.put(RegisterController());

  int activeStep = 0;
  int upperBound = 1;

  int dotCount = 2;

  XFile? image;
  File? image2;

  final ImagePicker picker = ImagePicker();

  Future getImage2(ImageSource media) async {
    var img2 = await picker.pickImage(source: media);

    setState(() {
      image2 = File(img2!.path);
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
          'Upload Profile anda',
          style: GoogleFonts.dmSans(
            color: mainColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: mainColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Visibility(
                      visible: activeStep == 0 ? true : false,
                      child: Container(
                        child: image2 != null
                            ? Column(
                                children: [
                                  Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.file(
                                          File(image2!.path),
                                          fit: BoxFit.cover,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: Get.height * 0.50,
                                        ),
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
                                              'Pastikan Foto Profile jelas dan tidak ada yang terpotong atau buram',
                                              style: GoogleFonts.dmSans(
                                                fontSize: 11.sp,
                                                color: Colors.grey.shade500,
                                                fontWeight: FontWeight.w500,
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
                                ],
                              )
                            : Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius:
                                          BorderRadius.circular(3.5.h),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Upload Bukti Transfer',
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(
                                          height: 2.0.h,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(3.h),
                                            border: Border.all(
                                              color: Colors.black,
                                              width: 1,
                                              style: BorderStyle.solid,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(2.h),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [],
                                                ),
                                                SizedBox(
                                                  height: 4.0.h,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.restart();
                                                    getImage2(
                                                        ImageSource.gallery);
                                                    // widget.kode_unik;
                                                  },
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .camera_alt_outlined,
                                                        size: 15.h,
                                                      ),
                                                      Text(
                                                        'Upload Bukti Transfer',
                                                        style: TextStyle(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: mainColor,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 4.0.h,
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
                    SizedBox(
                      height: 1.5.h,
                    ),
                    image2 != null
                        ? Container(
                            // padding: EdgeInsets.only(
                            //   left: 3.0.h,
                            //   right: 3.0.h,
                            //   bottom: 5.0.h,
                            // ),
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
                  ],
                ),
              ),
            ],
          ),
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
            print('image profile : ${image2!.path}');
            // Get.to(FormIdView(
            //   namaMerchant: widget.namaMerchant,
            //   nama_lengkap: widget.nama_lengkap,
            //   nik: widget.nik,
            //   alamat: widget.alamat,
            //   email: widget.email,
            //   nomer_tlp: widget.nomer_tlp,
            // ));
            Get.to(DataKerabattView(
              namaMerchant: widget.namaMerchant,
              nama_lengkap: widget.nama_lengkap,
              nik: widget.nik,
              alamat: widget.alamat,
              nomer_tlp: widget.nomer_tlp,
              // email: widget.email,
              email: widget.email,
              foto_profile: image2!,
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
