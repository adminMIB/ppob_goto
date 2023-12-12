// ignore_for_file: prefer_const_constructors

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/modules/paketdata/controllers/paketdata_controller.dart';
import 'package:ppob_mpay1/app/modules/pin/views/pin_view.dart';
import 'package:ppob_mpay1/app/modules/pulsa/controllers/pulsa_controller.dart';
import 'package:ppob_mpay1/app/modules/pulsa/product.dart';
import 'package:ppob_mpay1/app/modules/pulsa/views/kontak_view.dart';
import 'package:ppob_mpay1/main.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class PaketdataView extends StatefulWidget {
  final String? pin;
  const PaketdataView({
    Key? key,
    this.pin,
  }) : super(key: key);

  @override
  _PaketdataViewState createState() => _PaketdataViewState();
}

class _PaketdataViewState extends State<PaketdataView> {
  bool status = false;
  int selectedItemIndex = -1; // -1 berarti tidak ada yang dipilih

  bool _ingatsaya = false;
  bool shouldUpdateViewPrice = false;
  TextEditingController tNoPulsa = TextEditingController();

  final paketdataController = Get.put(PaketdataController());
  final pulsaController = Get.put(PulsaController());
  final helperController = Get.put(HelperController());

  PhoneContact? _phoneContact;

  int lengthNoTelepon = 0;
  var pickNumber = '';

