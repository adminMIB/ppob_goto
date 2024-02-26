import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/modules/lupapassword/views/popup_view.dart';
import 'package:sizer/sizer.dart';

class ResetSandiView extends StatefulWidget {
  const ResetSandiView({Key? key}) : super(key: key);

  @override
  _ResetSandiViewState createState() => _ResetSandiViewState();
}

class _ResetSandiViewState extends State<ResetSandiView> {
  TextEditingController sandi = TextEditingController();
  TextEditingController katasandi = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Ubah Kata Sandi',
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
          padding: EdgeInsets.only(
            left: 2.h,
            right: 2.h,
            top: 3.h,
          ),
          child: Column(
            children: [
              // SizedBox(
              //   height: 3.0.h,
              // ),
              // Text(
              //   'Ubah kata sandi',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontSize: 14.sp,
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
              SizedBox(
                height: 0.5.h,
              ),
              Text(
                'Pastikan kata sandi sesuai kriteria keamanan',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF83858B)),
              ),
              SizedBox(
                height: 5.0.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kata sandi',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  TextField(
                    controller: sandi,
                    minLines: 1,
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          sandi.clear();
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
                      hintText: 'kata sandi',
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
                  SizedBox(
                    height: 2.0.h,
                  ),
                  Text(
                    'Konfirmasi kata sandi',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  TextField(
                    controller: katasandi,
                    minLines: 1,
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          katasandi.clear();
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
                      hintText: 'Konfirmasi kata sandi',
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
                  SizedBox(height: Get.height * 0.35),
                  Center(
                    child: SizedBox(
                      width: 41.0.h,
                      height: 6.0.h,
                      child: ElevatedButton(
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  const PopupLupa());
                        },
                        style: ElevatedButton.styleFrom(
                          primary: mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          'Ubah',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFDF8F8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sudah punya akun?',
                            style: TextStyle(
                              fontSize: 15,
                              letterSpacing: 0.25,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                              text: ' ' + 'Masuk',
                              style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 0.25,
                                  color: mainColor,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                              // ..onTap = () {
                              //   Get.to(RegistrasiView());
                              // },
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
      )),
    );
  }
}
