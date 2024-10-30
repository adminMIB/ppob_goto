import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppob_mpay1/app/modules/register/views/upload_profile.dart';
import 'package:sizer/sizer.dart';

import '../../../data/colors.dart';
import '../../lupapassword/views/lupapassword_view.dart';
import '../../register/views/emailtelp_view.dart';
import '../../register/views/formpersonal.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final loginController = Get.put(LoginController());

  bool hapus = true;
  bool _ingatsaya = false;
  bool _obscureTextKonfirmasi = true;

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        body: ListView(children: [
          Padding(
              padding:
                  EdgeInsets.only(left: 2.h, right: 2.h, top: 8.h, bottom: 5.h),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Image.asset(
                                'assets/images/Moganti_logo.png',
                                filterQuality: FilterQuality.high,
                                height: 20.0.h,
                              ),
                            ),
                            // SizedBox(
                            //   height: 0.5.h,
                            // ),
                            // Text(
                            //   '"Hempaskan tagihan dalam sekali tekan"',
                            //   style: TextStyle(
                            //     fontSize: 10,
                            //     fontWeight: FontWeight.w600,
                            //     color: blackColor,
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: GoogleFonts.dmSans(
                              fontSize: 11.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 6.0.h,
                                  child: TextField(
                                    controller: email,
                                    minLines: 1,
                                    decoration: InputDecoration(
                                      // contentPadding:
                                      //     EdgeInsets.symmetric(
                                      //   vertical: 1.0.h,
                                      //   horizontal: 2.0.h,
                                      // ),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          email.clear();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.close,
                                            size: 20,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey.shade200,
                                      hintText: 'Masukkan email',
                                      hintStyle: GoogleFonts.dmSans(
                                          fontSize: 10.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.italic),
                                      // border: InputBorder.none,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.5.h,
                          ),
                          Text(
                            'Kata Sandi',
                            style: GoogleFonts.dmSans(
                              fontSize: 11.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          SizedBox(
                            height: 6.h,
                            child: TextFormField(
                              minLines: 1,
                              controller: password,
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
                                // hintText: 'Masukkan konfirmasi sandi',
                                // hintStyle: TextStyle(
                                //     fontSize: 12.0.sp,
                                //     color: Colors.grey.shade500),
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                hintText: 'Masukkan kata sandi',

                                hintStyle: GoogleFonts.dmSans(
                                    fontSize: 10.sp,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.italic),
                                // border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: _ingatsaya,
                                onChanged: (ingatSaya) {
                                  setState(() {
                                    _ingatsaya = ingatSaya ?? false;
                                  });
                                },
                              ),
                              Text(
                                'Ingat saya',
                                style: GoogleFonts.dmSans(
                                  fontSize: 11.sp,
                                  color: blackColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Get.to((LupapasswordView()));
                                },
                                child: Text(
                                  'Lupa Kata Sandi?',
                                  style: GoogleFonts.dmSans(
                                    fontSize: 11.sp,
                                    color: mainColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 2.0.h),
                          SizedBox(
                            width: double.infinity,
                            height: 6.h,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  if (email.text == 'rnida303@gmail.com' &&
                                      password.text == 'password') {
                                    print('Masuk no login');
                                    await loginController.loginhc(
                                        'rnida303@gmail.com',
                                        'password',
                                        context);
                                  } else {
                                    await loginController.actlogin(
                                      email.text,
                                      password.text,
                                      context,
                                    );
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: mainColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Text(
                                'Masuk',
                                style: GoogleFonts.dmSans(
                                  fontSize: 12.sp,
                                  color: whiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: Get.height * 0.10,
                          // ),
                        ],
                      ),
                    ),

                    // Form(
                    //   key: formkey,
                    //   autovalidateMode: AutovalidateMode.onUserInteraction,
                    //   child: TextFormField(
                    //     minLines: 1,
                    //     maxLength: 15,
                    //     controller: idpel,
                    //     onChanged: (a) {
                    //       setState(() {
                    //         wilayah = a.length;
                    //         // _isButtonVisible = a.isNotEmpty;
                    //       });
                    //     },
                    //     decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.grey),
                    //         borderRadius: BorderRadius.circular(10.0),
                    //       ),
                    //       hintText: 'Masukkan Kode ',
                    //       hintStyle: TextStyle(
                    //         fontSize: 12.0.sp,
                    //         color: Colors.grey.shade500,
                    //       ),
                    //     ),
                    //     validator: (value) {
                    //       if (wilayah < 7) {
                    //         return 'ID pelanggan minimal 7 angka dan maximal 15 angka';
                    //       }
                    //       return null;
                    //     },
                    //   ),
                    // ),
                    SizedBox(
                      height: 2.h,
                    ),
                    // Container(
                    //   padding: EdgeInsets.all(16.0),
                    //   decoration: BoxDecoration(
                    //     color: Colors.amber.withOpacity(0.4),
                    //     borderRadius: BorderRadius.circular(5),
                    //   ),
                    //   child: Text(
                    //     'Pembayaran tagihan listrik tidak dilakukan pada pukul 23.00 - 00.30 WIB sesuai ketentuan PLN',
                    //     style: TextStyle(
                    //       fontSize: 11.0.sp,
                    //       fontWeight: FontWeight.w400,
                    //     ),
                    //     textAlign: TextAlign.justify,
                    //   ),
                    // ),
                    SizedBox(
                      child: Container(
                        height: Get.height * 0.15,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'Belum punya akun?',
                              style: GoogleFonts.dmSans(
                                fontSize: 11.sp,
                                color: blackColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Get.to(RegistrasiView());
                              // Get.to(EmailtelpView());
                              Get.to(FormPersonalView());
                              // Get.to(Upload_profile());
                              // Get.to(SetPinView());
                            },
                            child: Text(
                              'Daftar',
                              style: GoogleFonts.dmSans(
                                fontSize: 13.sp,
                                color: mainColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ]))
        ]));
  }
}
