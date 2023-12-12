import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:sizer/sizer.dart';

class Syaratfinger extends StatefulWidget {
  String? email;
  Syaratfinger({Key? key, this.email}) : super(key: key);

  @override
  _SyaratfingerState createState() => _SyaratfingerState();
}

class _SyaratfingerState extends State<Syaratfinger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 2.0.h,
              child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.close),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(2.0.h),
              child: Column(
                children: [
                  Text(
                    'Syarat & Ketentuan Pengguna \nBiometrik',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: 3.0.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '1.',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0.sp,
                          color: greyTextColor,
                        ),
                      ),
                      SizedBox(
                        width: 2.0.w,
                      ),
                      SizedBox(
                        width: Get.width * 0.80,
                        child: Text(
                          'Biometric Login adalah fitur tambahan yang disediakan kami kepada Anda untuk dapat mengakses (login) aplikasi dengan menggunakan sidik jari atau pengenalan wajah pengguna.',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0.sp,
                            color: greyTextColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '2.',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0.sp,
                          color: greyTextColor,
                        ),
                      ),
                      SizedBox(
                        width: 2.0.w,
                      ),
                      SizedBox(
                        width: Get.width * 0.80,
                        child: Text(
                          'Anda telah dapat mengakses aplikasi tanpa fitur Biometric Login dengan menggunakan kata sandi melalui perangkat ponsel yang telah didaftarkan sebelumnya oleh Anda.',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0.sp,
                            color: greyTextColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '3.',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0.sp,
                          color: greyTextColor,
                        ),
                      ),
                      SizedBox(
                        width: 2.0.w,
                      ),
                      SizedBox(
                        width: Get.width * 0.80,
                        child: Text(
                          'Dengan melakukan aktivasi sidik jari atau pengenalan wajah pada aplikasi, Anda mengetahui dan menyetujui bahwa seluruh sidik jari atau pengenalan wajah tersebut dapat digunakan sebagai pilihan otentifikasi login pada aplikasi.',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0.sp,
                            color: greyTextColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '4.',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0.sp,
                          color: greyTextColor,
                        ),
                      ),
                      SizedBox(
                        width: 2.0.w,
                      ),
                      SizedBox(
                        width: Get.width * 0.80,
                        child: Text(
                          'Anda sewaktu-waktu dapat menonaktifkan fitur Biometric Login melalui menu pengaturan.',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0.sp,
                            color: greyTextColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '5.',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0.sp,
                          color: greyTextColor,
                        ),
                      ),
                      SizedBox(
                        width: 2.0.w,
                      ),
                      SizedBox(
                        width: Get.width * 0.80,
                        child: Text(
                          'Anda bertanggung jawab atas keamanan seluruh sidik jari atau pengenalan wajah yang terdaftar/terekam/tersimpan dalam perangkat ponsel anda.',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0.sp,
                            color: greyTextColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '6.',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0.sp,
                          color: greyTextColor,
                        ),
                      ),
                      SizedBox(
                        width: 2.0.w,
                      ),
                      SizedBox(
                        width: Get.width * 0.80,
                        child: Text(
                          'Kami tidak bertanggung jawab atas segala kerugian yang timbul, baik materiil maupun immateriil, yang disebabkan karena ketidakhati-hatian dan/atau kecerobohan dan/atau kesalahan dan/atau penyalahgunaan yang dilakukan Anda dan/atau pihak lain terhadap sidik jari atau pengenalan wajah pada aplikasi',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0.sp,
                            color: greyTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  SizedBox(
                    width: 40.0.h,
                    height: 6.0.h,
                    child: ElevatedButton(
                      onPressed: () {
                        // Tombol Tidak Setuju diklik
                        // Tambahkan logika atau perpindahan layar di sini
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          primary: mainColor),
                      child: Text(
                        'Setuju',
                        style: TextStyle(color: whiteColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  SizedBox(
                    width: 40.0.h,
                    height: 6.0.h,
                    child: ElevatedButton(
                      onPressed: () {
                        // Tombol Tidak Setuju diklik
                        // Tambahkan logika atau perpindahan layar di sini
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        primary: whiteColor,
                      ),
                      child: Text(
                        'Tidak Setuju',
                        style: TextStyle(color: mainColor),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
