import 'dart:io';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/modules/akun/controllers/akun_controller.dart';
import 'package:ppob_mpay1/main.dart';
import 'package:sizer/sizer.dart';

class FieldmerchantView extends StatefulWidget {
  String? nama_lengkap;
  String? username;
  String? email;
  String? nomer_tlp;
  String? alamat;
  String? nama_kerabat;
  String? nomer_tlp_kerabat;
  String? alamat_kerabat;
  String? status_kerabat;
  String? nik;
  String? foto_profile;
  String? kota;
  FieldmerchantView(
      {Key? key,
      this.nama_lengkap,
      this.username,
      this.email,
      this.nomer_tlp,
      this.alamat,
      this.nama_kerabat,
      this.nomer_tlp_kerabat,
      this.alamat_kerabat,
      this.status_kerabat,
      this.nik,
      this.foto_profile,
      this.kota})
      : super(key: key);

  @override
  _FieldmerchantViewState createState() => _FieldmerchantViewState();
}

class _FieldmerchantViewState extends State<FieldmerchantView> {
  final akunController = Get.put(AkunController());

  TextEditingController namaMerchant = TextEditingController();
  TextEditingController alamatMerchant = TextEditingController();
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
    namaMerchant.text = akunController.merchant['nama_merchant'] ?? '';
    alamatMerchant.text = akunController.merchant['alamat_toko'] ?? '';
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
          'Edit Data merchant',
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama Merchant',
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
                      controller: namaMerchant,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Masukkan Nama Merchant',
                        hintStyle: TextStyle(
                            fontSize: 10.0.sp, color: Colors.grey.shade500),
                      ),
                    ),
                    SizedBox(
                      height: 1.0.h,
                    ),
                    Text(
                      'Alamat Toko',
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
                      controller: alamatMerchant,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Masukkan Alamat Toko',
                        hintStyle: TextStyle(
                            fontSize: 10.0.sp, color: Colors.grey.shade500),
                      ),
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
                                widget.nama_lengkap,
                                widget.username,
                                widget.email,
                                widget.nomer_tlp,
                                widget.alamat,
                                widget.nama_kerabat,
                                widget.nomer_tlp_kerabat,
                                widget.alamat_kerabat,
                                widget.status_kerabat,
                                widget.nik,
                                // widget.foto_profile,
                                namaMerchant.text,
                                widget.kota,
                                alamatMerchant.text,
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
