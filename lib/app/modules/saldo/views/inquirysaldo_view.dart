import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/data/controller/helpercontroller.dart';
import 'package:ppob_mpay1/app/modules/register/views/formID_view.dart';
import 'package:ppob_mpay1/app/modules/saldo/controllers/saldo_controller.dart';
import 'package:ppob_mpay1/app/modules/saldo/views/paymentsaldo_view.dart';
import 'package:ppob_mpay1/main.dart';
import 'package:sizer/sizer.dart';

class InquirysaldoView extends StatefulWidget {
  String? kode_unik;
  String? text;
  String? amount;
  String? jenis_bank;
  String? metode_pembayaran;
  String? nomer_rekening;
  String? expired;

  String? tanggal;
  String? status;
  InquirysaldoView({
    Key? key,
    this.text,
    this.amount,
    this.jenis_bank,
    this.metode_pembayaran,
    this.nomer_rekening,
    this.expired,
    this.kode_unik,
    this.tanggal,
    this.status,
  }) : super(key: key);

  @override
  State<InquirysaldoView> createState() => _InquirysaldoViewState();
}

class _InquirysaldoViewState extends State<InquirysaldoView> {
  HelperController helperController = HelperController();
  final saldoController = SaldoController();
  int activeStep = 0;
  int upperBound = 1;

  int dotCount = 2;

  XFile? image;
  XFile? image2;

  final ImagePicker picker = ImagePicker();

  // Future getImage(ImageSource gallery) async {
  //   var img = await picker.pickImage(source: gallery);

  //   setState(() {
  //     image = img;
  //   });
  // }

  Future getImage2(ImageSource media) async {
    var img2 = await picker.pickImage(source: media);

    setState(() {
      image2 = img2;
    });
  }

  // Future getImage2(ImageSource gallery) async {
  //   var img2 = await picker.pickImage(source: gallery);

