import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/data/popup/views/loadingcustom.dart';
import 'package:ppob_mpay1/app/modules/riwayat/controllers/riwayat_controller.dart';
import 'package:ppob_mpay1/app/modules/riwayat/views/riwayat_berhasil_view.dart';
import 'package:ppob_mpay1/app/modules/riwayat/views/riwayat_gagal_view.dart';
import 'package:sizer/sizer.dart';

class RiwayatView extends StatefulWidget {
  const RiwayatView({super.key});

  @override
  State<RiwayatView> createState() => _RiwayatViewState();
}

class _RiwayatViewState extends State<RiwayatView> {
  final riwayatController = Get.put(RiwayatController());

  final isLoading = false.obs;
  var pref = GetStorage();

  String? greeting;
  void initState() {
    super.initState();

    initGreeting();
    riwayatController.ListRiwayatBerhasil(context);
    riwayatController.ListRiwayatGagal(context);
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

  String getInitials(String userNamalengkap) => userNamalengkap.isNotEmpty
      ? userNamalengkap.trim().split(' ').map((l) => l[0]).take(2).join()
      : '';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Sesuaikan dengan jumlah tab Anda
      child: Scaffold(
        backgroundColor: whiteColor,
        body: SafeArea(
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Header
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
                                width: 60.w,
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
                          Image.asset(
                            'assets/images/Notif.png',
                            height: 5.0.h,
                            width: 5.0.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Akhir Header
                  SizedBox(
                    height: 2.0.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.0.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Riwayat Transaksi',
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 2.0.h,
                        ),
                        //Tab Bar
                        TabBar(
                          unselectedLabelColor: greyColor,
                          labelColor: mainColor,
                          indicatorColor: mainColor,
                          indicatorSize: TabBarIndicatorSize.tab,
                          tabs: [
                            Tab(
                              text: 'Berhasil',
                            ),
                            Tab(
                              text: 'Gagal',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.5.h,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: TabBarView(
                            children: [
                              RiwayatBerhasilView(),
                              RiwayatGagalView(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
