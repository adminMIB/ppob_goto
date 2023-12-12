import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:sizer/sizer.dart';

import '../controllers/emoney_controller.dart';

class EmoneykartuView extends StatefulWidget {
  const EmoneykartuView({Key? key}) : super(key: key);

  @override
  _EmoneykartuViewState createState() => _EmoneykartuViewState();
}

class _EmoneykartuViewState extends State<EmoneykartuView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
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
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 2.0.h, right: 2.0.h),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/emoney.png',
                  fit: BoxFit.contain,
                  height: 3.0.h,
                ),
              ),

              // Text(
              //   'E-money',
              //   style: TextStyle(
              //     fontSize: 14.0.sp,
              //     fontWeight: FontWeight.w600,
              //   ),
              // ),
              SizedBox(
                height: 1.0.h,
              ),
              Divider(
                color: Colors.grey.shade500,
                indent: 2.0.h,
                endIndent: 2.0.h,
              ),
              SizedBox(
                height: 2.0.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.0.h, right: 2.0.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nomor Kartu',
                      style: TextStyle(
                        fontSize: 12.0.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 1.0.h,
                    ),
                    TextFormField(
                      minLines: 1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Masukkan nomor kartu',
                        hintStyle: TextStyle(
                            fontSize: 12.0.sp, color: Colors.grey.shade500),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.50,
                    ),
                    Container(
                        color: whiteColor,
                        padding: EdgeInsets.all(16.0),
                        child: Center(
                            child: SizedBox(
                          width: 41.0.h,
                          height: 6.0.h,
                          child: ElevatedButton(
                            onPressed: () async {
                              print('masuk');

                              // showFlexibleBottomSheet(
                              //   minHeight: 0,
                              //   initHeight: 0.5,
                              //   maxHeight: 0.5,
                              //   context: context,
                              //   builder: _buildBottomSheet,
                              //   isExpand: false,
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
                                fontSize: 14.0.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFDF8F8),
                              ),
                            ),
                          ),
                        )))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
