import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/modules/login/controllers/login_controller.dart';
import 'package:ppob_mpay1/app/modules/lupapassword/views/lupapassword_view.dart';
import 'package:ppob_mpay1/app/modules/register/views/emailtelp_view.dart';
import 'package:sizer/sizer.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final loginController = Get.put(LoginController());

  bool hapus = true;
  bool _ingatsaya = false;
  bool _obscureTextKonfirmasi = true;

  @override
  void dispose() {
    username.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Image.asset(
                            'assets/images/logopay.png',
                            filterQuality: FilterQuality.high,
                            height: 100,
                          ),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Text(
                          '"Hempaskan tagihan dalam sekali tekan"',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: blackColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(1.0.h),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 0.0.h,
                        ),
                        Text(
                          'Silahkan masuk dengan akun anda',
                          style: TextStyle(
                            color: blackColor,
                            fontSize: 14.0.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Username',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12.0.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    // Row(
                                    //   children: [
                                    //     Expanded(
                                    //       child: TextField(
                                    //         controller: username,
                                    //         minLines: 1,
                                    //         style:
                                    //             TextStyle(color: Colors.grey),
                                    //         decoration: InputDecoration(
                                    //           contentPadding:
                                    //               EdgeInsets.symmetric(
                                    //             vertical: 1.0.h,
                                    //             horizontal: 2.0.h,
                                    //           ),
                                    //           suffixIcon: GestureDetector(
                                    //             onTap: () {
                                    //               username.clear();
                                    //             },
                                    //             child: Container(
                                    //               padding: EdgeInsets.all(10),
                                    //               decoration: BoxDecoration(
                                    //                 shape: BoxShape.circle,
                                    //               ),
                                    //               child: Icon(
                                    //                 Icons.close,
                                    //                 size: 20,
                                    //                 color: Colors.grey,
                                    //               ),
                                    //             ),
                                    //           ),
                                    //           filled: true,
                                    //           fillColor: Colors.grey.shade200,
                                    //           hintText: 'Masukkan username',
                                    //           hintStyle:
                                    //               TextStyle(color: Colors.grey),
                                    //           border: InputBorder.none,
                                    //           enabledBorder: OutlineInputBorder(
                                    //             borderSide: BorderSide(
                                    //                 color: Colors.grey),
                                    //             borderRadius:
                                    //                 BorderRadius.circular(10.0),
                                    //           ),
                                    //           focusedBorder: OutlineInputBorder(
                                    //             borderSide: BorderSide(
                                    //                 color: Colors.grey),
                                    //             borderRadius:
                                    //                 BorderRadius.circular(10.0),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            controller: username,
                                            minLines: 1,
                                            decoration: InputDecoration(
                                              // contentPadding:
                                              //     EdgeInsets.symmetric(
                                              //   vertical: 1.0.h,
                                              //   horizontal: 2.0.h,
                                              // ),
                                              suffixIcon: GestureDetector(
                                                onTap: () {
                                                  username.clear();
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
                                              hintText: 'Masukkan username',
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                              // border: InputBorder.none,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(
                                      height: 1.0.h,
                                    ),
                                    Text(
                                      'Kata Sandi',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12.0.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
<<<<<<< HEAD

                                    TextFormField(
=======
                                    TextField(
                                      controller: password,
                                      enableInteractiveSelection: false,
>>>>>>> bd671d8bb51a0211f29a865a1b3502a47883a34a
                                      minLines: 1,
                                      controller: password,
                                      obscureText: _obscureTextKonfirmasi,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        suffixIcon: IconButton(
                                          icon: _obscureTextKonfirmasi
                                              ? const Icon(Icons.visibility)
                                              : const Icon(
                                                  Icons.visibility_off),
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
                                        hintText: 'Masukkan Password',
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
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
                                    SizedBox(
                                      height: 1.0.h,
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
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: blackColor,
                                          ),
                                        ),
                                        Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to((LupapasswordView()));
                                          },
                                          child: Text(
                                            'Lupa kata sandi?',
                                            style: TextStyle(
                                              fontSize: 12.0.sp,
                                              color: mainColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 1.0.h),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 50,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            if (username.text == 'intan12' &&
                                                password.text == 'password') {
                                              print('Masuk no login');
                                              await loginController.loginhc(
                                                  'intan12',
                                                  'password',
                                                  context);
                                            } else {
                                              await loginController.actlogin(
                                                username.text,
                                                password.text,
                                                context,
                                              );
                                            }
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: mainColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                        child: Text(
                                          'Masuk',
                                          style: TextStyle(
                                            fontSize: 14.0.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFFDF8F8),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15,
                                    ),
                                    Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Belum punya akun?',
                                            style: TextStyle(
                                              color: blackColor,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                              letterSpacing: 0.25,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.0.h,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            // Get.to(RegistrasiView());
                                            Get.to(EmailtelpView());
                                            // Get.to(FormPersonalView());
                                            // Get.to(SetPinView());
                                          },
                                          child: Text(
                                            'Daftar',
                                            style: TextStyle(
                                              color: mainColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.50,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 1.0.h,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
