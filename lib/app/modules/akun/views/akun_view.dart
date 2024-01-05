import 'dart:io';

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/data/urlServices.dart';
import 'package:ppob_mpay1/app/modules/akun/views/coba_view.dart';
import 'package:ppob_mpay1/app/modules/akun/views/profile_view.dart';
import 'package:ppob_mpay1/app/modules/akun/views/profilefield_view.dart';
import 'package:ppob_mpay1/app/modules/fingerprint/views/fingerprint_view.dart';
import 'package:ppob_mpay1/app/modules/login/views/login_view.dart';
import 'package:ppob_mpay1/app/modules/lupapassword/views/lupapassword_view.dart';
import 'package:sizer/sizer.dart';

import '../controllers/akun_controller.dart';

class AkunView extends StatefulWidget {
  AkunView({
    Key? key,
  }) : super(key: key);

  @override
  AkunViewState createState() => AkunViewState();
}

class AkunViewState extends State<AkunView> {
  final AkunController akunController = Get.put(AkunController());
  final HelperController helperController = Get.put(HelperController());
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
      ? userNamalengkap.trim().split(' ').map((l) => l[0]).take(2).join()
      : '';

  @override
  void initState() {
    super.initState();
    akunController.profile(context);
  }
  // void initState() {
  //   super.initState();
  //   // Panggil fungsi profile ketika widget diinisialisasi
  //   akunController.profile(context);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     color: Colors.black,
        //   ),
        //   onPressed: () {
        //     Get.back();
        //   },
        // ),
        title: Text(
          'Akun',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.0.sp,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  Stack(
                    children: <Widget>[
                      CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.grey.shade300,
                          child: Text(
                            getInitials(
                              pref.read('nama_lengkap'),
                            ),
                            style: TextStyle(
                                color: mainColor,
                                fontSize: 29.0.sp,
                                fontWeight: FontWeight.bold),
                          )),
                      // ClipRRect(
                      //   borderRadius: BorderRadius.circular(60.0),
                      //   child: Obx(
                      //     () => akunController.userProfile['foto_profile'] ==
                      //                 null ||
                      //             akunController.userProfile['foto_profile'] ==
                      //                 ''
                      //         ? Image.asset(
                      //             'assets/images/orang1.png',
                      //             width: 120.0,
                      //             height: 120.0,
                      //             fit: BoxFit.cover,
                      //           )
                      //         : Image.network(
                      //             UrlListService.baseUrl +
                      //                 akunController
                      //                     .userProfile['foto_profile'],
                      //             width: 120.0,
                      //             height: 120.0,
                      //             fit: BoxFit.cover,
                      //           ),
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Text(
                    '${pref.read('nama_lengkap')}',
                    // '${controller.userProfile['profile']['alamat'] ?? "Alamat tidak tersedia"}',
                    style: TextStyle(fontSize: 14.0.sp),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 2.0.h,
            ),
            Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 2.0.h),
                  leading: Container(
                    padding: EdgeInsets.all(2.0),
                    child: Image.asset(
                      'assets/images/profile.jpg',
                      height: 4.0.h,
                    ),
                  ),
                  title: Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 12.0.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onTap: () async {
                    // await Future.delayed(Duration(milliseconds: 2000));

                    Get.to(ProfileView());
                    // Get.to(CobaView());
                  },
                ),
                Divider(
                  color: Colors.grey.shade400,
                  indent: 2.h,
                  endIndent: 2.h,
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 2.0.h),
                  leading: Container(
                    padding: EdgeInsets.all(2.0),
                    child: Image.asset(
                      'assets/images/password.jpeg',
                      height: 4.0.h,
                    ),
                  ),
                  title: Text(
                    'Ubah Kata Sandi',
                    style: TextStyle(
                      fontSize: 12.0.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onTap: () {
                    Get.to(LupapasswordView());
                  },
                ),
                Divider(
                  color: Colors.grey.shade400,
                  indent: 2.h,
                  endIndent: 2.h,
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 2.0.h),
                  leading: Container(
                    padding: EdgeInsets.all(2.0),
                    child: Image.asset(
                      'assets/images/photo1701835614.jpeg',
                      height: 4.0.h,
                    ),
                  ),
                  title: Text(
                    'FingerPrint',
                    style: TextStyle(
                      fontSize: 12.0.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onTap: () {
                    Get.to(FingerprintView());
                  },
                ),
                Divider(
                  color: Colors.grey.shade400,
                  indent: 2.h,
                  endIndent: 2.h,
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 2.0.h),
                  leading: Container(
                    padding: EdgeInsets.all(2.0),
                    child: Image.asset(
                      'assets/images/gembok.jpeg',
                      height: 4.0.h,
                    ),
                  ),
                  title: Text(
                    'MPIN',
                    style: TextStyle(
                      fontSize: 12.0.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onTap: () {},
                ),
                Divider(
                  color: Colors.grey.shade400,
                  indent: 2.h,
                  endIndent: 2.h,
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 2.0.h),
                  leading: Container(
                    padding: EdgeInsets.all(2.0),
                    child: Image.asset(
                      'assets/images/photo1701835614.jpeg',
                      height: 4.0.h,
                    ),
                  ),
                  title: Text(
                    'Syarat dan Ketentuan',
                    style: TextStyle(
                      fontSize: 12.0.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onTap: () {},
                ),
                Divider(
                  color: Colors.grey.shade400,
                  indent: 2.h,
                  endIndent: 2.h,
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 2.0.h),
                  leading: Container(
                    padding: EdgeInsets.all(2.0),
                    child: Image.asset(
                      'assets/images/koin.png',
                      height: 4.0.h,
                    ),
                  ),
                  title: Text(
                    'Reward',
                    style: TextStyle(
                      fontSize: 12.0.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onTap: () {},
                ),
                Divider(
                  color: Colors.grey.shade400,
                  indent: 2.h,
                  endIndent: 2.h,
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 2.0.h),
                  leading: Container(
                    padding: EdgeInsets.all(2.0),
                    child: Image.asset(
                      'assets/images/keluar.png',
                      height: 4.0.h,
                    ),
                  ),
                  title: Text(
                    'Keluar',
                    style: TextStyle(
                      fontSize: 12.0.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onTap: () {
                    Dialogs.materialDialog(
                      // customView: Image.asset(
                      //   'assets/images/pt4.png',
                      //   height: 17.0.h,
                      // ),
                      title: 'Ingin keluar',
                      titleStyle: TextStyle(
                          fontSize: 13.0.sp, fontWeight: FontWeight.w500),
                      msg: ' Pastikan aktivitas kamu sudah selesai',
                      msgStyle: TextStyle(
                        fontSize: 11.0.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      msgAlign: TextAlign.center,
                      color: whiteColor,
                      context: context,
                      actions: [
                        IconsButton(
                          onPressed: () async {
                            Get.offAll(const LoginView());
                          },
                          text: 'Ya, Keluar',
                          color: mainColor,
                          textStyle: TextStyle(
                            color: whiteColor,
                          ),
                        ),
                        IconsButton(
                          onPressed: () {
                            Get.back();
                          },
                          text: 'Tidak jadi deh',
                          color: whiteColor,
                          textStyle: TextStyle(
                            color: mainColor,
                          ),
                        )
                      ],
                    );
                  },
                ),
                Divider(
                  color: Colors.grey.shade400,
                  indent: 2.h,
                  endIndent: 2.h,
                ),
              ],
            )
          ],
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
                        Icons.photo_library,
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
