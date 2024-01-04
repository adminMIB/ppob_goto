import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:ppob_mpay1/app/data/card.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/data/popup/views/loadingcustom.dart';
import 'package:ppob_mpay1/app/modules/ewallet/ewallet.dart';
import 'package:ppob_mpay1/app/modules/login/views/login_view.dart';
import 'package:ppob_mpay1/app/modules/multifinance/views/multifinance_view.dart';
import 'package:ppob_mpay1/app/modules/paketdata/views/paketdata_view.dart';
import 'package:ppob_mpay1/app/modules/pulsa/views/pulsa_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/bpjs/views/bpjs_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pdam/bindings/pdam_binding.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pdam/controllers/pdam_controller.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pdam/views/pdam_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/pln/views/pln_view.dart';
import 'package:ppob_mpay1/app/modules/tagihan/telco/views/telco_view.dart';
import 'package:ppob_mpay1/app/modules/transferbank/views/transferbank_view.dart';
import 'package:ppob_mpay1/main.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  String? balance;
  HomeView({super.key, this.balance});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final pdamController = Get.put(PdamController());
  final homeController = Get.put(HomeController());

  final isLoading = false.obs;
  PersistentTabController? persistentTabController;
  bool isRefreshing = false;
  var pref = GetStorage();
  @override
  void initState() {
    super.initState();
    homeController.CheckBalance(context);
  }

  void _handleRefresh() {
    homeController.CheckBalance(context);
  }

  Future<void> _refreshBalance() async {
    setState(() {
      isRefreshing = true;
    });
    await homeController.CheckBalance(context);
    setState(() {
      isRefreshing = false;
    });
  }

  Future<void> _showLoadingWithDelay() async {
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        controller.restart();
      },
      child: Countdown(
          controller: controller.start(),
          seconds: 3600,
          interval: const Duration(milliseconds: 100),
          onFinished: () {
            Dialogs.materialDialog(
              color: whiteColor,
              msg: 'Demi kemanan akun anda, silahkan \nLogin kembali',
              msgAlign: TextAlign.center,
              title: 'Sesi anda telah habis',
              msgStyle: TextStyle(
                fontSize: 12.0.sp,
                fontWeight: FontWeight.w400,
              ),
              lottieBuilder: Lottie.asset(
                'assets/json/timeout.json',
                fit: BoxFit.contain,
              ),
              context: context,
              barrierDismissible: false,
              actions: [
                IconsButton(
                  onPressed: () {
                    Get.offAll(LoginView());
                    // Get.back();
                  },
                  text: 'Keluar',
                  color: mainColor,
                  textStyle: const TextStyle(color: Colors.white),
                  iconColor: Colors.white,
                ),
              ],
            );
          },
          build: (BuildContext context, double time) => Scaffold(
                backgroundColor: whiteColor,
                body: Stack(
                  children: [
                    Obx(
                      () => isLoading.value
                          ? LoadingCustomWidget() // Show custom loading widget if isLoading is true
                          : SizedBox.shrink(),
                    ),
                    SafeArea(
                      child: Column(
                        children: [
                          Container(
                            height: Get.height * 0.20,
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(-0.57, -0.82),
                                end: Alignment(0.57, 0.82),
                                colors: [
                                  Color(0xFFD9E7F9),
                                  Color(0xFFE5ECF5),
                                  Color(0xD5AEC5E3),
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                  // borderRadius: BorderRadius.only(
                                  //   bottomLeft: Radius.circular(24.0),
                                  //   bottomRight: Radius.circular(24.0),
                                  // ),
                                  ),
                            ),
                            padding:
                                EdgeInsets.fromLTRB(3.0.w, 1.5.h, 1.5.h, 0.0.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 1.0.h,
                                          height: 5.0.h,
                                        ),
                                        Container(
                                          width: 27.0.h,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Selamat datang',
                                                style: TextStyle(
                                                  fontSize: 12.0.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 0.5.h,
                                              ),
                                              Text(
                                                '${pref.read('nama_lengkap')}'
                                                    .toUpperCase(),
                                                style: TextStyle(
                                                  fontSize: 14.0.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 0.5.h,
                                              ),
                                              Text(
                                                '${pref.read('nomer_tlp')}',
                                                style: TextStyle(
                                                  fontSize: 12.0.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8.h,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              'assets/images/logo1.png',
                                              height: 8.0.h,
                                            ),
                                            SizedBox(
                                              width: 7.5.h,
                                              height: 10.21,
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'M-PAY',
                                                  style: TextStyle(
                                                    color: Color(0xFF124688),
                                                    fontSize: 7.0.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3.0.h,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 1.0.h,
                                      height: 3.0.h,
                                    ),
                                    Obx(
                                      () => Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Saldo Anda',
                                                      style: TextStyle(
                                                        fontSize: 12.0.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2.0.w,
                                                    ),
                                                    Icon(
                                                      Icons.add,
                                                      size: 12.0.sp,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 0.2.h,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Rp. ',
                                                      style: TextStyle(
                                                        fontSize: 12.0.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        if (homeController
                                                                    .balance
                                                                    .value ==
                                                                '0' &&
                                                            isLoading.value)
                                                          SizedBox(
                                                            width: 12.0,
                                                            height: 12.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              strokeWidth: 2.0,
                                                            ),
                                                          ),
                                                        if (!(homeController
                                                                    .balance
                                                                    .value ==
                                                                '0' &&
                                                            isLoading.value))
                                                          Text(
                                                            NumberFormat
                                                                .currency(
                                                              locale: 'id-ID',
                                                              symbol: '',
                                                              decimalDigits: 0,
                                                            ).format(double.parse(
                                                                '${homeController.balance.value}')),
                                                            style: TextStyle(
                                                              fontSize: 12.0.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                    SizedBox(width: 2.0.w),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        setState(() {
                                                          isLoading.value =
                                                              true;
                                                        });
                                                        await Future.delayed(
                                                            Duration(
                                                                seconds: 2));
                                                        await _refreshBalance();
                                                        setState(() {
                                                          isLoading.value =
                                                              false;
                                                        });
                                                      },
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Icon(
                                                          Remix.refresh_line,
                                                          color: blackColor,
                                                          size: 15.0.sp,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: Get.height * 0.2,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3.0.h,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 2.0.h, right: 2.0.h),
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Isi Ulang',
                                  style: TextStyle(
                                    fontSize: 14.0.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.0.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CardMenu(
                                      image: 'assets/images/hptlp.svg',
                                      title: 'pulsa \n Pascabayar ',
                                      onTap: () {
                                        Get.to(PulsaView());
                                      },
                                    ),
                                    SizedBox(
                                      width: 5.0.h,
                                    ),
                                    CardMenu(
                                      image: 'assets/images/wifi.png',
                                      title: 'Paket \n Data',
                                      onTap: () {
                                        Get.to(PaketdataView());
                                        // Get.to(KontakView());
                                        // Get.to(MainWidget());
                                      },
                                    ),
                                    SizedBox(
                                      width: 5.0.h,
                                    ),
                                    CardMenu(
                                      image: 'assets/images/dompet.svg',
                                      title: 'e-Wallet',
                                      onTap: () {
                                        Get.to(EwalletView());
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3.0.h,
                                ),
                                Text(
                                  'Tagihan & Pascabayar',
                                  style: TextStyle(
                                    fontSize: 14.0.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.0.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CardMenu(
                                      image: 'assets/images/lampu.svg',
                                      title: 'PLN',
                                      onTap: () {
                                        Get.to(PlnView());
                                      },
                                    ),
                                    CardMenu(
                                      image: 'assets/images/air.svg',
                                      title: 'PDAM',
                                      onTap: () async {
                                        // isLoading.value = true;
                                        await pdamController.pdam(context);
                                        // isLoading.value = false;
                                      },
                                    ),
                                    CardMenu(
                                      image: 'assets/images/bpjs2.svg',
                                      title: 'BPJS',
                                      onTap: () {
                                        Get.to(BpjsView());
                                      },
                                    ),
                                    CardMenu(
                                      image: 'assets/images/calling.svg',
                                      title: 'TELCO',
                                      onTap: () {
                                        Get.to(TelcoView());
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3.0.h,
                                ),
                                Text(
                                  'Keuangan',
                                  style: TextStyle(
                                    fontSize: 14.0.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.0.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CardMenu(
                                      image: 'assets/images/rp.png',
                                      title: 'Transfer\nBank',
                                      onTap: () {
                                        Get.to(TransferbankView());
                                      },
                                    ),
                                    SizedBox(
                                      width: 5.0.h,
                                    ),
                                    CardMenu(
                                      image: 'assets/images/kalkulator.png',
                                      title: 'Multi\nFinance',
                                      onTap: () {
                                        Get.to(MultifinanceView());
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}
