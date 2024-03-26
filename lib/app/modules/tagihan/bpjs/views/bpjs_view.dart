import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/modules/tagihan/bpjs/views/kesehatan_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/bpjs/views/ketenagakerjaan_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pln/controllers/pln_controller.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pln/views/pascabayar/coba2_view.dart';
import 'package:sizer/sizer.dart';

class BpjsView extends StatefulWidget {
  String? tipePLN;
  String? idpel;
  BpjsView({
    Key? key,
    this.tipePLN,
    this.idpel,
  }) : super(key: key);

  @override
  _BpjsViewState createState() => _BpjsViewState();
}

class _BpjsViewState extends State<BpjsView>
    with SingleTickerProviderStateMixin {
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
            Padding(
              padding: EdgeInsets.only(left: 2.h, right: 2.h, top: 1.h),
              child: Container(
                height: 7.h,
                decoration: BoxDecoration(
                  color: mainContainer,
                  borderRadius: BorderRadius.circular(1.5.h),
                ),
                child: TabBar(
                  controller: _tabController,
                  labelColor: whiteColor,
                  indicatorColor: greyColor,
                  unselectedLabelColor: blackColor,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(1.5.h),
                    color: mainColor,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(
                      child: Text(
                        'Kesehatan',
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                    Tab(text: 'Ketenagakerjaan'),
                  ],
                  // onTap: (index) {
                  //   // Menyimpan nilai tab yang dipilih
                  //   setState(() {
                  //     selectedTab = index == 0
                  //         ? 'Token'
                  //         : index == 1
                  //             ? 'Tagihan'
                  //             : 'Non-Tagihan';
                  //   });
                  // },
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Coba2View(pasca: 'Tagihan'),
                  KesehatanView(),
                  KetenagakerjaanView(),
                ],
              ),
            ),
            // Align(
            //     alignment: Alignment.bottomCenter,
            //     child: Container(
            //       color: Colors.transparent,
            //       padding: EdgeInsets.all(16.0),
            //       child: Center(
            //         child: SizedBox(
            //           width: 41.0.h,
            //           height: 6.0.h,
            //           child: ElevatedButton(
            //             onPressed: idpel.text.length >= 7
            //                 ? () async {
            //                     // if (formkey.currentState!.validate()) {
            //                     //   await plnpasca.plnpascainquiry(
            //                     //       idpel.text, context);
            //                     // }
            //                     if (formkey.currentState!.validate()) {
            //                       if (selectedTab == 'Token') {
            //                         // Logika untuk tab 'Token'
            //                         // Misalnya:
            //                         // await plnpasca.plnpascainquiryToken(idpel.text, context);
            //                       } else if (selectedTab == 'Tagihan') {
            //                         await plnpasca.plnpascainquiry(
            //                             idpel.text, context);
            //                       }
            //                     } else if (selectedTab == 'Non-Tagihan') {
            //                       // // Logika untuk tab 'Non-Tagihan'
            //                       // // Misalnya:
            //                       // await plnpasca.plnpascainquiryNonTagihan(idpel.text, context);
            //                     }
            //                   }
            //                 : null,
            //             style: ElevatedButton.styleFrom(
            //               primary: idpel.text.length >= 7
            //                   ? mainColor
            //                   : Colors.grey.shade700,
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(10.0),
            //               ),
            //               // elevation: 10,
            //             ),
            //             child: Text(
            //               'Lanjutkan',
            //               style: TextStyle(
            //                 fontSize: 14.0.sp,
            //                 fontWeight: FontWeight.bold,
            //                 color: Color(0xFFFDF8F8),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ))
          ],
        ),
      ),
    );
  }
}

// // ignore_for_file: prefer_const_constructors
// import 'package:flutter/material.dart';
// import 'package:fluttercontactpicker/fluttercontactpicker.dart';
// import 'package:get/get.dart';
// import 'package:ppob_mpay1/app/data/colors.dart';
// import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
// import 'package:ppob_mpay1/app/modules/pulsa/controllers/pulsa_controller.dart';
// import 'package:ppob_mpay1/app/modules/tagihan/bpjs/views/kesehatan_view.dart';
// import 'package:ppob_mpay1/app/modules/tagihan/bpjs/views/ketenagakerjaan_view.dart';
// import 'package:ppob_mpay1/app/modules/tagihan/bpjs/views/tes_view.dart';
// import 'package:ppob_mpay1/main.dart';
// import 'package:sizer/sizer.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class BpjsView extends StatefulWidget {
//   const BpjsView({Key? key}) : super(key: key);

//   @override
//   _BpjsViewState createState() => _BpjsViewState();
// }

