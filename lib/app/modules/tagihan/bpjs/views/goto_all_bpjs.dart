import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppob_mpay1/app/modules/tagihan/bpjs/views/dendabpjs_view.dart';
import 'package:sizer/sizer.dart';

import '../../../../data/colors.dart';
import '../../pln/controllers/pln_controller.dart';
import 'kesehatan_view.dart';
import 'ketenagakerjaan_view.dart';

class GotoAll extends StatefulWidget {
  String? tipePLN;
  String? idpel;
  GotoAll({
    Key? key,
    this.tipePLN,
    this.idpel,
  }) : super(key: key);

  @override
  _GotoAllState createState() => _GotoAllState();
}

class _GotoAllState extends State<GotoAll> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final formkey = GlobalKey<FormState>();
  TextEditingController idpel = TextEditingController();
  final plnpasca = Get.put(PlnController());
  int wilayah = 0;
  String selectedTab = 'Token';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // plnpasca.plnpascainquiry(idpel.text, context);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'BPJS',
          style: TextStyle(
            color: mainColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: mainColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    // top: 1.h,
                    left: 2.0.h,
                    right: 2.0.h,
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   'Pilih penyedia',
                      //   style: TextStyle(
                      //     fontSize: 12.0.sp,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      //   textAlign: TextAlign.center,
                      // ),
                      // SizedBox(
                      //   height: 1.0.h,
                      // ),
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 0),
                        leading: Image.asset(
                          'assets/images/bpjskesehatan.png',
                          height: 5.0.h,
                        ),
                        title: Text('BPJS Kesehatan'),
                        trailing: Icon(Icons.keyboard_arrow_right_outlined),
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
                        contentPadding: EdgeInsets.symmetric(horizontal: 0),
                        leading: Image.asset(
                          'assets/images/bpjsketenagakerjaan.png',
                          height: 5.0.h,
                        ),
                        title: Text('BPJS Ketenagakerjaan'),
                        trailing: Icon(Icons.keyboard_arrow_right_outlined),
                        onTap: () {
                          Get.to(KetenagakerjaanView());
                          // Get.to(tesview());
                        },
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                        indent: 1.0.h,
                        endIndent: 1.0.h,
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 0),
                        leading: Image.asset(
                          'assets/images/bpjsketenagakerjaan.png',
                          height: 5.0.h,
                        ),
                        title: Text('BPJS Denda'),
                        trailing: Icon(Icons.keyboard_arrow_right_outlined),
                        onTap: () {
                          Get.to(DendabpjsView());
                          // Get.to(tesview());
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
          )
        ],
      )),
    );
  }
}
