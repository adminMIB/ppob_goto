import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pulsa-paketdata/pulsa/views/pulsaa_view.dart';
import 'package:sizer/sizer.dart';

import '../../../data/colors.dart';
import 'paketdata/views/paketdataa_view.dart';
import 'pulsa/controllers/pulsa_controller.dart';
import 'pulsa/views/kontak_view.dart';

class Pulsa_PaketdataView extends StatefulWidget {
  String? tipePLN;
  String? idpel;
  Pulsa_PaketdataView({
    Key? key,
    this.tipePLN,
    this.idpel,
  }) : super(key: key);

  @override
  _Pulsa_PaketdataViewState createState() => _Pulsa_PaketdataViewState();
}

class _Pulsa_PaketdataViewState extends State<Pulsa_PaketdataView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final formkey = GlobalKey<FormState>();
  TextEditingController tNoPulsa = TextEditingController();
  int wilayah = 0;
  int lengthNoTelepon = 0;
  final pulsaController = Get.put(PulsaController());
  bool shouldUpdateViewPrice = false;

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
          'Pulsa & Paket Data',
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 6.h,
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
                            'Pulsa Prabayar',
                            style: TextStyle(fontSize: 12.sp),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Paket Data',
                            style: TextStyle(fontSize: 12.sp),
                          ),
                        ),
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
                  // SizedBox(
                  //   height: 2.h,
                  // ),
                  // Text(
                  //   'Nomor Telepon',
                  //   style: TextStyle(
                  //     fontSize: 11.0.sp,
                  //     fontWeight: FontWeight.w500,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 1.h,
                  // ),
                  // Form(
                  //   key: formkey,
                  //   autovalidateMode:
                  //       AutovalidateMode.onUserInteraction,
                  //   child: SizedBox(
                  //     child: TextFormField(
                  //       minLines: 1,
                  //       maxLength: 20,
                  //       controller: idpel,
                  //       onChanged: (a) {
                  //         setState(() {
                  //           wilayah = a.length;
                  //           // _isButtonVisible = a.isNotEmpty;
                  //         });
                  //       },
                  //       decoration: InputDecoration(
                  //         border: OutlineInputBorder(
                  //           borderSide: BorderSide(color: Colors.grey),
                  //           borderRadius: BorderRadius.circular(10.0),
                  //         ),
                  //         hintText: 'Masukkan Kode ',
                  //         hintStyle: TextStyle(
                  //           fontSize: 12.0.sp,
                  //           color: Colors.grey.shade500,
                  //         ),
                  //       ),
                  //       validator: (value) {
                  //         if (wilayah < 7) {
                  //           return 'ID pelanggan minimal 7 angka dan maximal 15 angka';
                  //         }
                  //         return null;
                  //       },
                  //     ),
                  //   ),
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     // Image.asset(
                  //     //   'assets/images/telkomsel.png',
                  //     //   height: 5.0.h,
                  //     // ),
                  //     Container(
                  //       height: 8.0.h,
                  //       width: 5.0.h,
                  //       color: whiteColor,
                  //       child: GestureDetector(
                  //         onTap: () {
                  //           tNoPulsa.text = '';
                  //         },
                  //         child: _data.logoProvider.value == ''
                  //             ? Container()
                  //             : Image.asset(
                  //                 _data.logoProvider.value,
                  //                 width: 5.0.h,
                  //                 alignment: Alignment.topCenter,
                  //               ),
                  //       ),
                  //     ),

                  //     SizedBox(width: 2.0.h),
                  //     Form(
                  //       key: formkey,
                  //       autovalidateMode:
                  //           AutovalidateMode.onUserInteraction,
                  //       child: Container(
                  //         width: 65.w,
                  //         // height: 7.h,
                  //         child: Column(
                  //           crossAxisAlignment:
                  //               CrossAxisAlignment.start,
                  //           children: [
                  //             TextFormField(
                  //               minLines: 1,
                  //               maxLength: 13,
                  //               controller: tNoPulsa,
                  //               keyboardType: TextInputType.number,
                  //               onChanged: (a) async {
                  //                 lengthNoTelepon = a.length;
                  //                 pulsaController.checkNomorPonsel(
                  //                     a, context);
                  //                 setState(() {
                  //                   shouldUpdateViewPrice = true;
                  //                 });
                  //                 await Future.delayed(
                  //                     Duration(milliseconds: 2000));
                  //               },
                  //               decoration: InputDecoration(
                  //                 border: OutlineInputBorder(
                  //                   borderSide:
                  //                       BorderSide(color: Colors.grey),
                  //                   borderRadius:
                  //                       BorderRadius.circular(10.0),
                  //                 ),
                  //                 enabledBorder: OutlineInputBorder(
                  //                   borderSide:
                  //                       BorderSide(color: Colors.grey),
                  //                   borderRadius: BorderRadius.circular(
                  //                       10.0), // Same circular border radius
                  //                 ),
                  //                 focusedBorder: OutlineInputBorder(
                  //                   borderSide:
                  //                       BorderSide(color: Colors.blue),
                  //                   borderRadius:
                  //                       BorderRadius.circular(10.0),
                  //                 ),
                  //                 hintText: 'Masukkan Nomer telepon',
                  //                 hintStyle: TextStyle(
                  //                     fontSize: 12.0.sp,
                  //                     color: Colors.grey.shade500),
                  //               ),
                  //               validator: (value) {
                  //                 if (lengthNoTelepon < 7) {
                  //                   return 'Nomor handphone minimal 10 karakter';
                  //                 }
                  //                 return null; // No error message here
                  //               },
                  //             ),
                  //             // Display the validation message here
                  //           ],
                  //         ),
                  //       ),
                  //     ),

                  //     SizedBox(
                  //       width: 2.0.h,
                  //     ),
                  //     GestureDetector(
                  //       onTap: () async {
                  //         var result = await showDialog(
                  //             context: context,
                  //             builder: (BuildContext context) =>
                  //                 const KontakView());

                  //         if (result != null && result is String) {
                  //           String formattedNumber = result
                  //               .replaceAll('+62', '0')
                  //               .replaceAll('-', '')
                  //               .replaceAll(' ', '');

                  //           setState(() {
                  //             tNoPulsa.text = formattedNumber;
                  //             pulsaController.checkNomorPonsel(
                  //                 formattedNumber, context);
                  //           });
                  //         }
                  //       },
                  //       child: Container(
                  //         height: 8.0.h,
                  //         width: 3.0.h,
                  //         color: whiteColor,
                  //         child: Image.asset(
                  //           'assets/images/kontak.png',
                  //           height: 4.0.h,
                  //           alignment: Alignment.topCenter,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
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
                  PulsaaView(),
                  PaketdataaView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
