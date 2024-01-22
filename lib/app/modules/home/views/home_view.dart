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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeView extends StatefulWidget {
  String? balance;
  HomeView({super.key, this.balance});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final pdamController = Get.put(PdamController());
  final homeController = Get.put(HomeController());
  String? greeting;

  final isLoading = false.obs;
  PersistentTabController? persistentTabController;
  bool isRefreshing = false;
  var pref = GetStorage();
  @override
  void initState() {
    super.initState();
    homeController.CheckBalance(context);
    initGreeting();
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

  String getInitials(String userNamalengkap) => userNamalengkap.isNotEmpty
      ? userNamalengkap.trim().split(' ').map((l) => l[0]).take(2).join()
      : '';

  void initGreeting() async {
    int time = DateTime.now().hour;
    if (time >= 0 && time <= 10) {
      greeting = 'Pagi,';
    } else if (time >= 10 && time <= 15) {
      greeting = 'Siang,';
    } else if (time >= 14 && time <= 18) {
      greeting = 'Sore,';
    } else {
      greeting = 'Malam,';
    }

    print('time : $time');
    print('Selamat $greeting');
  }

  final List<String> promo = [
    'assets/images/promov1.png',
    'assets/images/promov2.png',
    'assets/images/promov3.png',
  ];

  final List<String> promoIklan = [
    'assets/images/iklan1.png',
    'assets/images/iklan2.png',
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 9.h,
                          color: mainColor,
                          child: Padding(
                            padding: EdgeInsets.all(2.0.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: greyishColor,
                                      child: Text(
                                        getInitials(
                                          pref.read('nama_lengkap'),
                                        ).toUpperCase(),
                                        style: TextStyle(
                                          color: secondColor,
                                          fontSize: 15.0.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2.0.h,
                                    ),
                                    Container(
                                      // color: blackColor,
                                      width: 63.w,
                                      height: 7.h,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'Selamat ${greeting} ${pref.read('nama_lengkap')}',
                                                style: TextStyle(
                                                  color: whiteColor,
                                                  fontSize: 11.0.sp,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 0.5.h,
                                          ),
                                          Text(
                                            '${pref.read('nomer_tlp')}',
                                            style: TextStyle(
                                              color: whiteColor,
                                              fontSize: 8.0.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  // color: blackColor,
                                  child: Image.asset(
                                    'assets/images/Notif.png',
                                    height: 3.0.h,
                                    width: 3.0.h,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3.0.h,
                        ),
                        //Saldo
                        Container(
                          width: 89.5.w,
                          height: 14.h,
                          decoration: BoxDecoration(
                            color: mainContainer,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: mainColor,
                              width: 2,
                            ),
                          ),
                          child: Obx(
                            () => Padding(
                              padding: EdgeInsets.all(2.0.h),
                              child: Row(
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
                                                      '${homeController.balance.value}')),
                                              style: TextStyle(
                                                color: mainColor,
                                                fontSize: 18.0.sp,
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
                                          ),
                                          SizedBox(
                                            width: 0.5.h,
                                          ),
                                          Text(
                                            'Saldo',
                                            style: TextStyle(
                                              color: greyColor,
                                              fontSize: 9.0.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 1.0.h,
                                          ),
                                          Container(
                                            color: Colors.grey,
                                            height: 3.h,
                                            width: 1,
                                          ),
                                          SizedBox(
                                            width: 1.0.h,
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
                                                  size: 10.0.sp,
                                                ),
                                                SizedBox(
                                                  width: 0.5.h,
                                                ),
                                                Text(
                                                  'Refresh',
                                                  style: TextStyle(
                                                    color: greyColor,
                                                    fontSize: 9.0.sp,
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
                                  SizedBox(
                                    width: 1.5.h,
                                  ),
                                  Container(
                                    color: Colors.grey,
                                    height: 10.h,
                                    width: 1,
                                  ),
                                  SizedBox(
                                    width: 1.5.h,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ElevatedButton.icon(
                                        onPressed: () {},
                                        icon: FaIcon(
                                          FontAwesomeIcons.cartPlus,
                                          color: whiteColor,
                                          size: 2.0.h,
                                        ),
                                        label: Text(
                                          'Top Up Saldo',
                                          style: TextStyle(
                                            color: whiteColor,
                                            fontSize: 8.0.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: mainColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          minimumSize: Size(
                                            8.w, //panjang
                                            4.h, //tinggi
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/Prize.png',
                                            height: 3.0.h,
                                            width: 3.0.h,
                                          ),
                                          // SizedBox(
                                          //   width: 0.5.h,
                                          // ),
                                          Text(
                                            'Reward',
                                            style: TextStyle(
                                              color: thirdColor,
                                              fontSize: 8.0.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 1.0.h,
                                          ),
                                          Text(
                                            '10.250,-',
                                            style: TextStyle(
                                              color: thirdColor,
                                              fontSize: 12.0.sp,
                                              fontWeight: FontWeight.w700,
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
                        ),
                        //Akhir Saldo
                        SizedBox(
                          height: 3.0.h,
                        ),
                        //Menu Isi Ulang
                        Container(
                          width: 90.w,
                          // height: 19.5.h,
                          decoration: BoxDecoration(
                            color: secondContainer,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: borderColor,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(2.0.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Isi Ulang',
                                  style: TextStyle(
                                    color: thirdColor,
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: 2.0.h,
                                ),
                                Row(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  // mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CardMenu(
                                      image: 'assets/images/pulsa.png',
                                      title: 'Pulsa Prabayar',
                                      onTap: () {
                                        Get.to(PulsaView());
                                      },
                                    ),
                                    SizedBox(
                                      width: 2.0.h,
                                    ),
                                    CardMenu(
                                      image: 'assets/images/paketdata.png',
                                      title: 'Paket Data',
                                      onTap: () async {
                                        Get.to(PaketdataView());
                                      },
                                    ),
                                    SizedBox(
                                      width: 2.0.h,
                                    ),
                                    CardMenu(
                                      image: 'assets/images/ewalet.png',
                                      title: 'Top Up Ewallet',
                                      onTap: () {
                                        Get.to(EwalletView());
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        //Akhir Menu Isi Ulang
                        SizedBox(
                          height: 3.0.h,
                        ),
                        //Menu Tagihan & Pascabayar
                        Container(
                          width: 90.w,
                          // height: 19.0.h,
                          decoration: BoxDecoration(
                            color: secondContainer,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: borderColor,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(2.0.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tagihan & Pascabayar',
                                  style: TextStyle(
                                    color: thirdColor,
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: 2.0.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CardMenu(
                                      image: 'assets/images/listrik.png',
                                      title: 'Listrik PLN',
                                      onTap: () {
                                        Get.to(PlnView());
                                      },
                                    ),
                                    SizedBox(
                                      width: 2.0.h,
                                    ),
                                    CardMenu(
                                      image: 'assets/images/pdam.png',
                                      title: 'PDAM',
                                      onTap: () async {
                                        // isLoading.value = true;
                                        await pdamController.pdam(context);
                                        // isLoading.value = false;
                                      },
                                    ),
                                    SizedBox(
                                      width: 2.0.h,
                                    ),
                                    CardMenu(
                                      image: 'assets/images/sehat.png',
                                      title: 'BPJS',
                                      onTap: () {
                                        Get.to(BpjsView());
                                      },
                                    ),
                                    SizedBox(
                                      width: 2.0.h,
                                    ),
                                    CardMenu(
                                      image: 'assets/images/tv.png',
                                      title: 'TV Kabel Internet',
                                      onTap: () {
                                        Get.to(TelcoView());
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        //Akhir Menu Tagihan & Pascabayar
                        SizedBox(
                          height: 3.0.h,
                        ),
                        //Menu Keuangan
                        Container(
                          width: 90.w,
                          // height: 19.0.h,
                          decoration: BoxDecoration(
                            color: secondContainer,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: borderColor,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(2.0.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Keuangan',
                                  style: TextStyle(
                                    color: thirdColor,
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: 2.0.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CardMenu(
                                      image: 'assets/images/transferbank.png',
                                      title: 'Transfer Bank',
                                      onTap: () {
                                        Get.to(TransferbankView());
                                      },
                                    ),
                                    SizedBox(
                                      width: 2.0.h,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(MultifinanceView());
                                      },
                                      child: Container(
                                        width: 10.5.h,
                                        height: 11.0.h,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                width: 5.0.h,
                                                height: 5.0.h,
                                                child: ClipRect(
                                                  child: Image.asset(
                                                    'assets/images/multifinance.png',
                                                    width: 4.0.h,
                                                    height: 4.0.h,
                                                    // Contoh penggunaan fit:
                                                    // fit: BoxFit.contain, // Atau sesuaikan dengan kebutuhan tata letak
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 1.0.h),
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                'Multifinance',
                                                style: TextStyle(
                                                  color: mainColor,
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        //Akhir Menu Keuangan
                        SizedBox(
                          height: 3.0.h,
                        ),
                        //Menu Promo
                        Container(
                          width: Get.width,
                          // width: 90.w,
                          // height: 19.0.h,
                          decoration: BoxDecoration(
                            color: secondContainer,
                            border: Border.all(
                              color: borderColor,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.5.h),
                                  child: Text(
                                    'Promo',
                                    style: TextStyle(
                                      color: thirdColor,
                                      fontSize: 12.0.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.0.h,
                                ),
                                //promo kotak
                                CarouselSlider(
                                  options: CarouselOptions(
                                    reverse: true,
                                    height: 20.h,
                                    autoPlay: false,
                                    viewportFraction: 0.5,
                                    aspectRatio: 0.5,
                                    pageSnapping: true,
                                    onPageChanged: (index, _) {},
                                  ),
                                  items: promo.map((assetPath) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                          width: 250.h,
                                          decoration: BoxDecoration(
                                            color: mainColor,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 1.5.h),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.asset(assetPath,
                                                fit: BoxFit.fill),
                                          ),
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                                //Akhir promo kotak
                                SizedBox(
                                  height: 2.0.h,
                                ),
                                //promo Iklan
                                CarouselSlider(
                                  options: CarouselOptions(
                                    reverse: true,
                                    height: 25.h,
                                    autoPlay: false,
                                    viewportFraction: 0.8,
                                    aspectRatio: 0.5,
                                    pageSnapping: true,
                                    onPageChanged: (index, _) {},
                                  ),
                                  items: promoIklan.map((assetPath) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                          width: 250.h,
                                          decoration: BoxDecoration(
                                            color: mainColor,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 1.5.h),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.asset(assetPath,
                                                fit: BoxFit.fill),
                                          ),
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //Akhir Menu Promo
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
