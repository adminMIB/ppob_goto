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
import 'package:ppob_mpay1/app/modules/pin/views/pin_view.dart';
import 'package:ppob_mpay1/app/modules/pulsa/controllers/pulsa_controller.dart';
import 'package:ppob_mpay1/app/modules/pulsa/product.dart';
import 'package:ppob_mpay1/app/modules/pulsa/views/kontak_view.dart';
import 'package:ppob_mpay1/main.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class PulsaView extends StatefulWidget {
  final String? pin;
  const PulsaView({
    Key? key,
    this.pin,
  }) : super(key: key);
  @override
  _PulsaViewState createState() => _PulsaViewState();
}

class _PulsaViewState extends State<PulsaView> {
  bool status = false;
  int selectedItemIndex = -1;
  bool _ingatsaya = false;
  bool shouldUpdateViewPrice = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController tNoPulsa = TextEditingController();

  final pulsaController = Get.put(PulsaController());
  final helperController = Get.put(HelperController());

  PhoneContact? _phoneContact;
  String errorText = '';
  int lengthNoTelepon = 0;

  // int lengthNoTelepon = 0;
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
            appBar: AppBar(
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
                                      'Pulsa Pascabayar',
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              // Image.asset(
                                              //   'assets/images/telkomsel.png',
                                              //   height: 5.0.h,
                                              // ),
                                              Container(
                                                height: 8.0.h,
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
                                                          alignment: Alignment
                                                              .topCenter,
                                                        ),
                                                ),
                                              ),

                                              SizedBox(width: 2.0.h),
                                              Form(
                                                key: _formkey,
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                child: Container(
                                                  width: 65.w,
                                                  // height: 7.h,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      TextFormField(
                                                        minLines: 1,
                                                        maxLength: 13,
                                                        controller: tNoPulsa,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        onChanged: (a) async {
                                                          lengthNoTelepon =
                                                              a.length;
                                                          pulsaController
                                                              .checkNomorPonsel(
                                                                  a, context);
                                                          setState(() {
                                                            shouldUpdateViewPrice =
                                                                true;
                                                          });
                                                          await Future.delayed(
                                                              Duration(
                                                                  milliseconds:
                                                                      2000));
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .grey),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .grey),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0), // Same circular border radius
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .blue),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          hintText:
                                                              'Masukkan Nomer telepon',
                                                          hintStyle: TextStyle(
                                                              fontSize: 12.0.sp,
                                                              color: Colors.grey
                                                                  .shade500),
                                                        ),
                                                        validator: (value) {
                                                          if (lengthNoTelepon <
                                                              7) {
                                                            return 'Nomor handphone minimal 10 karakter';
                                                          }
                                                          return null; // No error message here
                                                        },
                                                      ),
                                                      // Display the validation message here
                                                    ],
                                                  ),
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
                                                      pulsaController
                                                          .checkNomorPonsel(
                                                              formattedNumber,
                                                              context);
                                                    });
                                                  }
                                                },
                                                child: Container(
                                                  height: 8.0.h,
                                                  width: 3.0.h,
                                                  color: whiteColor,
                                                  child: Image.asset(
                                                    'assets/images/kontak.png',
                                                    height: 4.0.h,
                                                    alignment:
                                                        Alignment.topCenter,
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
                              height: Get.height * 0.53,
                              color: whiteColor,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  bottom: 4.0.h,
                                ),
                                child: Obx(() => SingleChildScrollView(
                                      child: Container(
                                        color: whiteColor,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: pulsaController
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
                                                element['type']);
                                          }).toList(),
                                        ),
                                      ),
                                    )),
                              ),
                            ),
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
                  bottomSheetColor: Colors.transparent,
                  context: context,
                  builder: (context, scrollController, bottomSheetOffset) {
                    return _buildBottomSheet(
                        price,
                        productName,
                        productCode,
                        type,
                        provider,
                        context,
                        scrollController,
                        bottomSheetOffset);
                  },
                  isExpand: false,
                );
                // pulsaController.transaksipulsa(
                //     tNoPulsa.text, widget.pin, context);
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.all(15.0),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50.0.w,
                      // color: Colors.amber,
                      child: Text(
                        productName,
                        style: TextStyle(
                          fontSize: 11.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: 3.4.h,
                    // ),
                    Text(
                      NumberFormat.currency(
                        locale: 'id-ID',
                        symbol: 'Rp.',
                        decimalDigits: 0,
                      ).format(int.parse(price)),
                      style: TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                      ),
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
    var type,
    var provider,
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    bool isTextLengthValid = tNoPulsa.text.length >= 7;
    return Container(
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )),
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
                          color: mainColor,
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
                          color: blackColor,
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
                    height: 2.0.h,
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
                  SizedBox(
                    height: 2.0.h,
                  ),
                  Container(
                    color: whiteColor,
                    // padding: EdgeInsets.all(16.0),
                    child: Center(
                      child: SizedBox(
                        width: 35.0.h,
                        height: 6.0.h,
                        child:
                            // ElevatedButton(
                            //   onPressed: () async {
                            //     if (_formkey.currentState!.validate()) {
                            //       Get.to(PinView(
                            //         productName: productName,
                            //         nomorTelepon: tNoPulsa.text,
                            //         harga: price,
                            //         productCode: productCode,
                            //         type: type,
                            //         provider: provider,
                            //       ));
                            //     }
                            //   },
                            //   style: ElevatedButton.styleFrom(
                            //     primary: mainColor,
                            //     shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(10.0),
                            //     ),
                            //   ),
                            //   child: Text(
                            //     'Lanjutkan',
                            //     style: TextStyle(
                            //       fontSize: 14.0.sp,
                            //       fontWeight: FontWeight.bold,
                            //       color: Color(0xFFFDF8F8),
                            //     ),
                            //   ),
                            // ),
                            ElevatedButton(
                          onPressed: tNoPulsa.text.length >= 7
                              ? () async {
                                  if (_formkey.currentState!.validate()) {
                                    Get.to(PinView(
                                      tipeTransaksi: 'pulsa',
                                      productName: productName,
                                      nomorTelepon: tNoPulsa.text,
                                      harga: price,
                                      productCode: productCode,
                                      type: type,
                                      provider: provider,
                                    ));
                                  }
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            primary: tNoPulsa.text.length >= 7
                                ? mainColor
                                : Colors.grey.shade500,
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
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  Visibility(
                    visible: !isTextLengthValid,
                    child: Text(
                      'Nomer handphone minimal harus 10 angka',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 8.0.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
