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

  final List<String> imageUrls = [
    'https://s3-alpha-sig.figma.com/img/956d/c858/ad1bcf49782a1d3a31456175b0a9871a?Expires=1705881600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=YX4SfGQrloWr56xFRzIRtU24Flf-3UxsnwCq2S1vuivldBlzFHeHcVCP8I-Zfub3iyd83UNEWoM1RcKi995gvw25tnC4LK5H4uYIcrkRO4JOI7514eeCPvMxDPgZYwJ~CzvtH~MMt2DwDSUnxC8U0WCvD0hUUaMFY2MxRSntGpcbX6YM0-bmguTxtNm2mcoJqJ9B4~KMXr~hFvrn~RNXY6VbYNmtGdtsmLIzWCR6PsDr41bLahjqALdISHqVT9JYXiykyQw87WiF6BkTfsVMDbcIsQrv3-NvhpK3A5qzn4nHZOLgK0UTvzQ0IjWHW4gj6A4I0NS4iuPBQ~p5M2~Oig__',
    'https://s3-alpha-sig.figma.com/img/7900/fd46/b5267780ec8142a4ad1a450afd67896f?Expires=1705881600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=WTj46DEzfihYaraPIHfdwe9ZPA18rd-nR91nuj8pTzge6YogiqvWPUUUAL3IgnI3gOpmYiZ-a1frzppQFVKbjQb2I4YI9ZBB7ocIfFG34vdwu~-7FTa-rSvpCRQdqYzaO48xKusA6mur~y6J3J4XSBJqmPSZ1ZqGXQpL-faMVbCkirtWbDW~LIbb-dbURysBPzyv9Uccw1kKxNjheKTo1FkK4hEpwAmoUsWirjnccqlbvgNSZwn3MUw3CBkWWwyGAsiOFVuxXe34uRpZVSsMKqsgQuvCGTjfbWoqkeTi2G~4D4zSWOJ15Dib5pKFQECSKkKCLSIZuiXsj1oeKvchNw__',
    'https://s3-alpha-sig.figma.com/img/e09a/894e/54015611568f478d827847ad9dc6d5be?Expires=1705881600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=gfVU89PrUdhlVekQkXXLdNeu0-K7Qlq1PdocELbWQsU32C3FePvztm0aG-mn6e~c4WB0ujGZ0BlYGiopaiglz3pYg6pt3sT29KAZhw9QfyPNkRuL8mG6UY3zo8Z1AeVF4FaHePteXNeawYXHB636cUxB8Gd43JizUIsTeo3TbltEXC-NKWbqAcYlWZr0-xmb-PPZ7Nyg5~MjjdtyrxfavjFzgVKhy4QQAjgDt9hwDJQk7oBXdYtcAiCvdvJELoqm9IoDeLTNplW4F-ClzTRKC7LdKjJBLuBr-zaKYTnoTn9GIy5Ms9LxrXBOX1AwmFIOvokkuQY9HXAnUBwPa8sp5A__',
    'https://s3-alpha-sig.figma.com/img/9a4f/da40/e125654b38adccd6fd64cd36c69091cb?Expires=1705881600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=bdSDSqLbF4u6h-y7PH6SzlR5-jALEiZFAcpUjeOpqVgqKYTNFTMcQPBGsk4j4hfq-giEiXKllWn-yPpm4Qn6-PJeeGLTOk-zsBUdsUBocIeEcHTgdJQXiLGkSIXA3P1YKTzMxoUQLO3HT80lsVEAh0VwYKHgI7KyPG8cNOrMvhnWkaC0P2P99wAUN4txO28iU8bUxor59PtzenGcCtNAoh6tdSCuxGpnmZnm0ykwNj6LF3BwjQn5XMZmx-5qjNcT6OCY1mYJ97KkCT3CByxWhQBn2O-ZwS7iV0wU6fqaDuEnmseFOBzkayBVnkPEbf0sczOXpLWW9iIK-jfh~6ggWg__',
  ];

  final List<String> promoIklan = [
    'https://s3-alpha-sig.figma.com/img/cae7/b385/71a9607fd6150db5904d233336ec07df?Expires=1705881600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=WKk8k2FBW4o3Egj~9zIXWJnT7oZh6TRN5PiEztjZvNoJOsgiTw4f9Rd71wQ0kGElFPSFAp6suWW6ky2wOgUmmGiLosQQGijHkGutE2vc8eBdci66UyXPzzRnI4QZEA4Ga8dcoxN8iuSbXw2-Hzm0CeLun3Ocg96wlyu5ZPf5Cbdfztev3eGWuj39HmUsE3xut4gYCghR72AbzgbdcuHK9Lgn-tKFAz7JivP9~XnOLtIl3LqPon-tXh7Ux5QkwxB5j~eCOMxl59Wt0zvEQZob9Mij2fSXw5VE9unoJC8k0os7gMX8Jk4txuZfi3gS5DviFsVobzkaiaASqggecIHhfw__',
    'https://s3-alpha-sig.figma.com/img/ebb9/0237/7779a33481a2109f8a3c26028cba183b?Expires=1705881600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=RzzyfetXDL0lRwlACUXHx7afDv4q~AZphLDnM3PO5MSvS4j8~7nkmCcM7WA9w1NhC0Ou8klem0O-DtQ4lJ9Dzz9SXbaiqq1AG0t-GGk0cbx0Ip6rxrTobkFVwCmmwOYk8dhjX~uaQnGeshb3xc~lUtVT-S6Kzao8P0h4zA4LLGL3m0dNuo5JYZgtcfoiCK7GMM0I62UE25YUoKW0Ii9Y1Cp3cgKjEIk5hG~feQA2I0GDxINdJmsZh-O6OZj1wLj4HPv0JPQyQ5sxWOCSk8mVpX89GHxisS0OscRAEQPVjhhL~RvULz1K1y2FXBa3lazs1i9fF4hbdhJ5ZsdnVMOtxQ__',
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
                                  items: imageUrls.map((url) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                          width: 250.h,
                                          margin: EdgeInsets.symmetric(
                                              horizontal:
                                                  1.5.h), // jarak antara gambar
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.network(url,
                                                fit: BoxFit.fill),
                                          ),
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
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
                                  items: promoIklan.map((url) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                          width: 400.h,
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 1.5.h,
                                          ), // jarak antara gambar
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.network(url,
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
