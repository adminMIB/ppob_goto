import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ppob_mpay1/app/modules/fingerprint/views/aktif_fingerprint_view.dart';
import 'package:sizer/sizer.dart';

import '../controllers/fingerprint_controller.dart';

class FingerprintView extends StatefulWidget {
  String? email;
  FingerprintView({Key? key, this.email}) : super(key: key);

  @override
  _FingerprintViewState createState() => _FingerprintViewState();
}

class _FingerprintViewState extends State<FingerprintView> {
  bool isFingerprintEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
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
            'Fingerprint',
            style: TextStyle(
              color: Colors.black,
              // fontSize: 14.0.sp,
            ),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.only(left: 2.0.h, right: 2.0.h, top: 1.0.h),
          child: Column(
            children: [
              Center(
                  child: Column(
                children: [
                  Text(
                    'Biometrik untuk login',
                    style: TextStyle(
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  Text(
                    'Login yang aman dan praktis dengan biometrik perangkat anda.',
                    style: TextStyle(
                        fontSize: 12.0.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade600),
                    textAlign: TextAlign.center,
                  )
                ],
              )),
              SizedBox(
                height: 2.0.h,
              ),
              Divider(
                color: Colors.grey.shade400,
                indent: 2.h,
                endIndent: 2.h,
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 2.0.h),
                leading: Container(
                  padding: EdgeInsets.all(2.0),
                  child: Image.asset(
                    'assets/images/finger.png',
                    height: 4.0.h,
                  ),
                ),
                title: Text(
                  'Fingerprint',
                  style: TextStyle(
                    fontSize: 12.0.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Switch(
                  value: isFingerprintEnabled,
                  onChanged: (value) {
                    setState(() {
                      isFingerprintEnabled = value;
                    });
                    // Add your logic for enabling/disabling fingerprint here
                  },
                ),
                onTap: () {
                  Get.to(AktifFingerprintView());
                },
              ),
              Divider(
                color: Colors.grey.shade400,
                indent: 2.h,
                endIndent: 2.h,
              ),
            ],
          ),
        )));
  }
}
