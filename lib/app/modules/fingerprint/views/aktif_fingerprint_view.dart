// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';

// class AktifFingerprintView extends StatefulWidget {
//   AktifFingerprintView({Key? key}) : super(key: key);

//   @override
//   _AktifFingerprintViewState createState() => _AktifFingerprintViewState();
// }

// class _AktifFingerprintViewState extends State<AktifFingerprintView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//           leading: IconButton(
//             icon: Icon(
//               Icons.arrow_back_ios,
//               color: Colors.black,
//             ),
//             onPressed: () {
//               Get.back();
//             },
//           ),
//           title: Text(
//             'Fingerprint',
//             style: TextStyle(
//               color: Colors.black,
//               // fontSize: 14.0.sp,
//             ),
//           ),
//         ),
//         body: SafeArea(
//             child: Padding(
//           padding: EdgeInsets.only(left: 2.0.h, right: 2.0.h),
//           child: Column(
//             children: [
//               Center(
//                   child: Column(
//                 children: [
//                   Text(
//                     'Aktifkan Fingerprint',
//                     style: TextStyle(
//                       fontSize: 16.0.sp,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 1.0.h,
//                   ),
//                   Text(
//                     'Aktifkan login yang aman dan praktis dengan sidik jari!',
//                     style: TextStyle(
//                         fontSize: 12.0.sp,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.grey.shade600),
//                     textAlign: TextAlign.center,
//                   ),
//                   Image.asset(
//                     'assets/images/fingerg.png',
//                   ),

//                 ],
//               )),
//             ],
//           ),
//         )));
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/modules/fingerprint/views/syaratfinger_view.dart';
import 'package:sizer/sizer.dart';

class AktifFingerprintView extends StatefulWidget {
  AktifFingerprintView({Key? key}) : super(key: key);

  @override
  _AktifFingerprintViewState createState() => _AktifFingerprintViewState();
}

class _AktifFingerprintViewState extends State<AktifFingerprintView> {
  bool agreementChecked = false;

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
                      'Aktifkan Fingerprint',
                      style: TextStyle(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 1.0.h,
                    ),
                    Text(
                      'Aktifkan login yang aman dan praktis dengan sidik jari!',
                      style: TextStyle(
                        fontSize: 12.0.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Image.asset(
                      'assets/images/fingerg.png',
                      height: 50.0.h,
                    ),
                    SizedBox(
                      height: 2.0.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: agreementChecked,
                          onChanged: (value) {
                            setState(() {
                              agreementChecked = value ?? false;
                            });
                          },
                          activeColor: mainColor, // Warna ketika dicentang
                          checkColor: Colors.white, // Warna centang
                        ),
                        Text(
                          'Centang untuk menyetujui syarat dan \n ketentuan untuk penggunaan biometrik.',
                          style: TextStyle(
                            fontSize: 12.0.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 40.0.h,
                      height: 6.0.h,
                      child: ElevatedButton(
                        onPressed: agreementChecked
                            ? () {
                                Get.to(Syaratfinger());
                              }
                            : null, // Nonaktifkan tombol jika checkbox tidak dicentang
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          primary: agreementChecked
                              ? mainColor
                              : mainColor.withOpacity(0.5),
                        ),
                        child: Text('Setuju'),
                      ),
                    ),
                    SizedBox(
                      height: 2.0.h,
                    ),
                    SizedBox(
                      width: 40.0.h,
                      height: 6.0.h,
                      child: ElevatedButton(
                        onPressed: () {
                          // Tombol Tidak Setuju diklik
                          // Tambahkan logika atau perpindahan layar di sini
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          primary: whiteColor,
                        ),
                        child: Text(
                          'Tidak Setuju',
                          style: TextStyle(color: mainColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
