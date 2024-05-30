import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/modules/ewallet/emoney/views/emoneykartu_view.dart';
import 'package:ppob_mpay1/app/modules/ewallet/emoney/views/emoneynfc_view.dart';
import 'package:sizer/sizer.dart';
import '../controllers/emoney_controller.dart';

class InputKartuView extends StatefulWidget {
  const InputKartuView({super.key});

  @override
  State<InputKartuView> createState() => _InputKartuViewState();
}

class _InputKartuViewState extends State<InputKartuView> {
  final emoneyController = Get.put(EmoneyController());
  TextEditingController idpel = TextEditingController();

  int lengthIdpel = 0;

  final formkey = GlobalKey<FormState>();

  //List Harga Top Up
  final List<int> listHarga = [20000, 50000, 100000, 200000, 300000, 400000];
  String selectedAmount = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Masukan Nomor Kartu',
          style: TextStyle(
            // fontSize: 14.0.sp,
            fontWeight: FontWeight.w600,
            color: mainColor,
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
          child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 2.0.h,
              horizontal: 3.0.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/emoney.png',
                    width: 40.w,
                    height: 10.h,
                  ),
                ),
                SizedBox(
                  height: 2.0.h,
                ),
                Text(
                  'Masukan ID Pelanggan',
                  style: TextStyle(
                    fontSize: 12.0.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 1.0.h,
                ),
                Form(
                  key: formkey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: TextFormField(
                    minLines: 1,
                    maxLength: 15,
                    controller: idpel,
                    onChanged: (a) {
                      setState(() {
                        lengthIdpel = a.length;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      // hintText: 'Masukkan Id Pelanggan',
                      hintStyle: TextStyle(
                        fontSize: 12.0.sp,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    validator: (value) {
                      if (lengthIdpel < 7) {
                        return 'ID pelanggan minimal 7 angka dan maximal 15 angka';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 2.0.h,
                ),
                Text(
                  'Nominal (Rp.)',
                  style: TextStyle(
                    fontSize: 12.0.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 2.0.h,
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: listHarga.map((amount) {
                      bool isSelected = selectedAmount == amount.toString();
                      return GestureDetector(
                        onTap: () async {
                          setState(() {
                            selectedAmount = amount.toString();
                          });
                          print(amount);
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 2.5.h),
                          padding: EdgeInsets.all(2.0.h),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            border: isSelected ? Border.all(color: mainColor, width: 2) : null,
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
                                // color: mainColor,
                                width: 40.0.w,
                                child: Text(
                                  'Top Up Saldo E-Money',
                                  style: TextStyle(
                                    fontSize: 11.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Container(
                                width: 40.0.w,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      NumberFormat.currency(
                                        locale: 'id-ID',
                                        symbol: 'Rp.',
                                        decimalDigits: 0,
                                      ).format(amount),
                                      style: TextStyle(
                                        color: mainColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
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
                      width: 41.0.h,
                      height: 6.0.h,
                      child: ElevatedButton(
                        onPressed: idpel.text.length >= 7 && selectedAmount.isNotEmpty
                            ? () async {
                                await emoneyController.emoneyInquiry(idpel.text, selectedAmount, context);
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: idpel.text.length >= 7 ? mainColor : Colors.grey.shade700,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          // elevation: 10,
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
              ],
            ),
          ),
        ],
      )),
    );
  }
}
