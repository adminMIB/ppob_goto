import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/data/popup/views/gagaltransaksi_view.dart';
import 'package:ppob_mpay1/app/data/popup/views/saldotidakcukup_view.dart';
import 'package:ppob_mpay1/app/modules/lupapassword/views/verifikasiOtp_view.dart';
import 'package:sizer/sizer.dart';

import '../controllers/lupapassword_controller.dart';

class LupapasswordView extends StatefulWidget {
  const LupapasswordView({Key? key}) : super(key: key);

  @override
  _LupasandiViewState createState() => _LupasandiViewState();
}

class _LupasandiViewState extends State<LupapasswordView> {
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Lupa kata sandi',
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
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 3.0.h,
            ),
            Text(
              'Silahkan masukan email anda untuk melakukan ubah kata sandi',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.sp,
              ),
            ),
            SizedBox(
              height: 4.0.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: email,
                          minLines: 1,
                          style: TextStyle(color: Colors.grey),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 1.0.h,
                              horizontal: 2.0.h,
                            ),
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
                            hintText: 'Masukkan username',
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
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.55),
                  Center(
                    child: SizedBox(
                      width: 41.0.h,
                      height: 6.0.h,
                      child: ElevatedButton(
                        onPressed: () async {
                          // Get.to(UploadPremiumView());
                          // Get.to(PinView());
                          Get.to(VerifikasiOtpView());
                          // Get.to(Saldotidakcukup());
                        },
                        style: ElevatedButton.styleFrom(
                          primary: mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          'Kirim',
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
              ),
            )
          ],
        ),
      )),
    );
  }
}
