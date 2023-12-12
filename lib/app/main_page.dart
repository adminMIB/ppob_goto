import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/mainpage_controller.dart';
import 'package:ppob_mpay1/app/modules/akun/views/akun_view.dart';
import 'package:ppob_mpay1/app/modules/home/views/home_view.dart';
import 'package:ppob_mpay1/app/modules/promo/views/promo_view.dart';
import 'package:ppob_mpay1/app/modules/riwayat/views/riwayat_view.dart';
import 'package:sizer/sizer.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:timer_count_down/timer_controller.dart';

final CountdownController controller = CountdownController();

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final mainPageController = Get.put(MainPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: mainPageController.tabIndex,
        children: [
          HomeView(),
          RiwayatView(),
          PromoView(),
          AkunView(),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        backgroundColor: oceanColor,
        opacity: 8,
        iconSize: 3.5.h,
        currentIndex: mainPageController.tabIndex,
        onTap: (index) {
          setState(() {
            mainPageController.tabIndex = index;
          });
        },
        items: [
          CustomNavigationBarItem(
            icon: Image.asset(
              'assets/images/homept1.png',
            ),
            title: Text("Beranda"),
          ),
          CustomNavigationBarItem(
            icon: Image.asset(
              'assets/images/toa.png',
            ),
            title: Text("Promo"),
          ),
          CustomNavigationBarItem(
            icon: Image.asset(
              'assets/images/mutasipt1.png',
            ),
            title: Text("Mutasi"),
          ),
          CustomNavigationBarItem(
            icon: Image.asset(
              'assets/images/akunpt1.png',
            ),
            title: Text("Profile"),
          ),
        ],
      ),
    );
  }
}
