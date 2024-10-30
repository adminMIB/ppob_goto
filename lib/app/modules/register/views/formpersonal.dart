import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppob_mpay1/app/modules/register/views/upload_profile.dart';
import 'package:sizer/sizer.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import '../../../data/colors.dart';
import '../controllers/register_controller.dart';
import 'datakerabat.dart';

class FormPersonalView extends StatefulWidget {
  final String? namaMerchant;
  final String? nama_lengkap;
  final String? nik;
  final String? alamat;
  final String? nomer_tlp;
  final String? email;
  FormPersonalView({
    Key? key,
    this.namaMerchant,
    this.nama_lengkap,
    this.nik,
    this.alamat,
    this.nomer_tlp,
    this.email,
  }) : super(key: key);

  @override
  _FormPersonalViewState createState() => _FormPersonalViewState();
}

class _FormPersonalViewState extends State<FormPersonalView> {
  final registrasiController = RegisterController();
  final _formKey = GlobalKey<FormState>();
  DateTime now = DateTime.now();
  DateTime? firstDay;
  String? formattedDateStart;
  String? valueDateStart;

  int activeStep = 0;
  int upperBound = 1;
  int dotCount = 2;

  TextEditingController merchant = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController nik = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController ibukandung = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController kota = TextEditingController();
  TextEditingController alamat_toko = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Buat Akun',
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
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 2.h,
              right: 2.h,
              bottom: 2.h,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 1.5.h,
                ),
                Image.asset(
                  'assets/images/kunci.png',
                  height: 10.0.h,
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Text(
                  'Pastikan Data yang anda masukan\n Benar! ',
                  textAlign: TextAlign.center,
                  // style: TextStyle(
                  //   fontSize: 12.0.sp,
                  //   color: Color(0xFFAEAEB1),
                  //   fontWeight: FontWeight.w600,
                  // ),
                  style: GoogleFonts.dmSans(
                    fontSize: 13.sp,
                    color: mainColor,
                    fontWeight: FontWeight.w600,
                  ),
                  // textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nama Merchant',
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
                              controller: merchant,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: 'Masukkan Merchant',
                                hintStyle: GoogleFonts.dmSans(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 10.sp),
                              ),
                              validator: Validators.compose(
                                [
                                  Validators.required(
                                      'Nama merchant harus di isi'),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 1.0.h,
                            ),
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
                              minLines: 1,
                              controller: name,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: 'Masukkan Nama lengkap',
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
                              height: 1.0.h,
                            ),
                            Text(
                              'NIK',
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
                              controller: nik,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: 'Masukkan NIK',
                                hintStyle: GoogleFonts.dmSans(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 10.sp),
                              ),
                              validator: Validators.compose(
                                [
                                  Validators.required('NIK harus di isi'),
                                ],
                              ),
                            ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // Text(
                            //   'Tanggal Lahir',
                            //   style: TextStyle(
                            //     color: Colors.grey,
                            //     fontSize: 16,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 5,
                            // ),
                            // TextFormField(
                            //   readOnly: true,
                            //   onTap: () async {
                            //     DateTime? newDateTime =
                            //         await showRoundedDatePicker(
                            //       initialDate: firstDay,
                            //       firstDate: DateTime(1960, 1),
                            //       lastDate: firstDay,
                            //       context: context,
                            //       theme: ThemeData(
                            //         primaryColor: mainColor,
                            //         colorScheme: ColorScheme.fromSwatch()
                            //             .copyWith(secondary: mainColor),
                            //       ),
                            //     );
                            //     if (newDateTime != null) {
                            //       setState(() {
                            //         formattedDateStart =
                            //             DateFormat('dd-MM-yyyy')
                            //                 .format(newDateTime);
                            //         valueDateStart = DateFormat('dd-MM-yyyy')
                            //             .format(newDateTime);
                            //       });
                            //     }
                            //   },
                            //   decoration: InputDecoration(
                            //     hintText: formattedDateStart,
                            //     contentPadding: EdgeInsets.symmetric(
                            //       horizontal: 2.w + 1.2.h,
                            //       vertical: 2.h,
                            //     ),
                            //     filled: true,
                            //     fillColor: Colors.grey.shade200,
                            //     enabledBorder: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(10.0),
                            //       borderSide: BorderSide(color: Colors.grey),
                            //     ),
                            //     focusedBorder: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(10.0),
                            //       borderSide: BorderSide(color: Colors.grey),
                            //     ),
                            //   ),
                            // ),
                            SizedBox(
                              height: 1.0.h,
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
                              'Email',
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
                              controller: email,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: 'Masukkan email',
                                hintStyle: GoogleFonts.dmSans(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 10.sp),
                              ),
                              validator: Validators.compose(
                                [
                                  Validators.required('email harus di isi'),
                                ],
                              ),
                            ),

                            // TextFormField(
                            //   readOnly: true,
                            //   minLines: 1,
                            //   decoration: InputDecoration(
                            //     border: OutlineInputBorder(
                            //       borderSide: BorderSide(color: Colors.grey),
                            //       borderRadius: BorderRadius.circular(10.0),
                            //     ),
                            //     hintText: widget.email,
                            //     hintStyle: TextStyle(
                            //         fontSize: 10.0.sp,
                            //         color: Colors.grey.shade500),
                            //   ),
                            // validator: Validators.compose(
                            //   [
                            //     Validators.required('NIK harus di isi'),
                            //   ],
                            // ),
                            SizedBox(
                              height: 1.0.h,
                            ),
                            Text(
                              'No Telepon',
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
                              controller: phone,
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
                                  Validators.required(
                                      'No telepon harus di isi'),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 1.0.h,
                            ),
                            // Text(
                            //   'Kota',
                            //   style: GoogleFonts.dmSans(
                            //       color: Colors.grey.shade600,
                            //       fontWeight: FontWeight.w600,
                            //       fontSize: 12.sp),
                            // ),
                            // SizedBox(
                            //   height: 0.5.h,
                            // ),
                            // TextFormField(
                            //   minLines: 1,
                            //   controller: kota,
                            //   decoration: InputDecoration(
                            //     border: OutlineInputBorder(
                            //       borderSide: BorderSide(color: Colors.grey),
                            //       borderRadius: BorderRadius.circular(10.0),
                            //     ),
                            //     hintText: 'Masukkan kota',
                            //     hintStyle: TextStyle(
                            //         fontSize: 11.0.sp,
                            //         color: Colors.grey.shade500),
                            //   ),
                            //   validator: Validators.compose(
                            //     [
                            //       Validators.required('kota harus di isi'),
                            //     ],
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 1.h,
                            // ),
                            // Text(
                            //   'Alamat Toko',
                            //   style: GoogleFonts.dmSans(
                            //       color: Colors.grey.shade600,
                            //       fontWeight: FontWeight.w600,
                            //       fontSize: 12.sp),
                            // ),
                            // SizedBox(
                            //   height: 0.5.h,
                            // ),
                            // TextFormField(
                            //   minLines: 1,
                            //   controller: alamat_toko,
                            //   decoration: InputDecoration(
                            //     border: OutlineInputBorder(
                            //       borderSide: BorderSide(color: Colors.grey),
                            //       borderRadius: BorderRadius.circular(10.0),
                            //     ),
                            //     hintText: 'Masukkan alamat toko',
                            //     hintStyle: TextStyle(
                            //         fontSize: 11.0.sp,
                            //         color: Colors.grey.shade500),
                            //   ),
                            //   validator: Validators.compose(
                            //     [
                            //       Validators.required(
                            //           'alamat toko harus di isi'),
                            //     ],
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 2.0.h,
                            // ),

                            Center(
                              child: SizedBox(
                                width: 44.0.h,
                                height: 6.0.h,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      // Get.to(DataKerabattView(
                                      //   namaMerchant: merchant.text,
                                      //   nama_lengkap: name.text,
                                      //   nik: nik.text,
                                      //   alamat: alamat.text,
                                      //   nomer_tlp: phone.text,
                                      //   // email: widget.email,
                                      //   email: email.text,
                                      // ));
                                      Get.to(Upload_profile(
                                        namaMerchant: merchant.text,
                                        nama_lengkap: name.text,
                                        nik: nik.text,
                                        alamat: alamat.text,
                                        nomer_tlp: phone.text,
                                        // email: widget.email,
                                        email: email.text,
                                      ));
                                      // await pushNewScreen(context,
                                      //     screen: DataKerabattView(
                                      //       namaMerchant: merchant.text,
                                      //       nama_lengkap: name.text,
                                      //       nik: nik.text,
                                      //       alamat: alamat.text,
                                      //       nomer_tlp: phone.text,
                                      //       email: widget.email,
                                      //     ));
                                    }
                                    // Get.to(UploadKTP());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: mainColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  child: Text(
                                    'Lanjut',
                                    style: GoogleFonts.dmSans(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
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
