// import 'package:chips_choice/chips_choice.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

// class contohview extends StatefulWidget {
//   const contohview({Key? key}) : super(key: key);

//   @override
//   State<contohview> createState() => _contohState();
// }

// class _contohState extends State<contohview> {
//   int valueTipeActivity = 0;
//   int valueCheckOut = 0;
//   List<String> tipeActivity = [
//     'Prospect',
//     'Call',
//     'Visit',
//     'Walked In',
//     'Non Selling'
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: Builder(
//         builder: (context) => StatefulBuilder(
//           builder: (BuildContext context, StateSetter myState) {
//             return SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Wrap(
//                     children: [
//                       ChipsChoice<int>.single(
//                         value: valueTipeActivity,
//                         onChanged: (val) =>
//                             myState(() => valueTipeActivity = val),
//                         choiceItems: C2Choice.listFrom<int, String>(
//                           source: tipeActivity,
//                           value: (i, v) => i,
//                           label: (i, v) => v,
//                         ),
//                         choiceStyle: C2ChipStyle.toned(
//                           // backgroundColor: Colors.green,

//                           borderRadius: const BorderRadius.all(
//                             Radius.circular(5),
//                           ),
//                         ),

//                         wrapped: true,

//                         // direction: Axis.vertical,
//                       ),
//                     ],
//                   ),
//                   Center(
//                     child: Container(
//                       margin: EdgeInsets.all(10),
//                       height: MediaQuery.of(context).size.height / 22,
//                       width: MediaQuery.of(context).size.width,
//                       child: ElevatedButton(
//                         onPressed: () async {
//                           var deskCheckIn;
//                           if (valueTipeActivity == 0) {
//                             deskCheckIn = 'Prospect';
//                           } else if (valueTipeActivity == 1) {
//                             deskCheckIn = 'Call';
//                           } else if (valueTipeActivity == 2) {
//                             deskCheckIn = 'Visit';
//                           } else if (valueTipeActivity == 3) {
//                             deskCheckIn = 'Walked In';
//                           } else if (valueTipeActivity == 4) {
//                             deskCheckIn = 'Non Selling';
//                           }

//                           // await dailyActivityController
//                           //     .checkIn(
//                           //   widget.flag,
//                           //   deskCheckIn,
//                           //   context,
//                           // );

//                           setState(() {});
//                         },
//                         // style: ElevatedButton
//                         //     .styleFrom(
//                         //   primary: mainColor,
//                         //   shape:
//                         //       RoundedRectangleBorder(
//                         //     borderRadius:
//                         //         BorderRadius
//                         //             .circular(
//                         //                 8),
//                         //   ),
//                         // ),
//                         child: Text(
//                           'Check-In',
//                           // style: whiteTextFont,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Center(
//                     child: Container(
//                       margin: EdgeInsets.all(10),
//                       height: MediaQuery.of(context).size.height / 22,
//                       width: MediaQuery.of(context).size.width,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Get.back();
//                         },
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.grey,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         child: Text(
//                           'KEMBALI',
//                           // style: whiteTextFont,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
