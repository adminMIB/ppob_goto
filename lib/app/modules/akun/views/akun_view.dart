import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:get_storage/get_storage.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/modules/akun/views/datakerabat_view.dart';
import 'package:ppob_mpay1/app/modules/akun/views/datamerchat_view.dart';
import 'package:ppob_mpay1/app/modules/akun/views/datapersonal_view.dart';
import 'package:ppob_mpay1/app/modules/akun/views/fieldkerabat_view.dart';
import 'package:ppob_mpay1/app/modules/akun/views/fieldmerchant_view.dart';
import 'package:ppob_mpay1/app/modules/akun/views/profile_view.dart';
import 'package:ppob_mpay1/app/modules/akun/views/profilefield_view.dart';
import 'package:ppob_mpay1/app/modules/fingerprint/views/fingerprint_view.dart';
import 'package:ppob_mpay1/app/modules/home/controllers/home_controller.dart';
import 'package:ppob_mpay1/app/modules/login/views/login_view.dart';
import 'package:ppob_mpay1/app/modules/lupapassword/views/lupapassword_view.dart';
import 'package:ppob_mpay1/app/modules/saldo/views/saldo_view.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';
import 'package:ppob_mpay1/main.dart';
import 'package:ppob_mpay1/app/data/popup/views/loadingcustom.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AkunView extends StatefulWidget {
  const AkunView({super.key});

  @override
  State<AkunView> createState() => _AkunViewState();
}

class _AkunViewState extends State<AkunView> {
  bool isSubMenuVisible = false;
  bool isRefreshing = false;
  final isLoading = false.obs;
  var pref = GetStorage();
  String? greeting;
  String? versionApp;

  final homeController = Get.put(HomeController());

