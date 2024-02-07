import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/data/popup/views/customPopup.dart';
import 'package:ppob_mpay1/app/data/popup/views/loadingcustom.dart';
import 'package:ppob_mpay1/app/modules/home/controllers/home_controller.dart';
import 'package:ppob_mpay1/app/modules/saldo/controllers/saldo_controller.dart';
import 'package:ppob_mpay1/app/modules/saldo/views/inquirysaldo_view.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/services.dart';

class SaldoView extends StatefulWidget {
  SaldoView({super.key});

  @override
  State<SaldoView> createState() => _SaldoViewState();
}

class _SaldoViewState extends State<SaldoView> {
  void initState() {
    super.initState();
    homeController.CheckBalance(context);
  }

  void _handleRefresh() {
    homeController.CheckBalance(context);
  }

  Future<void> _refreshBalance() async {
    helperController.loading(context);
    setState(() {
      isRefreshing = true;
    });
    await homeController.CheckBalance(context);
    setState(() {
      isRefreshing = false;
    });
    Get.back();
  }

  // Future<void> _showLoadingWithDelay() async {
  //   await Future.delayed(Duration(seconds: 5));
  //   isLoading.value = true;
  // }

  final _formKey = GlobalKey<FormState>();
  final isLoading = false.obs;
  bool isRefreshing = false;
  TextEditingController saldo = TextEditingController();
  final homeController = Get.put(HomeController());
  final saldoController = Get.put(SaldoController());
  final helperController = Get.put(HelperController());

  var bankValue;
  int saldoanda = 0;
  List<String> bank = ["MANDIRI", "BCA", "BRI", "BNI"];

