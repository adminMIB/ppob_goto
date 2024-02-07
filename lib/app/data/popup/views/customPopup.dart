// import 'package:flutter/material.dart';
// import 'package:ppob_mpay1/app/data/colors.dart';
// import 'package:sizer/sizer.dart';

// class CustomPopupWidget extends StatelessWidget {
//   final String? pesan;
//   const CustomPopupWidget({Key? key, this.pesan}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(
//           10.0,
//         ),
//       ),
//       elevation: 0.0,
//       backgroundColor: Colors.transparent,
//       child: dialogContent(context),
//     );
//   }

//   Widget dialogContent(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         Container(
//           padding: EdgeInsets.only(
//             top: 1.0.h,
//           ),
//           margin: EdgeInsets.only(top: 2.0.h, right: 2.0.w),
//           decoration: BoxDecoration(
//             color: whiteColor,
//             shape: BoxShape.rectangle,
//             borderRadius: BorderRadius.circular(10.0),
//             boxShadow: const <BoxShadow>[
//               BoxShadow(
//                 color: Colors.black26,
//                 blurRadius: 10,
//                 offset: Offset(0.0, 0.0),
//               ),
//             ],
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Center(
//                 child: Container(
//                   margin: EdgeInsets.all(5.0.h),

//                   child: Text(
//                     pesan!,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 12.0.sp,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Positioned(
//           right: 0.0,
//           child: GestureDetector(
//             onTap: () {
//               Navigator.of(context).pop();
//             },
//             child: Align(
//               alignment: Alignment.topRight,
//               child: CircleAvatar(
//                 radius: 14.0,
//                 backgroundColor: whiteColor,
//                 child: Icon(Icons.close, color: mainColor),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:sizer/sizer.dart';

class CustomPopupWidget extends StatelessWidget {
  final String? pesan;

  const CustomPopupWidget({Key? key, this.pesan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 1.0.h,
          ),
          margin: EdgeInsets.only(top: 2.0.h, right: 2.0.w),
          decoration: BoxDecoration(
            color: whiteColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(3.h),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0.0, 0.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.all(2.5.h),
                  child: Column(
                    children: [
                      Text(
                        pesan!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.0.sp,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                            primary: mainColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fixedSize: Size(15.0.h, 3.h)),
                        child: Text(
                          'Kembali',
                          style: TextStyle(
                            fontSize: 13.0.sp,
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
      ],
    );
  }
}