  void initState() {
    super.initState();

    initGreeting();
    getPackage();
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

  Future<void> getPackage() async {
    final packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      versionApp = packageInfo.version;
    });
  }

  // String getInitials(String userNamalengkap) => userNamalengkap.isNotEmpty
  //     ? userNamalengkap.trim().split(' ').map((l) => l[0]).take(2).join()
  //     : '';
  String getInitials(String userNamalengkap) => userNamalengkap.isNotEmpty
      ? userNamalengkap
          .trim()
          .split(' ')
          .map((l) => l[0])
          .take(2)
          .join()
          .toUpperCase()
      : '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.restart();
      },
      child: Scaffold(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Selamat ${greeting} ${pref.read('nama_lengkap').substring(0, 1).toUpperCase()}${pref.read('nama_lengkap').substring(1)}',
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
                    height: 2.0.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 2.5.h,
                      // bottom: 2.0.h,
                      left: 2.5.h,
                      // top: 2.0.h,
                    ),
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        color: mainColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  //Saldo
                  Padding(
                    padding: EdgeInsets.only(
                      right: 2.0.h,
                      // bottom: 2.0.h,
                      left: 2.0.h,
                      // top: 2.0.h,
                    ),
                    child: Container(
                      width: 8.5.w,
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                      if (!(homeController.balance.value ==
                                              '0' &&
                                          isLoading.value))
                                        Container(
                                          width: 40.w,
                                          // color: blackColor,
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      Get.to(SaldoView());
                                    },
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
                                        borderRadius: BorderRadius.circular(8),
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
                  ),
                  //Akhir Saldo
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 10.0.h,
                      left: 2.0.h,
                      top: 2.0.h,
                    ),
                    child: Column(
                      children: [
                        _buildListTile(
                            'Informasi Akun', 'assets/images/customer.png', () {
                          setState(() {
                            isSubMenuVisible = !isSubMenuVisible;
                          });
                        }),
                        Visibility(
                          visible: isSubMenuVisible,
                          child: Padding(
                            padding: EdgeInsets.only(left: 7.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  onTap: () {
                                    // Get.to(FieldmerchantView());
                                    Get.to(Datamerchant());
                                  },
                                  contentPadding: EdgeInsets.only(left: 0.0.h),
                                  title: Text(
                                    'Merchant',
                                    style: TextStyle(
                                      color: mainColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: mainColor,
                                  height: 1.0.h,
                                  thickness: 1.0,
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.only(left: 0.0.h),
                                  onTap: () {
                                    // Get.to(ProfilefieldView());
                                    // Get.to(ProfileView());
                                    Get.to(Datapersonal());
                                  },
                                  title: Text(
                                    'Personal',
                                    style: TextStyle(
                                      color: mainColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: mainColor,
                                  height: 1.0.h,
                                  thickness: 1.0,
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.only(left: 0.0.h),
                                  onTap: () {
                                    // Get.to(FieldkerabatView());
                                    Get.to(Datakerabat());
                                  },
                                  title: Text(
                                    'Kerabat',
                                    style: TextStyle(
                                      color: mainColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: mainColor,
                                  height: 1.0.h,
                                  thickness: 1.0,
                                ),
                                SizedBox(
                                  height: 3.5.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                        _buildListTile(
                            'Ubah Kata Sandi', 'assets/images/lock.png', () {
                          Get.to(LupapasswordView());
                        }),
                        _buildListTile(
                            'FingerPrint', 'assets/images/fingerprintn.png',
                            () {
                          Get.to(FingerprintView());
                        }),
                        _buildListTile('MPIN', 'assets/images/pin.png', () {
                          // Get.to(MyApp());
                        }),
                        // _buildListTile('Notifikasi', 'assets/images/bel.png',
                        //     () {
                        //   //
                        // }),
                        ListTile(
                          contentPadding: EdgeInsets.only(left: 0),
                          onTap: () {
                            //
                          },
                          leading: Container(
                            // color: blackColor,
                            width: 4.0.h,
                            height: 4.0.h,
                            child: Image.asset(
                              'assets/images/loncengg.png',
                              // color: mainColor,
                              fit: BoxFit.contain,
                              // width: 4.0.h,
                              // height: 4.0.h,
                            ),
                          ),
                          title: Text(
                            'Notifikasi',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Divider(
                          color: mainColor,
                          height: 1.0.h,
                          thickness: 1.0,
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.only(left: 0),
                          onTap: () {
                            //
                          },
                          leading: Container(
                            // color: blackColor,
                            width: 4.0.h,
                            height: 4.0.h,
                            child: Image.asset(
                              'assets/images/Prize.png',
                              color: fifthColor,
                              fit: BoxFit.cover,
                              // width: 4.0.h,
                              // height: 4.0.h,
                            ),
                          ),
                          title: Text(
                            'Reward',
                            style: TextStyle(
                              color: fifthColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Divider(
                          color: fifthColor,
                          height: 1.0.h,
                          thickness: 1.0,
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.only(left: 0),
                          onTap: () {
                            Dialogs.materialDialog(
                              // customView: Image.asset(
                              //   'assets/images/pt4.png',
                              //   height: 17.0.h,
                              // ),
                              title: 'Ingin keluar',
                              titleStyle: TextStyle(
                                  fontSize: 13.0.sp,
                                  fontWeight: FontWeight.w500),
                              msg: ' Pastikan aktivitas kamu sudah selesai',
                              msgStyle: TextStyle(
                                fontSize: 11.0.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              msgAlign: TextAlign.center,
                              color: whiteColor,
                              context: context,
                              actions: [
                                IconsButton(
                                  onPressed: () async {
                                    Get.offAll(const LoginView());
                                  },
                                  text: 'Ya, Keluar',
                                  color: mainColor,
                                  textStyle: TextStyle(
                                    color: whiteColor,
                                  ),
                                ),
                                IconsButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  text: 'Tidak',
                                  color: whiteColor,
                                  textStyle: TextStyle(
                                    color: mainColor,
                                  ),
                                )
                              ],
                            );
                          },
                          leading: Image.asset(
                            'assets/images/logout.png',
                            color: sixthColor,
                            width: 4.0.h,
                            height: 4.0.h,
                          ),
                          title: Text(
                            'Keluar',
                            style: TextStyle(
                              color: sixthColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Divider(
                          color: sixthColor,
                          height: 1.0.h,
                          thickness: 1.0,
                        ),
                        SizedBox(
                          height: 2.0.h,
                        ),
                        Text(
                          'Versi ${versionApp}',
                          style: TextStyle(
                            color: silverTextColor,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(String title, String imagePath, VoidCallback onTap) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.only(left: 0),
          leading: Container(
            // color: blackColor,
            width: 4.0.h,
            height: 4.0.h,
            child: Image.asset(
              imagePath,
              color: mainColor,
              width: 4.0.h,
              height: 4.0.h,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              color: mainColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          onTap: onTap,
        ),
        Divider(
          color: mainColor,
          height: 1.0.h,
          thickness: 1.0,
        ),
      ],
    );
  }
}