  String _formatCurrency(double amount) {
    final currencyFormat =
        NumberFormat.currency(locale: 'id-ID', symbol: '', decimalDigits: 0);
    return currencyFormat.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      // backgroundColor: Color(0xFFcddff3),
      // backgroundColor: Color(0xFF41547a),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        title: Text(
          'Top Up Saldo',
          style: TextStyle(
            color: whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: whiteColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 1.h,
                  ),
                  Center(
                    child: Container(
                      width: Get.width * 0.85,
                      decoration: BoxDecoration(
                        color: whiteColor,

                        // borderRadius: BorderRadius.only(
                        //   topLeft: Radius.circular(4.h),
                        //   topRight: Radius.circular(5.h),
                        //   bottomLeft: Radius.circular(5.h),
                        // ),
                        borderRadius: BorderRadius.circular(3.5.h),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(3.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          if (homeController.balance.value ==
                                                  '0' &&
                                              isLoading.value)
                                            SizedBox(
                                              width: 12.0,
                                              height: 12.0,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2.0,
                                              ),
                                            ),
                                          if (!(homeController.balance.value ==
                                                  '0' &&
                                              isLoading.value))
                                            Text(
                                              'Rp. ' +
                                                  NumberFormat.currency(
                                                    locale: 'id-ID',
                                                    symbol: '',
                                                    decimalDigits: 0,
                                                  ).format(double.parse(
                                                      '${homeController.balance.value}')) +
                                                  '',
                                              style: TextStyle(
                                                color: mainColor,
                                                fontSize: 20.0.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.0.h,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/Dompet.png',
                                            height: 3.h,
                                          ),
                                          // SizedBox(
                                          //   width: 0.5.h,
                                          // ),
                                          Text(
                                            'Saldo',
                                            style: TextStyle(
                                              color: greyColor,
                                              fontSize: 12.0.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 1.5.h,
                                          ),
                                          Container(
                                            color: Colors.grey,
                                            height: 3.h,
                                            width: 1,
                                          ),
                                          SizedBox(
                                            width: 1.5.h,
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              setState(() {
                                                isLoading.value = true;
                                              });
                                              await Future.delayed(
                                                  Duration(seconds: 2));
                                              await _refreshBalance();
                                              setState(() {
                                                isLoading.value = false;
                                              });
                                            },
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Remix.refresh_line,
                                                  color: greyColor,
                                                  size: 14.0.sp,
                                                ),
                                                SizedBox(
                                                  width: 0.5.h,
                                                ),
                                                Text(
                                                  'Refresh',
                                                  style: TextStyle(
                                                    color: greyColor,
                                                    fontSize: 12.0.sp,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                height: Get.height * 0.80,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(3.5.h),
                    topRight: Radius.circular(3.5.h),
                  ),
                  // borderRadius: BorderRadius.circular(3.h)
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 2.h, right: 2.h, top: 3.h),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nominal (Rp.)',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Form(
                                key: _formKey,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: TextFormField(
                                  minLines: 1,
                                  controller: saldo,
                                  keyboardType: TextInputType.number,
                                  onChanged: (a) {
                                    saldoanda = int.tryParse(a) ?? 0;
                                    if (a.isNotEmpty) {
                                      final cleanedValue =
                                          a.replaceAll(RegExp(r'[^\d]'), '');
                                      final formatter = NumberFormat.currency(
                                        locale: 'id-ID',
                                        symbol: '',
                                        decimalDigits: 0,
                                      );
                                      final formattedValue = formatter
                                          .format(int.parse(cleanedValue));
                                      saldo.value = TextEditingValue(
                                        text: formattedValue,
                                        selection: TextSelection.collapsed(
                                            offset: formattedValue.length),
                                      );
                                      print(cleanedValue);
                                    }
                                  },
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey.shade200,
                                    filled: true,
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        saldo.clear();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.close,
                                          size: 20,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    hintText: 'Masukkan nominal ',
                                    hintStyle: TextStyle(
                                      fontSize: 12.0.sp,
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Masukkan jumlah saldo';
                                    }

                                    final cleanedValue =
                                        value.replaceAll(RegExp(r'[^\d]'), '');
                                    int inputSaldo =
                                        int.tryParse(cleanedValue) ?? 0;
                                    if (inputSaldo < 10000) {
                                      return 'Saldo minimal harus Rp 10.000';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.0.h,
                        ),
                        Text(
                          'Metode Pembayaran',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 1.0.h,
                        ),
                        DropdownButtonFormField2<String>(
                          isExpanded: true,
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            // Add more decoration..
                          ),
                          hint: const Text(
                            '-- Pilih Bank --',
                            style: TextStyle(fontSize: 14),
                          ),
                          items: bank
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Select Bank';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            print(value.toString());
                            setState(() {
                              bankValue = value;
                            });
                          },
                          onSaved: (value) {
                            bankValue = value.toString();
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.only(right: 8),
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 24,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                        SizedBox(
                          height: 5.0.h,
                        ),
                        Center(
                          child: SizedBox(
                            width: Get.width * 0.80,
                            height: 7.0.h,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  final cleanedValue = saldo.text
                                      .replaceAll(RegExp(r'[^\d]'), '');
                                  final parsedValue =
                                      int.tryParse(cleanedValue) ?? 0;
                                  if (parsedValue >= 10000) {
                                    if (bankValue == null) {
                                      await helperController.popUpMessage(
                                          'Silahkan pilih bank terlebih dahulu',
                                          context);
                                    } else {
                                      await saldoController.Topupsaldo(
                                        context,
                                        saldo.text
                                            .replaceAll(RegExp(r'[^\d]'), ''),
                                        bankValue,
                                      );
                                    }
                                  } else {}
                                }
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
                                  fontSize: 12.0.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFFDF8F8),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Center(
                        //   child: SizedBox(
                        //     width: Get.width * 0.80,
                        //     height: 6.0.h,
                        //     child: ElevatedButton(
                        //       onPressed: () async {
                        //         await saldoController.Topupsaldo(
                        //           context,
                        //           saldo.text,
                        //           bankValue,
                        //         );
                        //       },
                        //       style: ElevatedButton.styleFrom(
                        //         primary: mainColor,
                        //         shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(10.0),
                        //         ),
                        //       ),
                        //       child: Text(
                        //         'Lanjutkan',
                        //         style: TextStyle(
                        //           fontSize: 12.0.sp,
                        //           fontWeight: FontWeight.w400,
                        //           color: Color(0xFFFDF8F8),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Center(
                        //   child: SizedBox(
                        //     width: Get.width * 0.80,
                        //     height: 6.0.h,
                        //     child: ElevatedButton(
                        //       onPressed: saldoanda >= 10000
                        //           ? () async {
                        //               if (_formKey.currentState!.validate()) {
                        //                 await saldoController.Topupsaldo(
                        //                   context,
                        //                   saldo.text,
                        //                   bankValue,
                        //                 );
                        //               }
                        //             }
                        //           : null,
                        //       style: ElevatedButton.styleFrom(
                        //         primary: saldoanda >= 10000
                        //             ? mainColor
                        //             : Colors.grey,
                        //         shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(10.0),
                        //         ),
                        //         // elevation: 10,
                        //       ),
                        //       child: Text(
                        //         'Lanjutkan',
                        //         style: TextStyle(
                        //           fontSize: 14.0.sp,
                        //           fontWeight: FontWeight.bold,
                        //           color: Color(0xFFFDF8F8),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
