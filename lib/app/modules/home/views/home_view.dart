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

  String getInitials(String userNamalengkap) => userNamalengkap.isNotEmpty
      ? userNamalengkap.trim().split(' ').map((l) => l[0]).take(2).join()
      : '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  height: 9.h,
                  color: mainColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
                              width: 60.w,
                              height: 7.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Selamat datang, ${pref.read('nama_lengkap')}',
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
                        Image.asset(
                          'assets/images/Notif.png',
                          height: 5.0.h,
                          width: 5.0.h,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.0.h,
                ),
                Container(
                  width: 87.w,
                  height: 14.h,
                  decoration: BoxDecoration(
                    color: Color(0XFFECF1F6),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: secondColor,
                      width: 2,
                    ),
                  ),
                  child: Obx(
                    () => Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  if (homeController.balance.value == '0' &&
                                      isLoading.value)
                                    SizedBox(
                                      width: 12.0,
                                      height: 12.0,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2.0,
                                      ),
                                    ),
                                  if (!(homeController.balance.value == '0' &&
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
                            width: 2.5.h,
                          ),
                          Container(
                            color: Colors.grey,
                            height: 10.h,
                            width: 1,
                          ),
                          SizedBox(
                            width: 2.5.h,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: FaIcon(
                                  FontAwesomeIcons.cartPlus,
                                  color: whiteColor,
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
                                    borderRadius: BorderRadius.circular(8),
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
                                    width: 1.5.h,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