// class _BpjsViewState extends State<BpjsView> {
//   bool status = false;
//   int selectedItemIndex = -1; // -1 berarti tidak ada yang dipilih

//   bool _ingatsaya = false;
//   bool shouldUpdateViewPrice = false;
//   TextEditingController tNoPulsa = TextEditingController();

//   final pulsaController = Get.put(PulsaController());
//   final helperController = Get.put(HelperController());

//   PhoneContact? _phoneContact;

//   int lengthNoTelepon = 0;
//   var pickNumber = '';

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       behavior: HitTestBehavior.translucent,
//       onTap: () {
//         controller.restart();
//         FocusScopeNode currentFocus = FocusScope.of(context);

//         if (!currentFocus.hasPrimaryFocus) {
//           currentFocus.unfocus();
//         }
//       },
//       child: Scaffold(
//         backgroundColor: whiteColor,
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//           title: Text(
//             'BPJS',
//             style: TextStyle(
//               color: mainColor,
//             ),
//           ),
//           leading: IconButton(
//             icon: Icon(
//               Icons.arrow_back_ios,
//               color: mainColor,
//             ),
//             onPressed: () {
//               Get.back();
//             },
//           ),
//         ),
//         body: SafeArea(
//             child: Column(
//           children: [
//             Expanded(
//               child: ListView(
//                 children: [
//                   // Stack(
//                   //   children: [
//                   //     Column(
//                   //       children: [
//                   //         Container(
//                   //           width: 45,
//                   //           height: 45,
//                   //           // decoration: BoxDecoration(
//                   //           //   color: oceanColor,
//                   //           //   shape: BoxShape.circle,
//                   //           // ),
//                   //           child: Center(
//                   //             child: SvgPicture.asset(
//                   //               'assets/images/bpjs2.svg',
//                   //               fit: BoxFit.contain,
//                   //               width: 7.0.h,
//                   //               height: 7.0.h,
//                   //             ),
//                   //           ),
//                   //         ),
//                   //         SizedBox(height: 1.0.h),
//                   //         Text(
//                   //           'BPJS',
//                   //           style: TextStyle(
//                   //               color: Colors.black,
//                   //               fontSize: 14.0.sp,
//                   //               fontWeight: FontWeight.w500),
//                   //         ),
//                   //         SizedBox(
//                   //           height: 1.0.h,
//                   //         ),
//                   //         Divider(
//                   //           color: Colors.grey.shade500,
//                   //           indent: 2.0.h,
//                   //           endIndent: 2.0.h,
//                   //         ),
//                   //         SizedBox(
//                   //           height: 1.0.h,
//                   //         ),
//                   //       ],
//                   //     ),
//                   //   ],
//                   // ),
//                   Padding(
//                     padding: EdgeInsets.only(
//                       // top: 1.h,
//                       left: 2.0.h,
//                       right: 2.0.h,
//                     ),
//                     child: Column(
//                       // crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Text(
//                         //   'Pilih penyedia',
//                         //   style: TextStyle(
//                         //     fontSize: 12.0.sp,
//                         //     fontWeight: FontWeight.w500,
//                         //   ),
//                         //   textAlign: TextAlign.center,
//                         // ),
//                         // SizedBox(
//                         //   height: 1.0.h,
//                         // ),
//                         ListTile(
//                           contentPadding: EdgeInsets.symmetric(horizontal: 0),
//                           leading: Image.asset(
//                             'assets/images/bpjskesehatan.png',
//                             height: 5.0.h,
//                           ),
//                           title: Text('BPJS Kesehatan'),
//                           trailing: Icon(Icons.keyboard_arrow_right_outlined),
//                           onTap: () {
//                             Get.to(KesehatanView());
//                           },
//                         ),
//                         Divider(
//                           color: Colors.grey.shade300,
//                           indent: 1.0.h,
//                           endIndent: 1.0.h,
//                         ),
//                         ListTile(
//                           contentPadding: EdgeInsets.symmetric(horizontal: 0),
//                           leading: Image.asset(
//                             'assets/images/bpjsketenagakerjaan.png',
//                             height: 5.0.h,
//                           ),
//                           title: Text('BPJS Ketenagakerjaan'),
//                           trailing: Icon(Icons.keyboard_arrow_right_outlined),
//                           onTap: () {
//                             // Get.to(KetenagakerjaanView());
//                             Get.to(tesview());
//                           },
//                         ),
//                         Divider(
//                           color: Colors.grey.shade300,
//                           indent: 1.0.h,
//                           endIndent: 1.0.h,
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         )),
//       ),
//     );
//   }
// }
