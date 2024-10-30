import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../data/colors.dart';
import '../controllers/pln_controller.dart';
import 'prabayar/prabayar2_view.dart';
import 'pascabayar/Pasca2_view.dart';

class Pln2View extends StatefulWidget {
  String? tipePLN;
  String? idpel;
  Pln2View({
    Key? key,
    this.tipePLN,
    this.idpel,
  }) : super(key: key);

  @override
  _Pln2ViewState createState() => _Pln2ViewState();
}

class _Pln2ViewState extends State<Pln2View>
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
    _tabController = TabController(length: 3, vsync: this);
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
          'Listrik PLN',
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
              padding: EdgeInsets.only(left: 2.h, right: 2.h),
              child: Container(
                decoration: BoxDecoration(
                  color: mainContainer,
                  borderRadius: BorderRadius.circular(1.5.h),
                ),
                child:
                    // TabBar(
                    //   controller: _tabController,
                    //   labelColor: whiteColor,
                    //   indicatorColor: greyColor,
                    //   unselectedLabelColor: blackColor,
                    //   indicator: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(1.5.h),
                    //     color: mainColor,
                    //   ),
                    //   indicatorSize: TabBarIndicatorSize.tab,
                    //   tabs: [
                    //     Tab(text: 'Token'),
                    //     Tab(text: 'Tagihan'),
                    //     Tab(text: 'Non-Tagihan'),
                    //   ],
                    // ),
                    TabBar(
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
                    Tab(text: 'Token'),
                    Tab(text: 'Tagihan'),
                    Tab(text: 'Non-Tagihan'),
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
                  // Replace with your first tab content
                  // Center(child: Text('Tab 1 content')),
                  Prabayar2View(),
                  // Replace with your second tab content
                  PascaView(),
                  Center(child: Text('Tab 3 content')),
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
