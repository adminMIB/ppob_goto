import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../data/colors.dart';
import '../../../home/views/home_view.dart';

class PopupGOTO extends StatefulWidget {
  final String? paymentscreen;
  const PopupGOTO({
    Key? key,
    this.paymentscreen,
  }) : super(key: key);

  @override
  State<PopupGOTO> createState() => _PopupGOTOState();
}

class _PopupGOTOState extends State<PopupGOTO> {
  late Map<String, String> screenData;

  @override
  void initState() {
    super.initState();
    // Parsing data screen menjadi Map
    screenData = _parseScreenData(widget.paymentscreen ?? '');
  }

  Map<String, String> _parseScreenData(String screen) {
    Map<String, String> parsedData = {};
    List<String> items = screen.split('|');

    for (var item in items) {
      var parts = item.split(':');
      if (parts.length > 1) {
        parsedData[parts[0].trim()] = parts[1].trim();
      }
    }
    return parsedData;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: FractionallySizedBox(
        heightFactor: 0.8,
        widthFactor: 0.95, // Mengatur lebar popup menjadi 85% dari layar
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.close,
                    color: Colors.grey,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Check Status',
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      color: mainColor),
                ),
              ),
              SizedBox(height: 1.h),
              Expanded(
                child: ListView(
                  children: [
                    ...screenData.entries.map(
                      (entry) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 0.5.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 35.5.w,
                              child: Text(
                                entry.key,
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(width: 1.5.w),
                            Text(
                              ":",
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(width: 4.0.w),
                            Expanded(
                              child: Text(
                                entry.value,
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.h),
              ElevatedButton(
                onPressed: () {
                  Get.offAll(HomeView());
                },
                style: ElevatedButton.styleFrom(
                  primary: mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  fixedSize: Size(15.h, 5.h),
                ),
                child: Text(
                  'Kembali',
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