  @override
  void initState() {
    super.initState();
    // print(pulsaController.productList);
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
                      child: GetBuilder<PaketdataController>(
                        init: PaketdataController(),
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
                                      decoration: BoxDecoration(
                                        color: oceanColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          'assets/images/telpon.png',
                                          fit: BoxFit.contain,
                                          width: 7.0.h,
                                          height: 7.0.h,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 1.0.h),
                                    Text(
                                      'Paket Data',
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
                                          left: 2.0.h, right: 2.0.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 7.0.h),
                                            child: Text(
                                              'Nomor Handphone',
                                              style: TextStyle(
                                                fontSize: 11.0.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF83858B),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1.0.h,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              // Image.asset(
                                              //   'assets/images/telkomsel.png',
                                              //   height: 5.0.h,
                                              // ),
                                              Container(
                                                height: 5.0.h,
                                                width: 5.0.h,
                                                color: whiteColor,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    tNoPulsa.text = '';
                                                  },
                                                  child: _data.logoProvider
                                                              .value ==
                                                          ''
                                                      ? Container()
                                                      : Image.asset(
                                                          _data.logoProvider
                                                              .value,
                                                          width: 5.0.h,
                                                        ),
                                                ),
                                              ),

                                              SizedBox(width: 2.0.h),
                                              Container(
                                                width: 65.w,
                                                height: 6.h,
                                                child: Container(
                                                  width: 60.0.w,
                                                  height: 5.0.h,
                                                  child: TextField(
                                                    controller: tNoPulsa,
                                                    keyboardType:
                                                        TextInputType.phone,
                                                    // onChanged: (a) {
                                                    //   // lengthNoTelepon =
                                                    //   //     a.length;
                                                    //   // pulsaController
                                                    //   //     .checkNomorPonsel(
                                                    //   //         a, context);
                                                    //   lengthNoTelepon =
                                                    //       a.length;
                                                    //   pulsaController
                                                    //       .checkNomorPonsel(
                                                    //           a, context);

                                                    //   setState(() {
                                                    //     shouldUpdateViewPrice =
                                                    //         true;
                                                    //   });
                                                    //   if (a.length > 11) {
                                                    //     Get.snackbar(
                                                    //         '', 'message',
                                                    //         backgroundColor:
                                                    //             whiteColor);
                                                    //   } else {
                                                    //     Get.back();
                                                    //   }
                                                    // },
                                                    onChanged: (a) {
                                                      lengthNoTelepon =
                                                          a.length;
                                                      paketdataController
                                                          .checkNomorPonsel(
                                                              a, context);

                                                      setState(() {
                                                        shouldUpdateViewPrice =
                                                            true;
                                                      });

                                                      // Tambahkan validasi untuk angka yang dimasukkan
                                                      if (a.isNotEmpty) {
                                                        int enteredNumber =
                                                            int.tryParse(a) ??
                                                                0;
                                                        if (enteredNumber <
                                                            11) {
                                                          // Tampilkan Snackbar sebagai alternatif pesan validasi
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                  'Nomor harus minimal 11 digit'),
                                                              backgroundColor:
                                                                  Colors.red,
                                                            ),
                                                          );
                                                          //   } else {
                                                          //     // Reset pesan validasi jika angka sudah sesuai
                                                          //     setState(() {});
                                                          //   }
                                                          // } else {
                                                          //   // Reset pesan validasi jika field kosong
                                                          //   setState(() {});
                                                        }
                                                      }
                                                    },
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          'Input nomor handphone',
                                                      hintStyle: TextStyle(
                                                        fontSize: 10.0.sp,
                                                        color: greyTextColor,
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        borderSide: BorderSide(
                                                            color: Colors.blue),
                                                      ),
                                                      suffixIcon:
                                                          GestureDetector(
                                                        onTap: () {
                                                          tNoPulsa.clear();
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Icon(
                                                            Icons.close,
                                                            size: 20,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  //     TextField(
                                                  //   controller: tNoPulsa,
                                                  //   keyboardType:
                                                  //       TextInputType.phone,
                                                  //   onChanged:
                                                  //       (nomorHandphone) {
                                                  //     lengthNoTelepon =
                                                  //         nomorHandphone.length;
                                                  //     pulsaController
                                                  //         .checkNomorPonsel(
                                                  //             nomorHandphone,
                                                  //             context);

                                                  //     setState(() {
                                                  //       shouldUpdateViewPrice =
                                                  //           true;
                                                  //     });

                                                  //     // Validasi untuk nomor yang dimasukkan
                                                  //     if (nomorHandphone
                                                  //         .isNotEmpty) {
                                                  //       int nomorTerparsing =
                                                  //           int.tryParse(
                                                  //                   nomorHandphone) ??
                                                  //               0;
                                                  //       if (nomorTerparsing <
                                                  //           11) {
                                                  //         // Tampilkan pesan validasi atau ambil tindakan yang sesuai
                                                  //         // Anda dapat mengganti baris berikut dengan logika validasi khusus Anda
                                                  //         print(
                                                  //             'Nomor harus lebih besar dari atau sama dengan 11');
                                                  //         // Tambahkan kode untuk menangani kesalahan validasi, misalnya, menampilkan pesan kesalahan
                                                  //       }
                                                  //     }
                                                  //   },
                                                  //   decoration: InputDecoration(
                                                  //     hintText:
                                                  //         'Masukkan nomor handphone',
                                                  //     hintStyle: TextStyle(
                                                  //       fontSize: 10.0.sp,
                                                  //       color: greyTextColor,
                                                  //     ),
                                                  //     border:
                                                  //         OutlineInputBorder(
                                                  //       borderRadius:
                                                  //           BorderRadius
                                                  //               .circular(12.0),
                                                  //     ),
                                                  //     enabledBorder:
                                                  //         OutlineInputBorder(
                                                  //       borderRadius:
                                                  //           BorderRadius
                                                  //               .circular(12.0),
                                                  //       borderSide: BorderSide(
                                                  //           color: Colors.grey),
                                                  //     ),
                                                  //     focusedBorder:
                                                  //         OutlineInputBorder(
                                                  //       borderRadius:
                                                  //           BorderRadius
                                                  //               .circular(12.0),
                                                  //       borderSide: BorderSide(
                                                  //           color: Colors.blue),
                                                  //     ),
                                                  //     suffixIcon:
                                                  //         GestureDetector(
                                                  //       onTap: () {
                                                  //         tNoPulsa.clear();
                                                  //       },
                                                  //       child: Container(
                                                  //         padding:
                                                  //             EdgeInsets.all(
                                                  //                 10),
                                                  //         decoration:
                                                  //             BoxDecoration(
                                                  //           shape:
                                                  //               BoxShape.circle,
                                                  //         ),
                                                  //         child: Icon(
                                                  //           Icons.close,
                                                  //           size: 20,
                                                  //           color: Colors.grey,
                                                  //         ),
                                                  //       ),
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2.0.h,
                                              ),
                                              GestureDetector(
                                                onTap: () async {
                                                  var result = await showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                              context) =>
                                                          const KontakView());

                                                  if (result != null &&
                                                      result is String) {
                                                    String formattedNumber =
                                                        result
                                                            .replaceAll(
                                                                '+62', '0')
                                                            .replaceAll('-', '')
                                                            .replaceAll(
                                                                ' ', '');

                                                    setState(() {
                                                      tNoPulsa.text =
                                                          formattedNumber;
                                                      paketdataController
                                                          .checkNomorPonsel(
                                                              formattedNumber,
                                                              context);
                                                    });
                                                  }
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      top: 1.0.h),
                                                  child: Image.asset(
                                                    'assets/images/kontak.png',
                                                    height: 4.0.h,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.0.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 2.0.h, right: 6.0.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Simpan Nomor untuk trx selanjutnya',
                                            style: TextStyle(
                                                fontSize: 7.0.sp,
                                                fontWeight: FontWeight.w400,
                                                color: greyTextColor),
                                          ),
                                          SizedBox(
                                            width: 1.0.w,
                                          ),
                                          FlutterSwitch(
                                            width: 40.0,
                                            height: 20.0,
                                            toggleSize: 15.0,
                                            value: status,
                                            inactiveColor: abumuda,
                                            padding: 4.0,
                                            showOnOff: false,
                                            onToggle: (val) {
                                              setState(() {
                                                status = val;
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.0.h,
                            ),
                            Container(
                                height: Get.height * 0.60,
                                color: whiteColor,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 2.0.h,
                                  ),
                                  child: Obx(() => SingleChildScrollView(
                                        child: Container(
                                          color: whiteColor,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: paketdataController
                                                .listPulsaOnly
                                                .map((element) {
                                              return viewprice(
                                                  _data.isCek.value == true
                                                      ? true
                                                      : false,
                                                  element['provider'],
                                                  element['productCode'],
                                                  element['productName'],
                                                  element['price'],
                                                  element['type']
                                                  // _data.provider.value,
                                                  // _data.logoProvider.value,
                                                  );
                                            }).toList(),
                                          ),
                                        ),
                                      )),
                                )),
                            // Container(
                            //     color: whiteColor,
                            //     padding: EdgeInsets.all(16.0),
                            //     child: Center(
                            //         child: SizedBox(
                            //       width: 41.0.h,
                            //       height: 6.0.h,
                            //       child: ElevatedButton(
                            //         onPressed: () async {
                            //           print('masuk');

                            //           showFlexibleBottomSheet(
                            //             minHeight: 0,
                            //             initHeight: 0.5,
                            //             maxHeight: 0.5,
                            //             context: context,
                            //             builder: _buildBottomSheet,
                            //             isExpand: false,
                            //           );
                            //         },
                            //         style: ElevatedButton.styleFrom(
                            //           primary: mainColor,
                            //           shape: RoundedRectangleBorder(
                            //             borderRadius:
                            //                 BorderRadius.circular(10.0),
                            //           ),
                            //         ),
                            //         child: Text(
                            //           'Lanjutkan',
                            //           style: TextStyle(
                            //             fontSize: 14.0.sp,
                            //             fontWeight: FontWeight.bold,
                            //             color: Color(0xFFFDF8F8),
                            //           ),
                            //         ),
                            //       ),
                            //     ))
                            // )
                          ],
                        ),
                      ),
                    )
                  ],
                ))
              ],
            )));
  }

  Widget viewprice(
    bool isHide,
    var provider,
    var productCode,
    var productName,
    var price,
    var type,
  ) {
    return Container(
      // height: Get.height * 0.10,
      child: Visibility(
        visible: isHide,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: EdgeInsets.only(top: 1.0.h, left: 1.5.h, right: 1.5.h),
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: GestureDetector(
              onTap: () async {
                showFlexibleBottomSheet(
                  minHeight: 0,
                  initHeight: 0.5,
                  maxHeight: 0.5,
                  context: context,
                  builder: (context, scrollController, bottomSheetOffset) {
                    return _buildBottomSheet(price, productName, productCode,
                        context, scrollController, bottomSheetOffset);
                  },
                  isExpand: false,
                );
                // pulsaController.transaksipulsa(
                //     tNoPulsa.text, widget.pin, context);
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        ),
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 20.0.h,
                          child: Text(
                            productName,
                            style: TextStyle(
                              fontSize: 11.0.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 3.4.h,
                        ),
                        Text(
                          NumberFormat.currency(
                            locale: 'id-ID',
                            symbol: 'Rp.',
                            decimalDigits: 0,
                          ).format(int.parse(price)),
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSheet(
    var price,
    var productName,
    var productCode,
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return Material(
      child: Container(
        color: whiteColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(2.5.h, 2.0.h, 2.5.h, 0.0.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Konfirmasi pembayaran',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.close,
                          color: Color(0xFF8E8C8C),
                          size: 20,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Text(
                    'Apa Anda yakin ingin melanjutkan\ntransaksi ini?',
                    style: TextStyle(
                      fontSize: 12.0.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Divider(
                    color: Colors.grey.shade500,
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Produk',
                        style: TextStyle(
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.1,
                      ),
                      Text(
                        ':',
                        style: TextStyle(
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 2.0.h,
                      ),
                      Container(
                        width: 28.0.h,
                        child: Text(
                          productName,
                          style: TextStyle(
                            fontSize: 12.0.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'No. HP',
                        style: TextStyle(
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.1,
                      ),
                      Text(
                        ':',
                        style: TextStyle(
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 2.0.h,
                      ),
                      Text(
                        tNoPulsa.text,
                        style: TextStyle(
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Harga',
                        style: TextStyle(
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.12,
                      ),
                      Text(
                        ':',
                        style: TextStyle(
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 2.0.h,
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: 'id-ID',
                          symbol: 'Rp.',
                          decimalDigits: 0,
                        ).format(int.parse(price)),
                        style: TextStyle(
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  Divider(
                    color: Colors.grey.shade500,
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Harga',
                        style: TextStyle(
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.12,
                      ),
                      Text(
                        ':',
                        style: TextStyle(
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 2.0.h,
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: 'id-ID',
                          symbol: 'Rp.',
                          decimalDigits: 0,
                        ).format(int.parse(price)),
                        style: TextStyle(
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Harga jual akan tampil pada struk bukti pembelian',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 8.0.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Container(
                      color: whiteColor,
                      padding: EdgeInsets.all(16.0),
                      child: Center(
                          child: SizedBox(
                        width: 35.0.h,
                        height: 6.0.h,
                        child: ElevatedButton(
                          onPressed: () async {
                            // Dialogs.materialDialog(
                            //   customView: Image.asset(
                            //     'assets/images/pt4.png',
                            //     height: 17.0.h,
                            //   ),
                            //   msg:
                            //       'Apakah Data yang Anda isi sudah\nbenar & lengkap?',
                            //   msgStyle: TextStyle(
                            //     fontSize: 12.0.sp,
                            //     fontWeight: FontWeight.w400,
                            //   ),
                            //   titleAlign: TextAlign.center,
                            //   color: whiteColor,
                            //   context: context,
                            //   actions: [
                            //     IconsButton(
                            //       onPressed: () async {},
                            //       text: 'Yaa Sudah',
                            //       color: mainColor,
                            //       textStyle: TextStyle(
                            //         color: whiteColor,
                            //       ),
                            //     ),
                            //     IconsButton(
                            //       onPressed: () {
                            //         Get.back();
                            //       },
                            //       text: 'Cek lagi deh',
                            //       color: whiteColor,
                            //       textStyle: TextStyle(
                            //         color: mainColor,
                            //       ),
                            //     )
                            //   ],
                            // );
                            Get.to(PinView(
                              productName: productName,
                              nomorTelepon: tNoPulsa.text,
                              harga: price,
                              productCode: productCode,
                            ));

                            // pulsaController.transaksipulsa(widget.pin, tNoPulsa,
                            //     productCode, price, productName, context);
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
            ),
          ],
        ),
      ),
    );
  }
}