  //   if (img2 != null) {
  //     setState(() {
  //       image2 = img2;
  //     });
  //   } else {
  //     setState(() {
  //       image2 = img2;
  //     });
  //   }
  // }

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        title: Text(
          'Upload bukti transaksi',
          style: TextStyle(
            color: whiteColor,
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
            children: [
              SizedBox(
                height: 1.h,
              ),
              Center(
                child: Container(
                  width: Get.width * 0.90,
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(3.5.h)),
                  child: Padding(
                    padding: EdgeInsets.all(3.h),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tanggal',
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              widget.tanggal!,
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Metode Pembayaran',
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Container(
                              width: Get.width * 0.30,
                              child: Text(
                                widget.metode_pembayaran!,
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Status',
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Container(
                              width: 25.0.w,
                              height: 3.5.h,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFBB64).withOpacity(0.5),
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Color(0xFFFE7A36), // Warna outline
                                  width: 1.0, // Lebar outline
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  widget.status!,
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              // alignment: Alignment.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 4.0.h,
              ),
              Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(3.5.h),
                    topRight: Radius.circular(3.5.h),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 2.h, right: 2.h, top: 2.h),
                  child: Column(
                    children: [
                      if (widget.jenis_bank != null)
                        SvgPicture.asset(
                          widget.jenis_bank == 'BCA'
                              ? 'assets/images/bca.svg'
                              : (widget.jenis_bank == 'MANDIRI')
                                  ? 'assets/images/bankmandiri.svg'
                                  : (widget.jenis_bank == 'BNI')
                                      ? 'assets/images/bni.svg'
                                      : (widget.jenis_bank == 'BRI')
                                          ? 'assets/images/bri.svg'
                                          : 'assets/images/mandiri.svg',
                          height: 3.5.h,
                        ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nomer Rekening',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  widget.nomer_rekening!,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                GestureDetector(
                                  onTap: () {
                                    FlutterClipboard.copy(
                                            widget.nomer_rekening!.toString())
                                        .then((value) => Flushbar(
                                              margin: const EdgeInsets.all(8),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              duration:
                                                  const Duration(seconds: 4),
                                              flushbarPosition:
                                                  FlushbarPosition.TOP,
                                              backgroundColor: Colors.white,
                                              message:
                                                  'Nomer Rekening berhasil di salin ke clipboard Anda',
                                              messageColor: blackColor,
                                            )..show(context));
                                  },
                                  child: Icon(
                                    Icons.copy_rounded,
                                    color: Colors.black,
                                    size: 14.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Divider(
                        color: Colors.grey,
                        // indent: 2.h,
                        // endIndent: 2.h,
                        thickness: 0.5,
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Jumlah Pembayaran',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                              NumberFormat.currency(
                                      locale: 'id-ID',
                                      symbol: 'Rp. ',
                                      decimalDigits: 0)
                                  .format(int.parse(widget.amount!)),
                              style: TextStyle(
                                  fontSize: 16.0.sp,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Divider(
                        color: Colors.grey,
                        // indent: 2.h,
                        // endIndent: 2.h,
                        thickness: 0.5,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        widget.expired!,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 1.8.h,
                          ),
                          SizedBox(
                            width: 3.0.w,
                          ),
                          SizedBox(
                            width: Get.width * 0.80,
                            child: Text(
                              'Mohon transfer sebelum masa expired habis',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 1.8.h,
                          ),
                          SizedBox(
                            width: 3.0.w,
                          ),
                          SizedBox(
                            width: Get.width * 0.80,
                            child: Text(
                              'Tiket anda nominal ' +
                                  NumberFormat.currency(
                                          locale: 'id-ID',
                                          symbol: 'Rp. ',
                                          decimalDigits: 0)
                                      .format(int.parse(widget.amount!)) +
                                  ' masih aktif dengan nomer tiket=' +
                                  widget.kode_unik!,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 1.8.h,
                          ),
                          SizedBox(
                            width: 3.0.w,
                          ),
                          SizedBox(
                            width: Get.width * 0.80,
                            child: Text(
                              'Silahkan transfer dengan nominal tersebut ke ' +
                                  widget.jenis_bank!,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Divider(
                        color: Colors.grey,
                        // indent: 2.h,
                        // endIndent: 2.h,
                        thickness: 0.5,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Visibility(
                              visible: activeStep == 0 ? true : false,
                              child: Container(
                                child: image2 != null
                                    ? Column(
                                        children: [
                                          Column(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.file(
                                                  File(image2!.path),
                                                  fit: BoxFit.cover,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: Get.height * 0.90,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '*.',
                                                    style: TextStyle(
                                                      color: greyTextColor,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 2.0.w,
                                                  ),
                                                  SizedBox(
                                                    width: Get.width * 0.75,
                                                    child: Text(
                                                      'Pastikan bukti transaksi jelas dan tidak ada yang terpotong atau buram',
                                                      style: TextStyle(
                                                        color: greyTextColor,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 1.0.h,
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                    : Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(3.5.h),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Upload Bukti Transfer',
                                                  style: TextStyle(
                                                    fontSize: 13.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                                SizedBox(
                                                  height: 2.0.h,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: whiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3.h),
                                                    border: Border.all(
                                                      color: Colors.black,
                                                      width: 1,
                                                      style: BorderStyle.solid,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(2.h),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              '1.',
                                                              style: TextStyle(
                                                                fontSize: 11.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 2.0.w,
                                                            ),
                                                            SizedBox(
                                                              width: Get.width *
                                                                  0.75,
                                                              child: Text(
                                                                'Silakan unggah bukti transfer Anda di sini.',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      11.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 1.5.h,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              '2.',
                                                              style: TextStyle(
                                                                fontSize: 11.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 2.0.w,
                                                            ),
                                                            SizedBox(
                                                              width: Get.width *
                                                                  0.72,
                                                              child: Text(
                                                                'Bukti transfer hanya berupa gambar',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      11.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 1.5.h,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              '3.',
                                                              style: TextStyle(
                                                                fontSize: 11.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 2.0.w,
                                                            ),
                                                            SizedBox(
                                                              width: Get.width *
                                                                  0.70,
                                                              child: Text(
                                                                'Klik di button Upload Foto untuk mengunggah bukti transfer.',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      11.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 1.5.h,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              '4.',
                                                              style: TextStyle(
                                                                fontSize: 11.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 2.0.w,
                                                            ),
                                                            SizedBox(
                                                              width: Get.width *
                                                                  0.70,
                                                              child: Text(
                                                                'Mohon unggah bukti transfer untuk verifikasi pembayaran',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      11.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 1.5.h,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              '5.',
                                                              style: TextStyle(
                                                                fontSize: 11.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 2.0.w,
                                                            ),
                                                            SizedBox(
                                                              width: Get.width *
                                                                  0.70,
                                                              child: Text(
                                                                'Unggah bukti transfer Anda agar pesanan dapat diproses.',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      11.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 4.0.h,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            controller
                                                                .restart();
                                                            getImage2(
                                                                ImageSource
                                                                    .gallery);
                                                            widget.kode_unik;
                                                          },
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .camera_alt_outlined,
                                                                size: 15.h,
                                                              ),
                                                              Text(
                                                                'Upload bukti Transfer',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color:
                                                                      mainColor,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 4.0.h,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            image2 != null
                                ? Container(
                                    padding: EdgeInsets.only(
                                      left: 3.0.h,
                                      right: 3.0.h,
                                      bottom: 5.0.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        previousButton(),
                                        nextButton(),
                                      ],
                                    ),
                                  )
                                : Container(
                                    padding: EdgeInsets.only(
                                      left: 3.0.h,
                                      right: 3.0.h,
                                      bottom: 5.0.h,
                                    ),
                                    child: const Text(''),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget nextButton() {
    return SizedBox(
      height: Get.height * 0.05,
      width: Get.width * 0.35,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () async {
          controller.restart();
          if (_formKey.currentState!.validate()) {
            await saldoController.Uploadbukti(
              image2,
              widget.kode_unik,
              context,
            );
          }
        },
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Kirim ",
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 11.0.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              WidgetSpan(
                child: Icon(
                  Icons.check,
                  size: 16,
                  color: whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget previousButton() {
    return SizedBox(
      height: Get.height * 0.05,
      width: Get.width * 0.35,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: greyColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () async {
          controller.restart();
          getImage2(ImageSource.gallery);
        },
        child: Text(
          "Upload Ulang",
          style: TextStyle(
            color: const Color(0xffffffff),
            fontSize: 11.0.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
