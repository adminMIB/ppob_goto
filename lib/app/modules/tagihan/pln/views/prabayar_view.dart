import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/modules/pin/views/pin_view.dart';
import 'package:ppob_mpay1/app/modules/pulsa/controllers/pulsa_controller.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pln/controllers/pln_controller.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pln/views/bottmsheet_prabayar_view.dart';
import 'package:ppob_mpay1/main.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:bottom_sheet/bottom_sheet.dart';

class PrabayarView extends StatefulWidget {
  const PrabayarView({Key? key}) : super(key: key);

  @override
  _PrabayarViewState createState() => _PrabayarViewState();
}

class _PrabayarViewState extends State<PrabayarView> {
  bool status = false;
  int selectedItemIndex = -1;
  bool isSelected = false;

  bool shouldUpdateViewPrice = false;
  final formkey = GlobalKey<FormState>();
  TextEditingController idpel = TextEditingController();
  final plnprabayarController = Get.put(PlnController());
  final helperController = Get.put(HelperController());

  int wilayah = 0;
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
                    child: GetBuilder<PulsaController>(
                      init: PulsaController(),
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
                                  Center(
                                    child: Image.asset(
                                      'assets/images/prabayar.png',
                                      height: 5.0.h,
                                    ),
                                  ),
                                  SizedBox(height: 1.5.h),
                                  Text(
                                    'Token Listrik',
                                    style: TextStyle(color: Colors.black, fontSize: 14.0.sp, fontWeight: FontWeight.w600),
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
                                    height: 1.5.h,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.0.h, right: 2.0.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'No. ID Pelanggan / Kode bayar',
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
                                  height: 1.5.h,
                                ),
                                //List nominal Token Listrik
                                Obx(
                                  () => SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: plnprabayarController.listDenomPrabayarListrik.map((element) {
                                        return GestureDetector(
                                          onTap: () async {
                                            controller.restart();
                                            if (idpel.text.isEmpty) {
                                              Flushbar(
                                                message: 'Mohon masukkan nomor terlebih dahulu!',
                                                duration: Duration(seconds: 3),
                                              )..show(context);
                                            } else {
                                              plnprabayarController.selectedNominal.value = element.nominal;
                                              print(plnprabayarController.selectedNominal.value = element.nominal);
                                              setState(() {
                                                selectedItemIndex = plnprabayarController.listDenomPrabayarListrik.indexOf(element);
                                              });
                                            }
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(bottom: 2.0.h),
                                            padding: EdgeInsets.all(2.0.h),
                                            decoration: BoxDecoration(
                                              color: selectedItemIndex == plnprabayarController.listDenomPrabayarListrik.indexOf(element)
                                                  ? greyishColor
                                                  : whiteColor,
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
                                                  width: 35.0.w,
                                                  // color: Colors.amber,
                                                  child: Text(
                                                    'Token Listrik PLN',
                                                    style: TextStyle(
                                                      fontSize: 11.0.sp,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 40.0.w,
                                                  // color: Colors.red,
                                                  child: Align(
                                                    alignment: Alignment.centerRight,
                                                    child: FittedBox(
                                                      fit: BoxFit.scaleDown,
                                                      child: Text(
                                                        NumberFormat.currency(
                                                          locale: 'id-ID',
                                                          symbol: 'Rp.',
                                                          decimalDigits: 0,
                                                        ).format(int.parse(element.nominal)),
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
                                ),
                                //Akhir nominal Token Listrik
                                SizedBox(
                                  height: Get.height * 0.45,
                                ),
                                Container(
                                  color: whiteColor,
                                  padding: EdgeInsets.all(16.0),
                                  child: Center(
                                    child: SizedBox(
                                      width: 41.0.h,
                                      height: 6.0.h,
                                      child: ElevatedButton(
                                        onPressed: idpel.text.length >= 7
                                            ? () async {
                                                if (formkey.currentState!.validate()) {
                                                  await plnprabayarController.plnprabayarInquiry(idpel.text, context);
                                                }
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
