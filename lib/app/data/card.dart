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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 8.0.h,
              height: 8.0.h,
              // decoration: BoxDecoration(
              //   color: isSvg
              //       ? Colors.transparent
              //       : oceanColor, // Jika SVG, gunakan transparan
              //   shape: BoxShape.circle,
              // ),
              child: Center(
                child: isSvg
                    ? SvgPicture.asset(
                        image!,
                        width: 40.0,
                        height: 40.0,
                      )
                    : Image.asset(
                        image!,
                        fit: BoxFit.contain,
                        width: 40.0,
                        height: 40.0,
                      ),
              ),
            ),
            SizedBox(
              height: 1.0.h,
            ),
            Column(
              children: [
                Text(
                  title!,
                  style: TextStyle(
                    fontSize: 10.0.sp,
                    fontWeight: FontWeight.w400,
                    color: blackColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
