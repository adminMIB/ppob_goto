import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/data/popup/views/loadingcustom.dart';
import 'package:ppob_mpay1/app/modules/riwayat/controllers/riwayat_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

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

  String formatCreatedAt(String createdAt) {
    DateTime parsedDate = DateTime.parse(createdAt);
    String formattedDate =
        DateFormat('dd MMMM yyyy, HH:mm:ss', 'id_ID').format(parsedDate);

    return formattedDate + ' WIB';
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: whiteColor,
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  expandedHeight: 9.h,
                  floating: false,
                  pinned: false,
                  backgroundColor: mainColor,
                  flexibleSpace: FlexibleSpaceBar(
                    background: //Header
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
                              ],
                            ),
                            // SizedBox(
                            //   width: 2.0.h,
                            // ),
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
                  ),
                ),
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      unselectedLabelColor: greyColor,
                      labelColor: mainColor,
                      indicatorColor: mainColor,
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: [
                        Tab(text: 'Berhasil'),
                        Tab(text: 'Gagal'),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: [
                // Riwayat Berhasil
                RiwayatBerhasilView(context), // Riwayat Gagal
                RiwayatGagalView(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget RiwayatBerhasilView(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: riwayatController.riwayatBerhasil.map((history) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: 2.0.h,
                    right: 1.5.h,
                    left: 1.5.h,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: mainContainer,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: mainColor,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(2.0.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 42.0.w,
                                // color: blackColor,
                                child: Text(
                                  history['product_name'],
                                  style: TextStyle(
                                    color: mainColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 1.0.h,
                              ),
                              Container(
                                width: 34.5.w,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    'Rp. ' +
                                        NumberFormat.currency(
                                          locale: 'id-ID',
                                          symbol: '',
                                          decimalDigits: 0,
                                        ).format(double.parse(
                                            '${history['amount']}')),
                                    style: TextStyle(
                                      color: fourthColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            'No Reff : ${history['ref2']}',
                            style: TextStyle(
                              color: slateTextColor,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            formatCreatedAt(history['created_at']),
                            style: TextStyle(
                              color: slateTextColor,
                              fontSize: 7.5.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Container(
                            width: 73.0.w,
                            // color: greyColor,
                            child: Text(
                              history['description'],
                              style: TextStyle(
                                color: CharcoalTextColor,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget RiwayatGagalView(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: riwayatController.riwayatGagal.map((history) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: 2.0.h,
                    right: 1.5.h,
                    left: 1.5.h,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: mainContainer,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: mainColor,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(2.0.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 42.0.w,
                                // color: blackColor,
                                child: Text(
                                  history['product_name'],
                                  style: TextStyle(
                                    color: mainColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 1.0.h,
                              ),
                              Container(
                                width: 34.5.w,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    'Rp. ' +
                                        NumberFormat.currency(
                                          locale: 'id-ID',
                                          symbol: '',
                                          decimalDigits: 0,
                                        ).format(double.parse(
                                            '${history['amount']}')),
                                    style: TextStyle(
                                      color: thirdColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            'No Reff : ${history['ref2']}',
                            style: TextStyle(
                              color: slateTextColor,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(
                            formatCreatedAt(history['created_at']),
                            style: TextStyle(
                              color: slateTextColor,
                              fontSize: 7.5.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Container(
                            width: 73.0.w,
                            // color: greyColor,
                            child: Text(
                              history['description'],
                              style: TextStyle(
                                color: CharcoalTextColor,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverAppBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height + 8.5.h;

  @override
  double get maxExtent => tabBar.preferredSize.height + 8.5.h;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: whiteColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 2.0.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 2.0.h),
              child: Text(
                'Riwayat Transaksi',
                style: TextStyle(
                  color: mainColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 1.0.h,
            ),
            tabBar,
          ],
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
