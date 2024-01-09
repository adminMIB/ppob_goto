import 'dart:io';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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

class ProfileView extends StatefulWidget {
  String? email;
  ProfileView({Key? key, this.email}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: Get.height * 0.08,
                // color: Colors.amber,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(right: 1.5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Text(
                            'Profile',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
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
                              style: TextStyle(
                                  color: mainColor,
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 2.0.h, right: 2.0.h),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 2.0.h,
                      ),
                      InkWell(
                        onTap: () {
                          Get.off(FieldmerchantView());
                        },
                        child: Container(
                          height: 6.h,
                          // width: Get.width * 0.90,
                          decoration: BoxDecoration(
                            color: oceanColor,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 1.5.h,
                              right: 1.0.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Data Merchant',
                                  style: TextStyle(
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Icon(Icons.keyboard_arrow_right),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Nama Merchant',
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Obx(
                                  () => Text(
                                    // '${akunController.userProfile}'
                                    '${akunController.merchant['nama_merchant']}',
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Alamat Toko',
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Obx(
                                  () => Text(
                                    // '${akunController.userProfile}'
                                    '${akunController.merchant['alamat_toko']}',
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.0.h,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 2.0.h,
                          ),
                          InkWell(
                            onTap: () {
                              Get.off(ProfilefieldView());
                            },
                            child: Container(
                              height: 6.h,
                              // width: Get.width * 0.90,
                              decoration: BoxDecoration(
                                color: oceanColor,
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
                                      'Data Personal',
                                      style: TextStyle(
                                        fontSize: 12.0.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Icon(Icons.keyboard_arrow_right),
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
                                      'Nama Lengkap',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Obx(
                                      () => Text(
                                        // '${akunController.userProfile}'
                                        '${akunController.userProfile['nama_lengkap']}',
                                        style: TextStyle(
                                          color: blackColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Username',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Obx(
                                      () => Text(
                                        // '${akunController.userProfile}'
                                        '${akunController.userProfile['username']}',
                                        style: TextStyle(
                                          color: blackColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Email',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Obx(
                                      () => Text(
                                        '${akunController.userProfile['email']}',
                                        style: TextStyle(
                                          color: blackColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Nomor Telepon',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Obx(
                                      () => Text(
                                        // '${akunController.userProfile}'
                                        '${akunController.userProfile['nomor_telepon']}',
                                        style: TextStyle(
                                          color: blackColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Alamat',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Obx(
                                      () => Text(
                                        // '${akunController.userProfile}'
                                        '${akunController.userProfile['alamat']}',
                                        style: TextStyle(
                                          color: blackColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Kota',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Obx(
                                      () => Text(
                                        // '${akunController.userProfile}'
                                        '${akunController.userProfile['kota']}',
                                        style: TextStyle(
                                          color: blackColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'NIK',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Obx(
                                      () => Text(
                                        // '${akunController.userProfile}'
                                        '${akunController.userProfile['nik']}',
                                        style: TextStyle(
                                          color: blackColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.0.h,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                              height: 6.h,
                              // width: Get.width * 0.90,
                              decoration: BoxDecoration(
                                color: oceanColor,
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
                                      style: TextStyle(
                                        fontSize: 12.0.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Icon(Icons.keyboard_arrow_right),
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
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Obx(
                                      () => Text(
                                        // '${akunController.userProfile}'
                                        '${akunController.kerabat['namaKerabat']}',
                                        style: TextStyle(
                                          color: blackColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Alamat Kerabat',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Obx(
                                      () => Text(
                                        // '${akunController.userProfile}'
                                        '${akunController.kerabat['alamat_kerabat']}',
                                        style: TextStyle(
                                          color: blackColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Status Kerabat',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Obx(
                                      () => Text(
                                        // '${akunController.userProfile}'
                                        '${akunController.kerabat['status_kerabat']}',
                                        style: TextStyle(
                                          color: blackColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'No Telepon Kerabat',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Obx(
                                      () => Text(
                                        // '${akunController.userProfile}'
                                        '${akunController.kerabat['nomer_tlp_kerabat']}',
                                        style: TextStyle(
                                          color: blackColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
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
