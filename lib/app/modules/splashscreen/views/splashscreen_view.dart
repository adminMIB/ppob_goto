import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:ppob_mpay1/app/modules/login/views/login_view.dart';
// import 'package:ppob_dtq/app/modules/login/views/login_view.dart';

class SplashscreenView extends StatefulWidget {
  const SplashscreenView({Key? key}) : super(key: key);

  @override
  _SplashscreenViewState createState() => _SplashscreenViewState();
}

class _SplashscreenViewState extends State<SplashscreenView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 4), () {
      Get.to(LoginView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Container(
        padding: EdgeInsets.all(2.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Center(
              child: Image.asset(
                'assets/images/mpayfile.png',
                height: 200,
              ),
            ),
            // SizedBox(
            //   height: 5,
            // ),
            // Text(
            //   '"Hempaskan tagihan dalam sekali tekan"',
            //   style: TextStyle(
            //     fontSize: 10,
            //     fontWeight: FontWeight.w800,
            //     color: blackColor,
            //   ),
            // ),
            Container(),
          ],
        ),
      ),
    );
  }
}
