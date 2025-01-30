import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/main_page.dart';
import 'package:ppob_mpay1/app/modules/goto/controllers/goto_controller.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pln/controllers/pln_controller.dart';
import 'package:sizer/sizer.dart';

class Prabayar2View extends StatefulWidget {
  String? pasca;
  Prabayar2View({
    Key? key,
    this.pasca,
  }) : super(key: key);

  @override
  _Prabayar2ViewState createState() => _Prabayar2ViewState();
}

class _Prabayar2ViewState extends State<Prabayar2View> {
  final formkey = GlobalKey<FormState>();
  int selectedItemIndex = -1;
  TextEditingController idpel = TextEditingController();
  // final plnpascaController = Get.put(PlnController());
  final plnprabayarController = Get.put(PlnController());
  final pln_goto = Get.put(GotoController());

  String? productname1;
  String? productcode1;

  int wilayah = 0;
  bool _isButtonVisible = false;
  // var productname;
  // var productcode;
  @override
  void initState() {
    super.initState();
    plnprabayarController.pln_goto(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        body: Stack(
          children: [
            ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 2.h,
                    right: 2.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'No Meter/ID Pelanggan',
                        style: TextStyle(
                          fontSize: 11.0.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
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
                        height: 1.h,
                      ),
                      Text(
                        'Pilih Nominal Token',
                        style: TextStyle(
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      //List nominal Token Listrik
                      Container(
                        // height: Get.height,
                        child: Obx(
                          () => Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                plnprabayarController.dataPLN.map((element) {
                              return GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    selectedItemIndex = plnprabayarController
                                        .dataPLN
                                        .indexOf(element);
                                    productname1 = element['productName'];
                                    productcode1 = element['id'];
                                  });

                                  controller.restart();
                                  if (idpel.text.isEmpty) {
                                    Flushbar(
                                      message:
                                          'Mohon masukkan nomor terlebih dahulu!',
                                      duration: Duration(seconds: 3),
                                    )..show(context);
                                  } else {
                                    plnprabayarController.dataPLN ==
                                        plnprabayarController.dataPLN;
                                    // print(plnprabayarController.selectedNominal
                                    //     .value = element.nominal);
                                    setState(() {
                                      selectedItemIndex = plnprabayarController
                                          .dataPLN
                                          .indexOf(element);
                                    });
                                  }
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 2.0.h),
                                  padding: EdgeInsets.all(2.0.h),
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    border: selectedItemIndex ==
                                            plnprabayarController.dataPLN
                                                .indexOf(element)
                                        ? Border.all(color: mainColor, width: 2)
                                        : null,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 40.0.w,
                                        // color: Colors.red,
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              element['productName'],
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
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.amber.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          'Pembayaran tagihan listrik tidak dilakukan pada pukul 23.00 - 00.30 WIB sesuai ketentuan PLN',
                          style: TextStyle(
                            fontSize: 11.0.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          color: whiteColor,
                          padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                          child: Center(
                            child: SizedBox(
                              width: Get.width,
                              height: 6.0.h,
                              child: ElevatedButton(
                                onPressed: idpel.text.length >= 7
                                    ? () async {
                                        if (formkey.currentState!.validate()) {
                                          // await plnprabayarController
                                          //     .plnprabayarInquiry(
                                          //         idpel.text, context);
                                          print('hasil code: $productname1');
                                          await pln_goto.inquirygoto(
                                            context,
                                            idpel.text,
                                            productcode1!,
                                            productname1!,
                                          );
                                        }
                                      }
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  primary: idpel.text.length >= 7
                                      ? mainColor
                                      : Colors.grey.shade700,
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
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
