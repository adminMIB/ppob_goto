import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/modules/register/controllers/register_controller.dart';
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
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Center(
                child: Image.asset('assets/images/logo1.png'),
              ),
              SizedBox(
                width: 72,
                height: 18.58,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'M-PAY',
                    style: TextStyle(
                      color: Color(0xFF124688),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'assets/images/amico.png',
                      height: Get.height * 0.32,
                    ),
                    SizedBox(
                      height: 25,
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
                height: 20,
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
                          // Text(
                          //   'No Telepon',
                          //   style: TextStyle(
                          //     color: Colors.grey,
                          //     fontSize: 16,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child:
                          //        TextField(
                          //         controller: telp,
                          //         minLines: 1,
                          //         style: TextStyle(color: Colors.grey),
                          //         decoration: InputDecoration(
                          //           contentPadding: EdgeInsets.symmetric(
                          //             vertical: 10,
                          //             horizontal: 20,
                          //           ),
                          //           suffixIcon: GestureDetector(
                          //             onTap: () {
                          //               telp.clear();
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
                          //           hintText: '+62 811-1234-5678',
                          //           hintStyle: TextStyle(color: Colors.grey),
                          //           border: InputBorder.none,
                          //           enabledBorder: OutlineInputBorder(
                          //             borderSide:
                          //                 BorderSide(color: Colors.grey),
                          //             borderRadius: BorderRadius.circular(10.0),
                          //           ),
                          //           focusedBorder: OutlineInputBorder(
                          //             borderSide:
                          //                 BorderSide(color: Colors.grey),
                          //             borderRadius: BorderRadius.circular(10.0),
                          //           ),
                          //         ),
                          //         keyboardType: TextInputType.number,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: 1.0.h,
                          // ),
                          Text(
                            'Email',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
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
                    ),
                  )
                ],
              ),
              SizedBox(height: 3.0.h),
              SizedBox(
                width: 44.0.h,
                height: 6.0.h,
                child: ElevatedButton(
                  onPressed: () async {
                    // Get.to(FormPersonalView());
                    // Get.to(OTPregisterView());
                    // print('masuk');
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
        ],
      ),
    );
  }
}
