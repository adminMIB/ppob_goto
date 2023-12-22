import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/modules/register/controllers/register_controller.dart';
import 'package:ppob_mpay1/app/modules/register/views/datakerabat.dart';
import 'package:ppob_mpay1/app/modules/register/views/uploadktp_view.dart';
import 'package:sizer/sizer.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class FormPersonalView extends StatefulWidget {
  String? email;
  FormPersonalView({Key? key, this.email}) : super(key: key);

  @override
  _FormPersonalViewState createState() => _FormPersonalViewState();
}

class _FormPersonalViewState extends State<FormPersonalView> {
  final registrasiController = RegisterController();
  final _formKey = GlobalKey<FormState>();
  DateTime now = DateTime.now();
  DateTime? firstDay;
  String? formattedDateStart;
  String? valueDateStart;

  int activeStep = 0;
  int upperBound = 1;
  int dotCount = 2;

  TextEditingController merchant = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController nik = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController ibukandung = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Buat Akun',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
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
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 1.5.h,
              ),
              Image.asset(
                'assets/images/kunci.png',
                height: 12.0.h,
              ),
              SizedBox(
                height: 2.0.h,
              ),
              Text(
                'Pastikan Data yang anda masukan\n Benar! ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.0.sp,
                  color: Color(0xFFAEAEB1),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            2.4.h, 1.0.h, 2.4.h, 2.0.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nama Merchant',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13.5.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            TextFormField(
                              minLines: 1,
                              controller: merchant,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: 'Masukkan Merchant',
                                hintStyle: TextStyle(
                                    fontSize: 12.0.sp,
                                    color: Colors.grey.shade500),
                              ),
                              validator: Validators.compose(
                                [
                                  Validators.required(
                                      'Nama merchant harus di isi'),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 1.0.h,
                            ),
                            Text(
                              'Nama Lengkap',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13.5.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            TextFormField(
                              minLines: 1,
                              controller: name,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: 'Masukkan Nama lengkap',
                                hintStyle: TextStyle(
                                    fontSize: 12.0.sp,
                                    color: Colors.grey.shade500),
                              ),
                              validator: Validators.compose(
                                [
                                  Validators.required(
                                      'Nama Lengkap harus di isi'),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 1.0.h,
                            ),
                            Text(
                              'NIK',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13.5.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            TextFormField(
                              minLines: 1,
                              controller: nik,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: 'Masukkan NIK',
                                hintStyle: TextStyle(
                                    fontSize: 12.0.sp,
                                    color: Colors.grey.shade500),
                              ),
                              validator: Validators.compose(
                                [
                                  Validators.required('NIK harus di isi'),
                                ],
                              ),
                            ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // Text(
                            //   'Tanggal Lahir',
                            //   style: TextStyle(
                            //     color: Colors.grey,
                            //     fontSize: 16,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 5,
                            // ),
                            // TextFormField(
                            //   readOnly: true,
                            //   onTap: () async {
                            //     DateTime? newDateTime =
                            //         await showRoundedDatePicker(
                            //       initialDate: firstDay,
                            //       firstDate: DateTime(1960, 1),
                            //       lastDate: firstDay,
                            //       context: context,
                            //       theme: ThemeData(
                            //         primaryColor: mainColor,
                            //         colorScheme: ColorScheme.fromSwatch()
                            //             .copyWith(secondary: mainColor),
                            //       ),
                            //     );
                            //     if (newDateTime != null) {
                            //       setState(() {
                            //         formattedDateStart =
                            //             DateFormat('dd-MM-yyyy')
                            //                 .format(newDateTime);
                            //         valueDateStart = DateFormat('dd-MM-yyyy')
                            //             .format(newDateTime);
                            //       });
                            //     }
                            //   },
                            //   decoration: InputDecoration(
                            //     hintText: formattedDateStart,
                            //     contentPadding: EdgeInsets.symmetric(
                            //       horizontal: 2.w + 1.2.h,
                            //       vertical: 2.h,
                            //     ),
                            //     filled: true,
                            //     fillColor: Colors.grey.shade200,
                            //     enabledBorder: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(10.0),
                            //       borderSide: BorderSide(color: Colors.grey),
                            //     ),
                            //     focusedBorder: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(10.0),
                            //       borderSide: BorderSide(color: Colors.grey),
                            //     ),
                            //   ),
                            // ),
                            SizedBox(
                              height: 1.0.h,
                            ),
                            Text(
                              'Alamat',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13.5.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            TextFormField(
                              minLines: 3,
                              maxLines: 5,
                              controller: alamat,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: 'Masukkan Alamat',
                                hintStyle: TextStyle(
                                    fontSize: 12.0.sp,
                                    color: Colors.grey.shade500),
                              ),
                              validator: Validators.compose(
                                [
                                  Validators.required('Alamat harus di isi'),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 1.0.h,
                            ),
                            Text(
                              'Email',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13.5.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            TextFormField(
                              readOnly: true,
                              minLines: 1,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: widget.email,
                                hintStyle: TextStyle(
                                    fontSize: 12.0.sp,
                                    color: Colors.grey.shade500),
                              ),
                              // validator: Validators.compose(
                              //   [
                              //     Validators.required('NIK harus di isi'),
                              //   ],
                              // ),
                            ),
                            SizedBox(
                              height: 1.0.h,
                            ),
                            Text(
                              'No Telepon',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13.5.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            TextFormField(
                              minLines: 1,
                              maxLength: 13,
                              controller: phone,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: 'Masukkan No telepon',
                                hintStyle: TextStyle(
                                    fontSize: 12.0.sp,
                                    color: Colors.grey.shade500),
                              ),
                              validator: Validators.compose(
                                [
                                  Validators.required(
                                      'No telepon harus di isi'),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 2.0.h,
                            ),
                            Center(
                              child: SizedBox(
                                width: 44.0.h,
                                height: 6.0.h,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      Get.to(DataKerabattView(
                                        namaMerchant: merchant.text,
                                        nama_lengkap: name.text,
                                        nik: nik.text,
                                        alamat: alamat.text,
                                        nomer_tlp: phone.text,
                                        email: widget.email,
                                      ));
                                      // await pushNewScreen(context,
                                      //     screen: DataKerabattView(
                                      //       namaMerchant: merchant.text,
                                      //       nama_lengkap: name.text,
                                      //       nik: nik.text,
                                      //       alamat: alamat.text,
                                      //       nomer_tlp: phone.text,
                                      //       email: widget.email,
                                      //     ));
                                    }
                                    // Get.to(UploadKTP());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: mainColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  child: Text(
                                    'Lanjut',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFFDF8F8),
                                    ),
                                  ),
                                ),
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
          )
        ],
      ),
    );
  }
}
