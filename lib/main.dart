// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'app/routes/app_pages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

final CountdownController controller = new CountdownController();
void main() async {
  await dotenv.load(fileName: ".env");

  // if (dotenv.env['PROD'] == "true") {
  //   if (Platform.isAndroid) {
  //     await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  //   } // aktifkan jika ingin upload ke playstore dan appstore
  // }

  runApp(
    LayoutBuilder(
      builder: (context, constraints) {
        return Sizer(
          builder: (context, orientation, deviceType) {
            return GetMaterialApp(
              theme: ThemeData(
                textTheme: GoogleFonts.interTextTheme(
                  Theme.of(context).textTheme,
                ),
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              title: "M-PAY",
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
            );
          },
        );
      },
    ),
  );
}
