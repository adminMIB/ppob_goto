// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/modules/pulsa/controllers/pulsa_controller.dart';
import 'package:ppob_mpay1/app/modules/tagihan/bpjs/views/kesehatan_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/bpjs/views/ketenagakerjaan_view.dart';
import 'package:ppob_mpay1/main.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BpjsView extends StatefulWidget {
  const BpjsView({Key? key}) : super(key: key);

  @override
  _BpjsViewState createState() => _BpjsViewState();
}

class _BpjsViewState extends State<BpjsView> {
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
                                      'assets/images/bpjs2.svg',
                                      fit: BoxFit.contain,
                                      width: 7.0.h,
                                      height: 7.0.h,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 1.0.h),
                                Text(
                                  'BPJS',
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
                                height: 1.0.h,
                              ),
                              ListTile(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 0),
                                leading: Image.asset(
                                  'assets/images/bpjskesehatan.png',
                                  height: 5.0.h,
                                ),
                                title: Text('BPJS Kesehatan'),
                                trailing:
                                    Icon(Icons.keyboard_arrow_right_outlined),
                                onTap: () {
                                  Get.to(KesehatanView());
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
                                leading: Image.asset(
                                  'assets/images/bpjsketenagakerjaan.png',
                                  height: 5.0.h,
                                ),
                                title: Text('BPJS Ketenagakerjaan'),
                                trailing:
                                    Icon(Icons.keyboard_arrow_right_outlined),
                                onTap: () {
                                  Get.to(KetenagakerjaanView());
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
