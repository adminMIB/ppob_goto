import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppob_mpay1/app/data/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardMenu extends StatelessWidget {
  final String? image;
  final String? title;
  final Function()? onTap;
  const CardMenu({Key? key, this.image, this.onTap, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Cek apakah gambar adalah berkas SVG
    // final isSvg = image != null && image.endsWith('.svg');
    final isSvg = image?.endsWith('.svg') ?? false;

    return SizedBox(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 8.0.h,
          height: 11.0.h,
          // decoration: BoxDecoration(
          //   color: blackColor,
          // ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 5.0.h,
                  height: 5.0.h,
                  // decoration: BoxDecoration(
                  //   color: Color(0xFFBC3434),
                  // ),
                  child: ClipRect(
                    child: isSvg
                        ? SvgPicture.asset(
                            image!,
                            fit: BoxFit.contain,
                            width: 38,
                            height: 42,
                            // width: 40.0,
                            // height: 40.0,
                          )
                        : Image.asset(
                            image!,
                            width: 38,
                            height: 42,
                            fit: BoxFit.contain,
                            // width: 40.0,
                            // height: 40.0,
                          ),
                  ),
                ),
              ),
              SizedBox(height: 1.0.h),
              Align(
                // alignment: AlignmentDirectional(-1, -1),
                child: Text(
                  title!,
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        // child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Container(
        //       width: 4.5.h,
        //       height: 4.0.h,
        //       // decoration: BoxDecoration(
        //       //   color: isSvg
        //       //       ? Colors.transparent
        //       //       : oceanColor, // Jika SVG, gunakan transparan
        //       //   shape: BoxShape.circle,
        //       // ),
        //       child: Center(
        //         child: isSvg
        //             ? SvgPicture.asset(
        //                 image!,
        //                 // width: 40.0,
        //                 // height: 40.0,
        //               )
        //             : Image.asset(
        //                 image!,
        //                 fit: BoxFit.contain,
        //                 // width: 40.0,
        //                 // height: 40.0,
        //               ),
        //       ),
        //     ),
        //     SizedBox(
        //       height: 1.0.h,
        //     ),
        //     Column(
        //       children: [
        //         Container(
        //           width: 8.0.h,
        //           child: Text(
        //             title!,
        //             style: TextStyle(
        //               color: mainColor,
        //               fontSize: 10.sp,
        //               fontWeight: FontWeight.w500,
        //             ),
        //             textAlign: TextAlign.center,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
