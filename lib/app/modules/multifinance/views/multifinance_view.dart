// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/modules/multifinance/views/penyedia_view.dart';
import 'package:ppob_mpay1/app/modules/pulsa/controllers/pulsa_controller.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pdam/views/wilayah_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pln/views/nontaglis_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pln/views/prabayar_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pln/views/tagihanlistrik_view.dart';
import 'package:ppob_mpay1/main.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MultifinanceView extends StatefulWidget {
  const MultifinanceView({Key? key}) : super(key: key);

  @override
  _MultifinanceViewState createState() => _MultifinanceViewState();
}

class _MultifinanceViewState extends State<MultifinanceView> {
  List<String> penyediaList = List.generate(50, (index) => 'Woori Finance');
  bool status = false;
  int selectedItemIndex = -1;

  bool _ingatsaya = false;
  bool shouldUpdateViewPrice = false;
  TextEditingController tNoPulsa = TextEditingController();

  final pulsaController = Get.put(PulsaController());
  final helperController = Get.put(HelperController());

  PhoneContact? _phoneContact;

  int lengthNoTelepon = 0;
  var pickNumber = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        controller.restart();
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Stack(
          children: [
            SafeArea(
                child: Column(
              children: [
                AppBar(
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
                Stack(
                  children: [
                    Column(
                      children: [
                        Center(
                            child: Image.asset(
                          'assets/images/kalkulator.png',
                          height: 5.0.h,
                        )),
                        SizedBox(height: 1.0.h),
                        Text(
                          'Multifinance',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 1.0.h,
                        ),
                        Divider(
                          color: Colors.grey.shade500,
                          indent: 2.0.h,
                          endIndent: 2.0.h,
                        ),
                        SizedBox(
                          height: 1.0.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 2.0.h,
                            right: 2.0.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pilih penyedia',
                                style: TextStyle(
                                  fontSize: 12.0.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 1.0.h,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Cari Penyedia...',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1.0.h,
                              ),
                              SizedBox(
                                height: Get.height * 0.60,
                                child: ListView.builder(
                                  itemCount: penyediaList.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        ListTile(
                                          leading: Image.asset(
                                            'assets/images/kalkulator.png',
                                            height: 4.0.h,
                                          ),
                                          title: Text(penyediaList[index]),
                                          trailing: Icon(
                                            Icons.keyboard_arrow_right_outlined,
                                          ),
                                          onTap: () {
                                            Get.to(PenyediaView());
                                          },
                                        ),
                                        Divider(
                                          color: Colors.grey.shade300,
                                          indent: 1.0,
                                          endIndent: 1.0,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
