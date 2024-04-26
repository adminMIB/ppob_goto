import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/modules/ewallet/emoney/views/emoneykartu_view.dart';
import 'package:ppob_mpay1/app/modules/ewallet/emoney/views/emoneynfc_view.dart';
import 'package:sizer/sizer.dart';
import '../controllers/emoney_controller.dart';

class InputKartuView extends StatefulWidget {
  const InputKartuView({Key? key}) : super(key: key);

  @override
  _InputKartuViewState createState() => _InputKartuViewState();
}

class _InputKartuViewState extends State<InputKartuView> {
  bool status = false;
  int selectedItemIndex = -1;
  bool isSelected = false;

  int wilayah = 0;
  int lengthNoTelepon = 0;
  int saldoanda = 0;
  var pickNumber = '';

  bool shouldUpdateViewPrice = false;
  final formkey = GlobalKey<FormState>();

  TextEditingController idpel = TextEditingController();

  final emoneyController = Get.put(EmoneyController());

  final List<int> availableAmounts = [20000, 50000, 100000, 200000, 300000, 400000];
  String selectedAmount = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: mainColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Masukan Nomor Kartu',
          style: TextStyle(
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w700,
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
                      'assets/images/emoneyhp.png',
                      height: 20.0.h,
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
                          wilayah = a.length;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Masukkan Kode ',
                        hintStyle: TextStyle(
                          fontSize: 12.0.sp,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      validator: (value) {
                        if (wilayah < 7) {
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
                    height: 1.0.h,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: availableAmounts.length,
                    itemBuilder: (context, index) {
                      final amount = availableAmounts[index];
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedAmount = amount.toString();
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedAmount == amount.toString() ? mainColor : Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            NumberFormat.currency(
                              locale: 'id-ID',
                              symbol: 'Rp.',
                              decimalDigits: 0,
                            ).format(amount),
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: selectedAmount == amount.toString() ? whiteColor : blackColor,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 3.0.h,
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
