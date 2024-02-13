import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/modules/register/controllers/register_controller.dart';
import 'package:ppob_mpay1/app/modules/register/views/OTPregister_view.dart';
import 'package:ppob_mpay1/app/modules/register/views/datakerabat.dart';
import 'package:ppob_mpay1/app/modules/register/views/formpersonal.dart';
import 'package:sizer/sizer.dart';

class EmailtelpView extends StatefulWidget {
  const EmailtelpView({Key? key}) : super(key: key);

  @override
  _EmailtelpViewState createState() => _EmailtelpViewState();
}

class _EmailtelpViewState extends State<EmailtelpView> {
  final emaildepan = Get.put(RegisterController());
  // bool _obscureText = true;
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Daftar',
          style: TextStyle(
            color: mainColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
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
              left: 2.5.h,
              right: 2.5.h,
            ),
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/moganti.png',
                    height: 10.h,
                  ),
                ),
                Container(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 3.0.h,
                      ),
                      Image.asset(
                        'assets/images/amico.png',
                        height: Get.height * 0.32,
                      ),
                      SizedBox(
                        height: 3.5.h,
                      ),
                      Text(
                        'Mengubah cara Anda berinteraksi dengan dunia.\n Membuat hidup lebih mudah, satu aplikasi\n sekaligus',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11.0.sp,
                          color: mainColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          TextField(
                            controller: email,
                            enableInteractiveSelection: false,
                            minLines: 1,
                            style: TextStyle(color: Colors.grey),
                            // obscureText: _obscureText,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              // suffixIcon: IconButton(
                              //   icon: _obscureText
                              //       ? Icon(Icons.visibility)
                              //       : Icon(Icons.visibility_off),
                              //   color: Colors.grey,
                              //   onPressed: () {
                              //     setState(() {
                              //       _obscureText = !_obscureText;
                              //     });
                              //   },
                              // ),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              hintText: 'Masukkan Email Anda',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
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
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 2.h),
                SizedBox(
                  width: Get.width,
                  height: 6.0.h,
                  child: ElevatedButton(
                    onPressed: () async {
                      // Get.to(OTPregisterView());
                      print('masuk');
                      await emaildepan.email(
                        context,
                        email.text,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Masuk',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFDF8F8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
