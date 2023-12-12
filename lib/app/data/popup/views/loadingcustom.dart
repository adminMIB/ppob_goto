import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class LoadingCustomWidget extends StatefulWidget {
  const LoadingCustomWidget({Key? key}) : super(key: key);

  @override
  _LoadingCustomWidgetState createState() => _LoadingCustomWidgetState();
}

class _LoadingCustomWidgetState extends State<LoadingCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.transparent,
            padding: EdgeInsets.only(
              top: 1.0.h,
            ),
            // margin: EdgeInsets.all(17.0.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                    child: Container(
                  width: 50.0.w,
                  height: 30.0.h,
                  child:
                      Lottie.asset('assets/json/loading1.json', height: 30.0.h),
                )),
                // child: Image(
                //     image:
                //         new AssetImage('assets/rev_loading_bpr.gif')))),

                // InkWell(
                //   child: Container(
                //     padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.only(
                //           bottomLeft: Radius.circular(16.0),
                //           bottomRight: Radius.circular(16.0)),
                //     ),
                //     child: Text(
                //       "OK",
                //       style: TextStyle(color: Colors.blue, fontSize: 25.0),
                //       textAlign: TextAlign.center,
                //     ),
                //   ),
                //   onTap: () {
                //     Navigator.pop(context);
                //   },
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
