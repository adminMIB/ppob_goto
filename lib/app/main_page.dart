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
          PromoView(),
          RiwayatView(),
          AkunView(),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        backgroundColor: mainColor,
        selectedColor: whiteColor,
        unSelectedColor: whiteColor,
        strokeColor: mainContainer,
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
              'assets/images/home.png',
            ),
            title: Text(
              "Home",
              style: TextStyle(
                color: whiteColor,
                fontSize: 10.0.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          CustomNavigationBarItem(
            icon: Image.asset(
              'assets/images/promo.png',
            ),
            title: Text(
              "Promo",
              style: TextStyle(
                color: whiteColor,
                fontSize: 10.0.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          CustomNavigationBarItem(
            icon: Image.asset(
              'assets/images/history.png',
            ),
            title: Text(
              "Riwayat",
              style: TextStyle(
                color: whiteColor,
                fontSize: 10.0.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          CustomNavigationBarItem(
            icon: Image.asset(
              'assets/images/person.png',
            ),
            title: Text(
              "Profile",
              style: TextStyle(
                color: whiteColor,
                fontSize: 10.0.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
