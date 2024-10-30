import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../main.dart';
import '../../../../data/colors.dart';
import '../../../../data/controller/helpercontroller.dart';
import '../controllers/pdam_controller.dart';
import 'wilayah_view.dart';

class PdamView extends StatefulWidget {
  final List? dataPdam;

  PdamView({Key? key, this.dataPdam}) : super(key: key);

  @override
  _PdamViewState createState() => _PdamViewState();
}

class _PdamViewState extends State<PdamView> {
  final PdamController pdamController = Get.put(PdamController());
  final HelperController helperController = Get.put(HelperController());

  final isLoading = false.obs;
  final TextEditingController searchController = TextEditingController();

  PhoneContact? _phoneContact;
  int lengthNoTelepon = 0;
  var pickNumber = '';

  @override
  void initState() {
    super.initState();
    pdamController.pdam(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        controller.restart();
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFF005B96), // Warna solid untuk AppBar
          title: Text(
            'PDAM',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFDAE8FA), Color(0xFF005B96)],
              begin: Alignment.bottomRight,
              end: Alignment.topRight,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(2.0.h),
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      pdamController.filterData(value);
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white, // Warna latar belakang TextField
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Cari Wilayah',
                      prefixIcon: Icon(Icons.search),
                      hintStyle: TextStyle(
                        fontSize: 12.0.sp,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: Get.width,
                    height: Get.height * 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(3.5.h),
                        topRight: Radius.circular(3.5.h),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 2.h, left: 2.h, right: 2.h),
                      child: Obx(
                        () => Scrollbar(
                          thumbVisibility: true,
                          child: SingleChildScrollView(
                            child: Column(
                              children: pdamController.dataPdam.map((element) {
                                return Column(
                                  children: [
                                    ListTile(
                                      leading: Image.asset(
                                        'assets/images/pdamlogo.png',
                                        height: 4.h,
                                      ),
                                      title: Text(
                                        element['product_name'],
                                        style: TextStyle(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      trailing: Icon(
                                        Icons.keyboard_arrow_right_outlined,
                                      ),
                                      onTap: () {
                                        Get.to(WilayahView(
                                          productName: element['product_name'],
                                          productCode: element['product_code'],
                                        ));
                                      },
                                    ),
                                    Divider(
                                      color: Colors.grey.shade300,
                                      indent: 1.0,
                                      endIndent: 1.0,
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
