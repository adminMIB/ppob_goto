import 'dart:io';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/data/urlServices.dart';
import 'package:ppob_mpay1/app/modules/akun/controllers/akun_controller.dart';
import 'package:ppob_mpay1/app/modules/akun/views/profilefield_view.dart';
import 'package:ppob_mpay1/app/modules/home/controllers/home_controller.dart';
import 'package:ppob_mpay1/main.dart';
import 'package:sizer/sizer.dart';

class Datapersonalview extends StatefulWidget {
  String? email;
  Datapersonalview({Key? key, this.email}) : super(key: key);

  @override
  _DatapersonalviewState createState() => _DatapersonalviewState();
}

class _DatapersonalviewState extends State<Datapersonalview> {
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

  @override
  void initState() {
    super.initState();
    akunController.profile(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Container(), // Kosongkan title
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    child: Text(
                      'Edit perubahan data',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0.sp),
                    ),
                    onTap: () {
                      Get.to(ProfilefieldView());
                    },
                  )),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(2.0.h, 1.0.h, 2.0.h, 2.0.h),
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: Center(
                      child: Stack(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(60.0),
                            child: Obx(
                              () => akunController
                                              .userProfile['foto_profile'] ==
                                          null ||
                                      akunController
                                              .userProfile['foto_profile'] ==
                                          ''
                                  ? Image.asset(
                                      'assets/images/orang1.png',
                                      width: 120.0,
                                      height: 120.0,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      UrlListService.baseUrl +
                                          akunController
                                              .userProfile['foto_profile'],
                                      width: 120.0,
                                      height: 120.0,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            // image1 == null
                            //     ? Image.asset(
                            //         'assets/images/orang1.png',
                            //         width: 120.0,
                            //         height: 120.0,
                            //         fit: BoxFit.cover,
                            //       )
                            //     : Image.file(
                            //         File(image1!.path),
                            //         width: 120.0,
                            //         height: 120.0,
                            //         fit: BoxFit.cover,
                            //       ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Data Personal',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Nama Lengkap',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        // '${akunController.userProfile}'
                        akunController.userProfile['nama_lengkap'],
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 1.0.h,
                      ),
                      Divider(
                        color: Colors.grey.shade700,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        'Username',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 1.0.h,
                      ),
                      Text(
                        '${akunController.userProfile['username']}',
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Divider(
                        color: Colors.grey.shade700,
                      ),
                      SizedBox(
                        height: 1.0.h,
                      ),
                      Text(
                        'Email',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 1.0.h,
                      ),
                      Text(
                        '${akunController.userProfile['email']}',
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Divider(
                        color: Colors.grey.shade700,
                      ),
                      SizedBox(
                        height: 1.0.h,
                      ),
                      Text(
                        'Nomor Telepon',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 1.0.h,
                      ),
                      Text(
                        '${akunController.userProfile['nomor_telepon']}',
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Divider(
                        color: Colors.grey.shade700,
                        // thickness: 1,
                      ),
                      // SizedBox(
                      //   height: 1.0.h,
                      // ),
                      Text(
                        'NIK',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 1.0.h,
                      ),
                      Text(
                        '${akunController.userProfile['nik']}',
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Divider(
                        color: Colors.grey.shade700,
                      ),
                      SizedBox(
                        height: 1.0.h,
                      ),
                      Text(
                        'Alamat',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 1.0.h,
                      ),
                      Text(
                        '${akunController.userProfile['alamat']}',
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Divider(
                        color: Colors.grey.shade700,
                      ),
                      SizedBox(
                        height: 3.0.h,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        )),
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
