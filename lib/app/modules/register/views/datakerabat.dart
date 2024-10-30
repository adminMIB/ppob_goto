import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/modules/register/views/uploadktp_view.dart';
import 'package:sizer/sizer.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class DataKerabattView extends StatefulWidget {
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
  final File? foto_profile;

  DataKerabattView({
    Key? key,
    this.foto_profile,
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
  _DataKerabattViewState createState() => _DataKerabattViewState();
}

class _DataKerabattViewState extends State<DataKerabattView> {
  final formKey = GlobalKey<FormState>();
  var hubunganValue;
  // var nama = namaMerchant;
  List<String> kerabat = ["Berkeluarga", "keponakan", "kakak"];

  TextEditingController tlp_kerabat = TextEditingController();
  TextEditingController namalengkap = TextEditingController();
  TextEditingController alamat = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   var nama_Merchant = widget.namaMerchant;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Data Kerabat',
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
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 2.h, right: 2.h),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/kunci.png',
                  height: 10.h,
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Text(
                  'Pastikan Data yang anda masukan\n Benar!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dmSans(
                      color: mainColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp),
                ),
                SizedBox(
                  height: 1.0.h,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nama Lengkap',
                            style: GoogleFonts.dmSans(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          TextFormField(
                            controller: namalengkap,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: 'Masukkan Nama Lengkap',
                              hintStyle: GoogleFonts.dmSans(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 10.sp),
                            ),
                            validator: Validators.compose(
                              [
                                Validators.required(
                                    'Nama Lengkap harus di isi'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Text(
                            'Nomor Telepon',
                            style: GoogleFonts.dmSans(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          TextFormField(
                            minLines: 1,
                            maxLength: 13,
                            controller: tlp_kerabat,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: 'Masukkan No telepon',
                              hintStyle: GoogleFonts.dmSans(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 10.sp),
                            ),
                            validator: Validators.compose(
                              [
                                Validators.required('No telepon harus di isi'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Text(
                            'Alamat',
                            style: GoogleFonts.dmSans(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp),
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
                              hintStyle: GoogleFonts.dmSans(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 10.sp),
                            ),
                            validator: Validators.compose(
                              [
                                Validators.required('Alamat harus di isi'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            'Hubungan',
                            style: GoogleFonts.dmSans(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 0.7.h,
                          ),
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              // fillColor: Colors.grey.shade200,
                              // filled: true,
                              contentPadding:
                                  const EdgeInsets.only(right: 10, left: 10),
                              border: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: Colors.red),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            elevation: 1,
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Select hubungan antar';
                            //   } else {
                            //     return null;
                            //   }
                            // },
                            isExpanded: true,
                            hint: Text(
                              "Hubungan antar",
                              style: GoogleFonts.dmSans(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 10.sp),
                            ),
                            iconSize: 30,
                            iconEnabledColor: Colors.black,
                            icon: const Icon(
                              Icons.arrow_drop_down_sharp,
                              size: 15,
                            ),
                            value: hubunganValue,
                            items: kerabat
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: GoogleFonts.dmSans(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              print(value.toString());
                              setState(() {
                                hubunganValue = value;
                              });
                            },
                          ),
                          SizedBox(
                            height: 2.0.h,
                          ),
                          Center(
                            child: SizedBox(
                              width: Get.width,
                              height: 6.0.h,
                              child: ElevatedButton(
                                onPressed: () async {
                                  print('data : ${widget.foto_profile}');
                                  if (formKey.currentState!.validate()) {
                                    Get.to(UploadKTP(
                                      namaMerchant: widget.namaMerchant,
                                      nama_lengkap: widget.nama_lengkap,
                                      nik: widget.nik,
                                      alamat: widget.alamat,
                                      email: widget.email,
                                      nomer_tlp: widget.nomer_tlp,
                                      nama_kerabat: namalengkap.text,
                                      nomer_tlp_kerabat: tlp_kerabat.text,
                                      alamat_kerabat: alamat.text,
                                      status_kerabat: hubunganValue,
                                      foto_profile: widget.foto_profile,
                                    ));
                                  }
                                  // Get.to(UploadKTP());
                                  // print("masuk");
                                  // print(chosenValue);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: mainColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                child: Text(
                                  'Lanjut',
                                  style: TextStyle(
                                    fontSize: 14.0.sp,
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
