import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/modules/pin/views/setPin_view.dart';
import 'package:sizer/sizer.dart';

class FormIdView extends StatefulWidget {
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
  final XFile foto_ktp;

  const FormIdView({
    Key? key,
    required this.foto_ktp,
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
  _FormIdViewState createState() => _FormIdViewState();
}

class _FormIdViewState extends State<FormIdView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController konfirPassword = TextEditingController();
  bool _obscureTextBaru = true;
  bool _obscureTextKonfirmasi = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Buat Akun',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
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
                SizedBox(
                  height: 3.0.h,
                ),
                Image.asset(
                  'assets/images/kunci.png',
                  height: 90,
                ),
                SizedBox(
                  height: 2.0.h,
                ),
                Text(
                  'Pastikan Data yang anda masukan\n Benar!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Color(0xFFAEAEB1),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                // Text(
                //   'Benar!',
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontSize: 12.sp,
                //     color: Color(0xFFAEAEB1),
                //     fontWeight: FontWeight.w600,
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Username',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
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
                                hintText: 'Masukkan username',
                                hintStyle: TextStyle(
                                    fontSize: 12.0.sp,
                                    color: Colors.grey.shade500),
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
                              'Kata Sandi',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13.5.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            TextFormField(
                              minLines: 1,
                              controller: password,
                              obscureText: _obscureTextBaru,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                suffixIcon: IconButton(
                                  icon: _obscureTextBaru
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                  color: greyTextColor,
                                  onPressed: () {
                                    setState(() {
                                      _obscureTextBaru = !_obscureTextBaru;
                                    });
                                  },
                                ),
                                hintText: 'Masukkan Kata sandi',
                                hintStyle: TextStyle(
                                    fontSize: 12.0.sp,
                                    color: Colors.grey.shade500),
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
                              'Konfirmasi Kata Sandi',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13.5.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            TextFormField(
                              minLines: 1,
                              controller: konfirPassword,
                              obscureText: _obscureTextKonfirmasi,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                suffixIcon: IconButton(
                                  icon: _obscureTextKonfirmasi
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                  color: greyTextColor,
                                  onPressed: () {
                                    setState(() {
                                      _obscureTextKonfirmasi =
                                          !_obscureTextKonfirmasi;
                                    });
                                  },
                                ),
                                hintText: 'Masukkan konfirmasi sandi',
                                hintStyle: TextStyle(
                                    fontSize: 12.0.sp,
                                    color: Colors.grey.shade500),
                              ),
                              // validator: Validators.compose(
                              //   [
                              //     Validators.required('NIK harus di isi'),
                              //   ],
                              // ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.15,
                ),
                Text(
                  'Dengan mendaftar, saya telah menyetujui',
                  style: TextStyle(
                    fontSize: 12.sp,
                    letterSpacing: 0.75,
                    color: blackColor,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Ketentuan layanan',
                        style: TextStyle(
                          fontSize: 12.sp,
                          letterSpacing: 0.75,
                          color: mainColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            //fungsi
                          },
                      ),
                      TextSpan(
                        text: ' dan ',
                        style: TextStyle(
                          fontSize: 12.sp,
                          letterSpacing: 0.25,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'kebijakan kami',
                        style: TextStyle(
                          fontSize: 12.sp,
                          letterSpacing: 0.25,
                          color: mainColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            //fungsi
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Center(
                  child: SizedBox(
                    width: 44.0.h,
                    height: 6.0.h,
                    child: ElevatedButton(
                      onPressed: () async {
                        Dialogs.materialDialog(
                          customView: Image.asset(
                            'assets/images/pt4.png',
                            height: 17.0.h,
                          ),
                          msg:
                              'Apakah Data yang Anda isi sudah\nbenar & lengkap?',
                          msgStyle: TextStyle(
                            fontSize: 12.0.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          color: whiteColor,
                          context: context,
                          actions: [
                            IconsButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  print('data');

                                  Get.to(SetPinView(
                                    namaMerchant: widget.namaMerchant,
                                    nama_lengkap: widget.nama_lengkap,
                                    nik: widget.nik,
                                    email: widget.email,
                                    alamat: widget.alamat,
                                    nomer_tlp: widget.nomer_tlp,
                                    nama_kerabat: widget.nama_kerabat,
                                    nomer_tlp_kerabat: widget.nomer_tlp_kerabat,
                                    alamat_kerabat: widget.alamat_kerabat,
                                    status_kerabat: widget.status_kerabat,
                                    foto_ktp: widget.foto_ktp,
                                    username: username.text,
                                    password: password.text,
                                    confirm_password: konfirPassword.text,
                                  ));

                                  // await pushNewScreen(context,
                                  //     screen: SetPinView(
                                  //       namaMerchant: widget.namaMerchant,
                                  //       nama_lengkap: widget.nama_lengkap,
                                  //       nik: widget.nik,
                                  //       email: widget.email,
                                  //       alamat: widget.alamat,
                                  //       nomer_tlp: widget.nomer_tlp,
                                  //       nama_kerabat: widget.nama_kerabat,
                                  //       nomer_tlp_kerabat:
                                  //           widget.nomer_tlp_kerabat,
                                  //       alamat_kerabat: widget.alamat_kerabat,
                                  //       status_kerabat: widget.status_kerabat,
                                  //       foto_ktp: widget.foto_ktp,
                                  //       username: username.text,
                                  //       password: password.text,
                                  //       confirm_password: konfirPassword.text,
                                  //     ));
                                }
                              },
                              text: 'Yaa Sudah',
                              color: mainColor,
                              textStyle: TextStyle(
                                color: whiteColor,
                              ),
                            ),
                            IconsButton(
                              onPressed: () {
                                Get.back();
                              },
                              text: 'Cek lagi deh',
                              color: whiteColor,
                              textStyle: TextStyle(
                                color: mainColor,
                              ),
                            )
                          ],
                        );
                        // await showDialog(
                        //   context: context,
                        //   builder: (BuildContext context) => DialogRegistrasi(
                        //     username: username.text,
                        //     password: password.text,
                        //     confirm_password: konfirPassword.text,
                        //   ),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Lanjutkan',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFDF8F8),
                        ),
                      ),
                    ),
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
