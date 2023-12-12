// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/modules/pulsa/controllers/pulsa_controller.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pln/views/nontaglis_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pln/views/prabayar_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pln/views/tagihanlistrik_view.dart';
import 'package:ppob_mpay1/main.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlnView extends StatefulWidget {
  const PlnView({Key? key}) : super(key: key);

  @override
  _PlnViewState createState() => _PlnViewState();
}

class _PlnViewState extends State<PlnView> {
  bool status = false;
  int selectedItemIndex = -1; // -1 berarti tidak ada yang dipilih

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
                Expanded(
                  child: GetBuilder<PulsaController>(
                    init: PulsaController(),
                    builder: (_data) => ListView(
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
                                Container(
                                  width: 45,
                                  height: 45,
                                  // decoration: BoxDecoration(
                                  //   color: oceanColor,
                                  //   shape: BoxShape.circle,
                                  // ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/images/lampu.svg',
                                      fit: BoxFit.contain,
                                      width: 7.0.h,
                                      height: 7.0.h,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 1.0.h),
                                Text(
                                  'PLN',
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
                                  height: 1.5.h,
                                ),
                              ],
                            ),
                          ],
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
                                height: 1.5.h,
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 0), // Atur padding horizontal
                                leading: Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'assets/images/pln.png',
                                    height: 5.0.h,
                                  ),
                                ),
                                title: Text('Non-Taglis'),
                                trailing:
                                    Icon(Icons.keyboard_arrow_right_outlined),
                                onTap: () {
                                  Get.to(NontaglisView());
                                },
                              ),

                              // ListTile(
                              //   contentPadding:
                              //       EdgeInsets.symmetric(horizontal: 0),
                              //   leading: Image.asset(
                              //     'assets/images/pln.png',
                              //     height: 5.0.h,
                              //   ),
                              //   title: Text('Non-Taglis'),
                              //   trailing:
                              //       Icon(Icons.keyboard_arrow_right_outlined),
                              //   onTap: () {
                              //     Get.to(NontaglisView());
                              //   },
                              // ),
                              Divider(
                                color: Colors.grey.shade300,
                                indent: 1.0.h,
                                endIndent: 1.0.h,
                              ),
                              ListTile(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 0),
                                leading: Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'assets/images/pln.png',
                                    height: 5.0.h,
                                  ),
                                ),
                                title: Text('Tagihan Listrik'),
                                trailing:
                                    Icon(Icons.keyboard_arrow_right_outlined),
                                onTap: () {
                                  Get.to(TagihanlistrikView());
                                },
                              ),
                              Divider(
                                color: Colors.grey.shade300,
                                indent: 1.0.h,
                                endIndent: 1.0.h,
                              ),
                              ListTile(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 0),
                                leading: Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'assets/images/prabayar.png',
                                    height: 5.0.h,
                                  ),
                                ),
                                title: Text('Prabayar'),
                                trailing:
                                    Icon(Icons.keyboard_arrow_right_outlined),
                                onTap: () {
                                  Get.to(PrabayarView());
                                },
                              ),
                              Divider(
                                color: Colors.grey.shade300,
                                indent: 1.0.h,
                                endIndent: 1.0.h,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
