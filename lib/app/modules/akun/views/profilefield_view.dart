import 'dart:io';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/main.dart';
import 'package:sizer/sizer.dart';

class ProfilefieldView extends StatefulWidget {
  String? email;
  ProfilefieldView({Key? key, this.email}) : super(key: key);

  @override
  _ProfilefieldViewState createState() => _ProfilefieldViewState();
}

class _ProfilefieldViewState extends State<ProfilefieldView> {
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
        title: Text(
          'Akun',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.0.sp,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(2.0.h, 1.0.h, 2.0.h, 2.0.h),
            child: Column(
              children: [
                Center(
                  child: Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60.0),
                        child: image1 == null
                            ? Image.asset(
                                'assets/images/orang1.png',
                                width: 120.0,
                                height: 120.0,
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                File(image1!.path),
                                width: 120.0,
                                height: 120.0,
                                fit: BoxFit.cover,
                              ),
                      ),
                      Positioned(
                        bottom: 1.0.h,
                        right: 1.5.w,
                        child: InkWell(
                            onTap: () {
                              showFlexibleBottomSheet(
                                minHeight: 0,
                                initHeight: 0.5,
                                maxHeight: 0.5,
                                context: context,
                                builder: bottomsheet,
                                isExpand: false,
                              );
                            },
                            child: Container(
                              width: 10.0.w,
                              height: 10.0.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.grey.shade700,
                                  size: 28.0,
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.0.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama Lengkap',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFormField(
                      minLines: 1,
                      // controller: name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Nama Lengkap',
                        hintStyle: TextStyle(
                            fontSize: 10.0.sp, color: Colors.grey.shade500),
                      ),
                      // validator: Validators.compose(
                      //   [
                      //     Validators.required('Nama Lengkap harus di isi'),
                      //   ],
                      // ),
                    ),
                    SizedBox(
                      height: 1.0.h,
                    ),
                    Text(
                      'NIK',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFormField(
                      minLines: 1,
                      // controller: nik,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Masukkan NIK',
                        hintStyle: TextStyle(
                            fontSize: 10.0.sp, color: Colors.grey.shade500),
                      ),
                      // validator: Validators.compose(
                      //   [
                      //     Validators.required('NIK harus di isi'),
                      //   ],
                      // ),
                    ),
                    SizedBox(
                      height: 1.0.h,
                    ),
                    Text(
                      'Alamat',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFormField(
                      minLines: 3,
                      maxLines: 5,
                      // controller: alamat,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Masukkan Alamat',
                        hintStyle: TextStyle(
                            fontSize: 10.0.sp, color: Colors.grey.shade500),
                      ),
                      // validator: Validators.compose(
                      //   [
                      //     Validators.required('Alamat harus di isi'),
                      //   ],
                      // ),
                    ),
                    SizedBox(
                      height: 1.0.h,
                    ),
                    Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFormField(
                      minLines: 1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        // hintText: widget.email,
                        hintStyle: TextStyle(
                            fontSize: 10.0.sp, color: Colors.grey.shade500),
                      ),
                      // validator: Validators.compose(
                      //   [
                      //     Validators.required('NIK harus di isi'),
                      //   ],
                      // ),
                    ),
                    SizedBox(
                      height: 1.0.h,
                    ),
                    Text(
                      'No Telepon',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFormField(
                      minLines: 1,
                      maxLength: 13,
                      // controller: phone,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Masukkan No telepon',
                        hintStyle: TextStyle(
                            fontSize: 10.0.sp, color: Colors.grey.shade500),
                      ),
                      // validator: Validators.compose(
                      //   [
                      //     Validators.required(
                      //         'No telepon harus di isi'),
                      //   ],
                      // ),
                    ),
                    SizedBox(
                      height: 2.0.h,
                    ),
                    Center(
                      child: SizedBox(
                        width: 44.0.h,
                        height: 6.0.h,
                        child: ElevatedButton(
                          onPressed: () async {},
                          style: ElevatedButton.styleFrom(
                            primary: mainColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text(
                            'Simpan perubahan',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFDF8F8),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
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
