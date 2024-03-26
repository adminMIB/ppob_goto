// ignore_for_file: prefer_const_constructors

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/modules/tagihan/bpjs/controllers/bpjs_controller.dart';
import 'package:ppob_mpay1/main.dart';
import 'package:sizer/sizer.dart';

class KesehatanView extends StatefulWidget {
  const KesehatanView({Key? key}) : super(key: key);

  @override
  _KesehatanViewState createState() => _KesehatanViewState();
}

class _KesehatanViewState extends State<KesehatanView> {
  int selectedItemIndex = -1; // -1 berarti tidak ada yang dipilih
  final formkey = GlobalKey<FormState>();
  int wilayah = 0;
  TextEditingController idpel = TextEditingController();

  final bpjsController = Get.put(BpjsController());
  final helperController = Get.put(HelperController());

  var bayarHinggaValue;

  int lengthNoTelepon = 0;

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
          // backgroundColor: whiteColor,
          body: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 2.h, right: 2.h, top: 1.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/kesehatan.png',
                        height: 2.5.h,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Divider(
                      color: Colors.black38,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'No Meter/ID Pelanggan',
                      style: TextStyle(
                        fontSize: 11.0.sp,
                        fontWeight: FontWeight.w500,
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
                        maxLength: 20,
                        controller: idpel,
                        onChanged: (a) {
                          setState(() {
                            wilayah = a.length;
                            // _isButtonVisible = a.isNotEmpty;
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
                      'Bayar Hingga',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Obx(() => DropdownButtonFormField2(
                          isExpanded: true,
                          decoration: InputDecoration(
                            fillColor: Colors.transparent,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            // Add more decoration..
                          ),
                          hint: const Text(
                            '-- Bayar Hingga Bulan --',
                            style: TextStyle(fontSize: 14),
                          ),
                          items: bpjsController.months.map((value) {
                            return DropdownMenuItem(
                              child: Text(
                                value['name'],
                              ),
                              value: value['value'],
                            );
                          }).toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Select Bank';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              print('Jumlah Bulan: $value');
                              print(value);
                            });
                            bayarHinggaValue = value;
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
                        )),
                    // SizedBox(
                    //   height: 2.h,
                    // ),
                    // Container(
                    //   padding: EdgeInsets.all(16.0),
                    //   decoration: BoxDecoration(
                    //     color: Colors.amber.withOpacity(0.4),
                    //     borderRadius: BorderRadius.circular(5),
                    //   ),
                    //   child: Text(
                    //     'Pembayaran tagihan listrik tidak dilakukan pada pukul 23.00 - 00.30 WIB sesuai ketentuan PLN',
                    //     style: TextStyle(
                    //       fontSize: 11.0.sp,
                    //       fontWeight: FontWeight.w400,
                    //     ),
                    //     textAlign: TextAlign.justify,
                    //   ),
                    // ),
                    SizedBox(
                      height: Get.height * 0.30,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.all(16.0),
                        child: Center(
                          child: SizedBox(
                            width: 41.0.h,
                            height: 6.0.h,
                            child: ElevatedButton(
                              onPressed: idpel.text.length >= 7
                                  // idpel.text.length >= 7
                                  ? () async {
                                      if (formkey.currentState!.validate()) {
                                        await bpjsController.bpjskesehatan(
                                            idpel.text,
                                            bayarHinggaValue,
                                            context);
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
      )
          // Stack(
          //   children: [
          //     SafeArea(
          //         child: SingleChildScrollView(
          //       child: Column(
          //         children: [
          //           AppBar(
          //             elevation: 0,
          //             backgroundColor: Colors.transparent,
          //             leading: IconButton(
          //               icon: Icon(
          //                 Icons.arrow_back_ios,
          //                 color: Colors.black,
          //               ),
          //               onPressed: () {
          //                 Get.back();
          //               },
          //             ),
          //           ),
          //           Stack(
          //             children: [
          //               Column(
          //                 children: [
          //                   Center(
          //                     child: Image.asset(
          //                       'assets/images/kesehatan.png',
          //                       height: 1.8.h,
          //                     ),
          //                   ),
          //                   SizedBox(height: 1.5.h),
          //                   Text(
          //                     'BPJS Kesehatan',
          //                     style: TextStyle(
          //                         color: Colors.black,
          //                         fontSize: 14.0.sp,
          //                         fontWeight: FontWeight.w600),
          //                   ),
          //                   SizedBox(
          //                     height: 1.0.h,
          //                   ),
          //                   Divider(
          //                     color: Colors.grey.shade500,
          //                     indent: 2.0.h,
          //                     endIndent: 2.0.h,
          //                   ),
          //                   SizedBox(
          //                     height: 2.h,
          //                   ),
          //                 ],
          //               ),
          //             ],
          //           ),
          //           Padding(
          //             padding: EdgeInsets.only(left: 2.0.h, right: 2.0.h),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text(
          //                   'No. VA Keluarga',
          //                   style: TextStyle(
          //                     fontSize: 11.0.sp,
          //                     fontWeight: FontWeight.w400,
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   height: 1.h,
          //                 ),
          //                 Form(
          //                   key: formkey,
          //                   autovalidateMode: AutovalidateMode.onUserInteraction,
          //                   child: TextFormField(
          //                     minLines: 1,
          //                     maxLength: 20,
          //                     controller: idpel,
          //                     onChanged: (a) {
          //                       setState(() {
          //                         wilayah = a.length;
          //                       });
          //                     },
          //                     decoration: InputDecoration(
          //                       border: OutlineInputBorder(
          //                         borderSide: BorderSide(color: Colors.grey),
          //                         borderRadius: BorderRadius.circular(10.0),
          //                       ),
          //                       hintText: 'Masukkan Kode ',
          //                       hintStyle: TextStyle(
          //                         fontSize: 12.0.sp,
          //                         color: Colors.grey.shade500,
          //                       ),
          //                     ),
          //                     validator: (value) {
          //                       if (wilayah < 7) {
          //                         return 'ID pelanggan minimal 7 angka dan maximal 10 angka';
          //                       }
          //                       return null;
          //                     },
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   height: 0.5.h,
          //                 ),
          //                 Text(
          //                   'Bayar Hingga',
          //                   style: TextStyle(
          //                     fontSize: 11.0.sp,
          //                     fontWeight: FontWeight.w400,
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   height: 1.h,
          //                 ),
          //                 Obx(() => DropdownButtonFormField2(
          //                       isExpanded: true,
          //                       decoration: InputDecoration(
          //                         fillColor: whiteColor,
          //                         filled: true,
          //                         border: OutlineInputBorder(
          //                           borderRadius: BorderRadius.circular(10),
          //                           borderSide: BorderSide(color: Colors.grey),
          //                         ),
          //                         // Add more decoration..
          //                       ),
          //                       hint: const Text(
          //                         'Bayar Hingga',
          //                         style: TextStyle(fontSize: 14),
          //                       ),
          //                       items: bpjsController.months.map((value) {
          //                         return DropdownMenuItem(
          //                           child: Text(
          //                             value['name'],
          //                           ),
          //                           value: value['value'],
          //                         );
          //                       }).toList(),
          //                       validator: (value) {
          //                         if (value == null) {
          //                           return 'Select Bank';
          //                         }
          //                         return null;
          //                       },
          //                       onChanged: (value) {
          //                         setState(() {
          //                           print('Jumlah Bulan: $value');
          //                           print(value);
          //                         });
          //                         bayarHinggaValue = value;
          //                       },
          //                       buttonStyleData: const ButtonStyleData(
          //                         padding: EdgeInsets.only(right: 8),
          //                       ),
          //                       iconStyleData: const IconStyleData(
          //                         icon: Icon(
          //                           Icons.arrow_drop_down,
          //                           color: Colors.black45,
          //                         ),
          //                         iconSize: 24,
          //                       ),
          //                       dropdownStyleData: DropdownStyleData(
          //                         decoration: BoxDecoration(
          //                           borderRadius: BorderRadius.circular(15),
          //                         ),
          //                       ),
          //                       menuItemStyleData: const MenuItemStyleData(
          //                         padding: EdgeInsets.symmetric(horizontal: 16),
          //                       ),
          //                     )),
          //                 SizedBox(
          //                   height: Get.height * 0.35,
          //                 ),
          //                 Align(
          //                   alignment: Alignment.bottomCenter,
          //                   child: Container(
          //                       color: whiteColor,
          //                       padding: EdgeInsets.all(16.0),
          //                       child: Center(
          //                           child: SizedBox(
          //                         width: 41.0.h,
          //                         height: 6.0.h,
          //                         child: ElevatedButton(
          //                           onPressed: () async {
          //                             // print('masuk');
          //                             await bpjsController.bpjskesehatan(
          //                                 idpel.text, bayarHinggaValue, context);
          //                           },
          //                           style: ElevatedButton.styleFrom(
          //                             primary: mainColor,
          //                             shape: RoundedRectangleBorder(
          //                               borderRadius: BorderRadius.circular(10.0),
          //                             ),
          //                           ),
          //                           child: Text(
          //                             'Lanjutkan',
          //                             style: TextStyle(
          //                               fontSize: 14.0.sp,
          //                               fontWeight: FontWeight.bold,
          //                               color: Color(0xFFFDF8F8),
          //                             ),
          //                           ),
          //                         ),
          //                       ))),
          //                 )
          //               ],
          //             ),
          //           )
          //         ],
          //       ),
          //     ))
          //   ],
          // ),
          ),
    );
  }
}
