import 'dart:io';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/data/urlServices.dart';
import 'package:ppob_mpay1/app/modules/akun/controllers/akun_controller.dart';
import 'package:ppob_mpay1/app/modules/akun/views/datakerabat_view.dart';
import 'package:ppob_mpay1/app/modules/akun/views/datapersonal_view.dart';
import 'package:ppob_mpay1/app/modules/akun/views/fieldkerabat_view.dart';
import 'package:ppob_mpay1/app/modules/akun/views/fieldmerchant_view.dart';
import 'package:ppob_mpay1/app/modules/akun/views/profilefield_view.dart';
import 'package:ppob_mpay1/app/modules/home/controllers/home_controller.dart';
import 'package:ppob_mpay1/main.dart';
import 'package:sizer/sizer.dart';

class Datakerabat extends StatefulWidget {
  String? email;
  Datakerabat({Key? key, this.email}) : super(key: key);

  @override
  _DatakerabatState createState() => _DatakerabatState();
}

class _DatakerabatState extends State<Datakerabat> {
  final akunController = Get.put(AkunController());
  var pref = GetStorage();
  XFile? image1;

  final ImagePicker picker = ImagePicker();

  Future getImage2(ImageSource media) async {
    var img2 = await picker.pickImage(source: media);

    setState(() {
      image1 = img2;
    });
  }

  String getInitials(String userNamalengkap) => userNamalengkap.isNotEmpty
      ? userNamalengkap
          .trim()
          .split(' ')
          .map((l) => l[0])
          .take(2)
          .join()
          .toUpperCase()
      : '';

  @override
  void initState() {
    super.initState();
    akunController.profile(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 8.0.h,
                // color: Colors.amber,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(right: 1.5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: whiteColor,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Text(
                            'Informasi Akun',
                            style: GoogleFonts.openSans(
                              fontSize: 14.0.sp, // Ukuran font sesuai Sizer
                              fontWeight: FontWeight.w500, // Berat font
                              color: whiteColor, // Warna teks
                            ),
                          ),
                        ),
                        CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey.shade300,
                            child: Text(
                              getInitials(
                                pref.read('nama_lengkap'),
                              ),
                              style: GoogleFonts.openSans(
                                fontSize: 14.0.sp, // Ukuran font sesuai Sizer
                                fontWeight: FontWeight.bold, // Berat font
                                color: blackColor, // Warna teks
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: Get.height,
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.h),
                      topRight: Radius.circular(5.h),
                    )),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 2.0.h,
                    right: 2.0.h,
                    top: 2.0.h,
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 2.0.h,
                          ),
                          InkWell(
                            onTap: () {
                              Get.off(FieldkerabatView());
                            },
                            child: Container(
                              height: 7.h,
                              // width: Get.width * 0.90,
                              decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 1.5.h,
                                  right: 1.0.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Data Kerabat',
                                      style: GoogleFonts.openSans(
                                        fontSize:
                                            12.0.sp, // Ukuran font sesuai Sizer
                                        fontWeight:
                                            FontWeight.w500, // Berat font
                                        color: whiteColor, // Warna teks
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_right,
                                      color: whiteColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 1.5.h,
                              right: 1.0.h,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Nama Kerabat',
                                      style: GoogleFonts.openSans(
                                        fontSize:
                                            12.0.sp, // Ukuran font sesuai Sizer
                                        fontWeight:
                                            FontWeight.w400, // Berat font
                                        color: Colors.black87, // Warna teks
                                      ),
                                    ),
                                    Text(
                                      pref.read(
                                            "nama_kerabat",
                                          ) ??
                                          '',
                                      style: GoogleFonts.openSans(
                                        fontSize:
                                            12.0.sp, // Ukuran font sesuai Sizer
                                        fontWeight:
                                            FontWeight.w400, // Berat font
                                        color: blackColor, // Warna teks
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.0.h,
                                ),
                                Divider(
                                  color: Colors.grey.shade500,
                                ),
                                SizedBox(
                                  height: 1.0.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Alamat Kerabat',
                                      style: GoogleFonts.openSans(
                                        fontSize:
                                            12.0.sp, // Ukuran font sesuai Sizer
                                        fontWeight:
                                            FontWeight.w400, // Berat font
                                        color: Colors.black87, // Warna teks
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                      pref.read(
                                            "alamat_kerabat",
                                          ) ??
                                          '',
                                      style: GoogleFonts.openSans(
                                        fontSize:
                                            12.0.sp, // Ukuran font sesuai Sizer
                                        fontWeight:
                                            FontWeight.w400, // Berat font
                                        color: blackColor, // Warna teks
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 1.0.h,
                                ),
                                Divider(
                                  color: Colors.grey.shade500,
                                ),
                                SizedBox(
                                  height: 1.0.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Status Kerabat',
                                      style: GoogleFonts.openSans(
                                        fontSize:
                                            12.0.sp, // Ukuran font sesuai Sizer
                                        fontWeight:
                                            FontWeight.w400, // Berat font
                                        color: Colors.black87, // Warna teks
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                      pref.read(
                                            "status_kerabat",
                                          ) ??
                                          '',
                                      style: GoogleFonts.openSans(
                                        fontSize:
                                            12.0.sp, // Ukuran font sesuai Sizer
                                        fontWeight:
                                            FontWeight.w400, // Berat font
                                        color: blackColor, // Warna teks
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 1.0.h,
                                ),
                                Divider(
                                  color: Colors.grey.shade500,
                                ),
                                SizedBox(
                                  height: 1.0.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'No Telepon Kerabat',
                                      style: GoogleFonts.openSans(
                                        fontSize:
                                            12.0.sp, // Ukuran font sesuai Sizer
                                        fontWeight:
                                            FontWeight.w400, // Berat font
                                        color: Colors.black87, // Warna teks
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                      pref.read('nomer_tlp_kerabat') ?? '',
                                      style: GoogleFonts.openSans(
                                        fontSize:
                                            12.0.sp, // Ukuran font sesuai Sizer
                                        fontWeight:
                                            FontWeight.w400, // Berat font
                                        color: blackColor, // Warna teks
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 3.0.h,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomsheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return Container(
      height: 15.0.h,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(top: 1.5.h),
        child: Column(
          children: [
            Text(
              'Pilih Foto Profile',
              style: TextStyle(
                fontSize: 15.0.sp,
              ),
            ),
            SizedBox(
              height: 5.0.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () async {
                    getImage2(ImageSource.gallery);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.photo_library, // Menggunakan ikon photo_library
                      ),
                      SizedBox(
                        width: 1.0.h,
                      ),
                      Text('Galeri'),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    getImage2(ImageSource.camera);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.camera_alt,
                      ),
                      SizedBox(
                        width: 1.0.h,
                      ),
                      Text('Kamera')
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
