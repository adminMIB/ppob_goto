// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pulsa/controllers/pulsa_controller.dart';
import 'package:ppob_mpay1/app/modules/tagihan/telco/views/penyediatelco_view.dart';
import 'package:ppob_mpay1/main.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TelcoView extends StatefulWidget {
  const TelcoView({Key? key}) : super(key: key);

  @override
  _TelcoViewState createState() => _TelcoViewState();
}

class _TelcoViewState extends State<TelcoView> {
  List<String> penyediaList = List.generate(50, (index) => 'IndiHome');
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
                          child: SvgPicture.asset(
                            'assets/images/calling.svg',
                            fit: BoxFit.contain,
                            width: 5.0.h,
                            height: 5.0.h,
                          ),
                        ),
                        SizedBox(height: 1.0.h),
                        Text(
                          'TELCO',
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
                                'Pilih Tipe Penyedia',
                                style: TextStyle(
                                  fontSize: 12.0.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 1.0.h,
                              ),
                              // TextField(
                              //   decoration: InputDecoration(
                              //     hintText: 'Cari penyedia...',
                              //     hintStyle: TextStyle(color: Colors.grey),
                              //     prefixIcon: Icon(Icons.search),
                              //     border: OutlineInputBorder(
                              //       borderRadius: BorderRadius.circular(10.0),
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 1.0.h,
                              // ),
                              SizedBox(
                                height: Get.height * 0.60,
                                child: ListView.builder(
                                  itemCount: penyediaList.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        ListTile(
                                          leading: SvgPicture.asset(
                                            'assets/images/calling.svg',
                                            fit: BoxFit.contain,
                                            width: 5.0.h,
                                            height: 4.0.h,
                                          ),
                                          title: Text(penyediaList[index]),
                                          trailing: Icon(
                                            Icons.keyboard_arrow_right_outlined,
                                          ),
                                          onTap: () {
                                            Get.to(PenyediatelcoView());
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
