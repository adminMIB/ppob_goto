// ignore_for_file: prefer_const_constructors

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/modules/ewallet/gopay/controllers/gopay_controller.dart';
import 'package:ppob_mpay1/app/modules/ewallet/ovo/controllers/ovo_controller.dart';
import 'package:ppob_mpay1/app/modules/pin/views/pin_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pulsa-paketdata/pulsa/views/kontak_view.dart';
import 'package:ppob_mpay1/main.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:bottom_sheet/bottom_sheet.dart';

class GopayView extends StatefulWidget {
  const GopayView({Key? key}) : super(key: key);

  @override
  _GopayViewState createState() => _GopayViewState();
}

class _GopayViewState extends State<GopayView> {
  bool status = false;
  int selectedItemIndex = -1;

  bool _ingatsaya = false;
  bool shouldUpdateViewPrice = false;
  TextEditingController ovo = TextEditingController();

  final gopayController = Get.put(GopayController());
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
                      child: GetBuilder<GopayController>(
                        init: GopayController(),
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
                                        child: Image.asset(
                                          'assets/images/gopay.png',
                                          fit: BoxFit.contain,
                                          width: 7.0.h,
                                          height: 7.0.h,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 1.0.h),
                                    Text(
                                      'Gopay Customer',
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
                                                      ovo.text = '';
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
                                                      controller: ovo,
                                                      keyboardType:
                                                          TextInputType.phone,
                                                      onChanged: (a) {
                                                        lengthNoTelepon =
                                                            a.length;
                                                        gopayController
                                                            .checkNomorPonsel(
                                                                a, context);

                                                        setState(() {
                                                          shouldUpdateViewPrice =
                                                              true;
                                                        });
                                                      },
                                                      decoration:
                                                          InputDecoration(
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
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .grey),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .blue),
                                                        ),
                                                        suffixIcon:
                                                            GestureDetector(
                                                          onTap: () {
                                                            ovo.clear();
                                                          },
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10),
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Icon(
                                                              Icons.close,
                                                              size: 20,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
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
                                                              .replaceAll(
                                                                  '-', '')
                                                              .replaceAll(
                                                                  ' ', '');

                                                      setState(() {
                                                        ovo.text =
                                                            formattedNumber;
                                                        gopayController
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
                                        )),
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
                              color: whiteColor,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  viewprice(
                                      _data.isCek.value == true ? true : false,
                                      _data.listNominalPulsa,
                                      _data.provider.value,
                                      _data.logoProvider.value),
                                ],
                              ),
                            ),
                            // SizedBox(
                            //   height: 6.0.h,
                            // ),
                            Container(
                                color: whiteColor,
                                padding: EdgeInsets.all(16.0),
                                child: Center(
                                    child: SizedBox(
                                  width: 41.0.h,
                                  height: 6.0.h,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      print('masuk');

                                      showFlexibleBottomSheet(
                                        minHeight: 0,
                                        initHeight: 0.5,
                                        maxHeight: 0.5,
                                        context: context,
                                        builder: _buildBottomSheet,
                                        isExpand: false,
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: mainColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                    )
                  ],
                ))
              ],
            )));
  }

  Widget viewprice(
    bool isHide,
    List dataPulsa,
    String provider,
    String logoProvider,
  ) {
    return Container(
      height: Get.height * 0.45,
      child: Visibility(
        visible: isHide,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: EdgeInsets.only(top: 1.0.h, left: 1.5.h, right: 1.5.h),
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: dataPulsa.length,
              itemBuilder: (context, index) {
                var element = dataPulsa[index];
                bool isSelected = index == selectedItemIndex;

                return GestureDetector(
                  onTap: () async {
                    controller.restart();
                    if (ovo.text.isEmpty) {
                      Flushbar(
                        message: 'Mohon masukkan nomor terlebih dahulu!',
                        duration: Duration(seconds: 3),
                      )..show(context);
                    } else {
                      setState(() {
                        selectedItemIndex = index;
                      });
                    }
                  },
                  child: Container(
                      margin: EdgeInsets.only(bottom: 8.0),
                      padding: EdgeInsets.all(12.0),
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
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected ? Colors.grey : Colors.grey,
                                width: 2,
                              ),
                              color:
                                  isSelected ? Colors.grey : Colors.transparent,
                            ),
                          ),
                          SizedBox(width: 12),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Gopay' +
                                        ' ' +
                                        NumberFormat.currency(
                                          locale: 'id-ID',
                                          symbol: '',
                                          decimalDigits: 0,
                                        ).format(double.parse(element.nominal)),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color:
                                          isSelected ? Colors.blue : blackColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Text(
                                    'Gopay' +
                                        ' ' +
                                        NumberFormat.currency(
                                          locale: 'id-ID',
                                          symbol: '',
                                          decimalDigits: 0,
                                        ).format(double.parse(element.nominal)),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color:
                                          isSelected ? Colors.blue : blackColor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 15.0.h,
                              ),
                              Text(
                                NumberFormat.currency(
                                  locale: 'id-ID',
                                  symbol: 'Rp.',
                                  decimalDigits: 0,
                                ).format(int.parse(element.nominal)),
                                style: TextStyle(
                                  color: isSelected ? Colors.blue : blackColor,
                                ),
                              )
                            ],
                          ),
                        ],
                      )

                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Text(
                      //       NumberFormat.currency(
                      //         locale: 'id-ID',
                      //         symbol: 'Rp.',
                      //         decimalDigits: 0,
                      //       ).format(int.parse(element.nominal)),
                      //       style: TextStyle(
                      //         color: isSelected ? Colors.blue : blackColor,
                      //       ),
                      //     ),
                      //   ],
                      // ),

                      ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSheet(
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
                          fontSize: 13.0.sp,
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
                    height: Get.height * 0.02,
                  ),
                  Text(
                    'Apa Anda yakin ingin melanjutkan\ntransaksi ini?',
                    style: TextStyle(
                      fontSize: 12.0.sp,
                      // fontWeight: FontWeight.w500,
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
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Produk',
                            style: TextStyle(
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            'No HP',
                            style: TextStyle(
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            'Harga',
                            style: TextStyle(
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 4.0.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ':',
                            style: TextStyle(
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            ':',
                            style: TextStyle(
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            ':',
                            style: TextStyle(
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 2.0.h,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Telkomsel prabayar 10.000',
                            style: TextStyle(
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            '081290001234',
                            style: TextStyle(
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            'Rp. 10.250',
                            style: TextStyle(
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  Divider(
                    color: Colors.grey.shade500,
                  ),
                  Row(
                    children: [
                      Text(
                        'Harga Jual',
                        style: TextStyle(
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 1.0.h,
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
                        'Rp. 11.500',
                        style: TextStyle(
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      // Checkbox(
                      //   value: _ingatsaya,
                      //   onChanged: (ingatSaya) {
                      //     setState(() {
                      //       _ingatsaya = ingatSaya ?? false;
                      //     });
                      //   },
                      // ),
                      // Text(
                      //   'Simpan untuk trx selanjutnya',
                      //   style: TextStyle(
                      //     fontSize: 8.0.sp,
                      //     color: blackColor,
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 2.0.h,
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
                      padding: EdgeInsets.all(16.0),
                      child: Center(
                          child: SizedBox(
                        width: 35.0.h,
                        height: 6.0.h,
                        child: ElevatedButton(
                          onPressed: () async {
                            // Get.to(InvoiceView());
                            Get.to(PinView());
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
