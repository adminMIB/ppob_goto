import 'dart:io';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/data/urlServices.dart';
import 'package:ppob_mpay1/app/modules/akun/controllers/akun_controller.dart';
import 'package:ppob_mpay1/main.dart';
import 'package:sizer/sizer.dart';

class ProfilefieldView extends StatefulWidget {
  String? nama_kerabat;
  String? nomer_tlp_kerabat;
  String? alamat_kerabat;
  String? status_kerabat;
  String? foto_profile;
  String? namaMerchant;
  String? kota;
  String? alamat_toko;
  ProfilefieldView(
      {Key? key,
      this.nama_kerabat,
      this.nomer_tlp_kerabat,
      this.alamat_kerabat,
      this.status_kerabat,
      this.foto_profile,
      this.namaMerchant,
      this.kota,
      this.alamat_toko})
      : super(key: key);

  @override
  _ProfilefieldViewState createState() => _ProfilefieldViewState();
}

class _ProfilefieldViewState extends State<ProfilefieldView> {
  String getInitials(String userNamalengkap) => userNamalengkap.isNotEmpty
      ? userNamalengkap
          .trim()
          .split(' ')
          .map((l) => l[0])
          .take(2)
          .join()
          .toUpperCase()
      : '';
  final akunController = Get.put(AkunController());

  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController nomer_tlp = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController nik = TextEditingController();
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
    name.text = akunController.userProfile['nama_lengkap'] ?? '';
    username.text = akunController.userProfile['username'] ?? '';
    email.text = akunController.userProfile['email'] ?? '';
    nomer_tlp.text = akunController.userProfile['nomor_telepon'] ?? '';
    alamat.text = akunController.userProfile['alamat'] ?? '';
    nik.text = akunController.userProfile['nik'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: mainColor,
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(2.0.h, 1.0.h, 2.0.h, 2.0.h),
            child: Column(
              children: [
                Center(
                  child: Stack(
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
                      //   //  image1 == null
                      //   //     ? Image.asset(
                      //   //         'assets/images/orang1.png',
                      //   //         width: 120.0,
                      //   //         height: 120.0,
                      //   //         fit: BoxFit.cover,
                      //   //       )
                      //   //     : Image.file(
                      //   //         File(image1!.path),
                      //   //         width: 120.0,
                      //   //         height: 120.0,
                      //   //         fit: BoxFit.cover,
                      //   //       ),
                      // ),
                      // Positioned(
                      //   bottom: 1.0.h,
                      //   right: 1.5.w,
                      //   child: InkWell(
                      //       onTap: () {
                      //         showFlexibleBottomSheet(
                      //           minHeight: 0,
                      //           initHeight: 0.5,
                      //           maxHeight: 0.5,
                      //           context: context,
                      //           builder: bottomsheet,
                      //           isExpand: false,
                      //         );
                      //       },
                      //       child: Container(
                      //         width: 10.0.w,
                      //         height: 10.0.w,
                      //         decoration: BoxDecoration(
                      //           shape: BoxShape.circle,
                      //           color: Colors.white,
                      //           boxShadow: [
                      //             BoxShadow(
                      //               color: Colors.grey.withOpacity(0.5),
                      //               spreadRadius: 2,
                      //               blurRadius: 4,
                      //               offset: Offset(0, 2),
                      //             ),
                      //           ],
                      //         ),
                      //         child: Center(
                      //           child: Icon(
                      //             Icons.camera_alt,
                      //             color: Colors.grey.shade700,
                      //             size: 28.0,
                      //           ),
                      //         ),
                      //       )),
                      // ),
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
                      controller: name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Masukkan Nama Lengkap',
                        hintStyle: TextStyle(
                            fontSize: 10.0.sp, color: Colors.grey.shade500),
                      ),
                      //   initialValue:
                      //       akunController.userProfile['nama_lengkap'] ?? '',
                    ),
                    SizedBox(
                      height: 1.0.h,
                    ),
                    Text(
                      'Username',
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
                      controller: username,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'masukkan username',
                        hintStyle: TextStyle(
                            fontSize: 10.0.sp, color: Colors.grey.shade500),
                      ),
                      // initialValue:
                      //     akunController.userProfile['username'] ?? '',
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
                      controller: email,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: ' Masukkan email',
                        hintStyle: TextStyle(
                            fontSize: 10.0.sp, color: Colors.grey.shade500),
                      ),
                      // initialValue: akunController.userProfile['email'] ?? '',
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
                      controller: nomer_tlp,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Masukkan Nomor telepon',
                        hintStyle: TextStyle(
                            fontSize: 10.0.sp, color: Colors.grey.shade500),
                      ),
                      // initialValue: akunController.userProfile['nik'] ?? '',
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
                      controller: nik,
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
                      // initialValue: akunController.userProfile['nik'] ?? '',
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
                      controller: alamat,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Masukkan Alamat',
                        hintStyle: TextStyle(
                            fontSize: 10.0.sp, color: Colors.grey.shade500),
                      ),
                      // initialValue: akunController.userProfile['alamat'] ?? '',
                    ),
                    SizedBox(
                      height: 2.0.h,
                    ),
                    Center(
                      child: SizedBox(
                        width: 45.0.h,
                        height: 6.0.h,
                        child: ElevatedButton(
                          onPressed: () async {
                            await akunController.updateprofile(
                                name.text,
                                username.text,
                                email.text,
                                nomer_tlp.text,
                                alamat.text,
                                widget.nama_kerabat,
                                widget.nomer_tlp_kerabat,
                                widget.alamat_kerabat,
                                widget.status_kerabat,
                                nik.text,
                                // widget.foto_profile,
                                widget.namaMerchant,
                                widget.kota,
                                widget.alamat_toko,
                                context);
                          },
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
