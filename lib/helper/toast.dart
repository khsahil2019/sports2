// import 'package:flutter/material.dart';

// import 'package:sports2/helper/theme.dart';

// // import '../constants/ui_constant.dart';

// void showToastMessage(String message,
//     {IconData icon = Icons.key, Color? color, int duration = 3}) {
//   color ??= AppColors.lightBlue;

//   showToastWidget(
//     Container(
//       width: double.infinity,
//       margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
//       padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//       decoration: BoxDecoration(
//         color: color,
//         border: Border.all(color: Colors.blue),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             icon,
//             // size: 20,
//             color: Colors.blue,
//           ),
//           SizedBox(
//             width: 6,
//           ),
//           Expanded(
//             child: GestureDetector(
//               onTap: () {},
//               child: Text(
//                 message,
//                 style: AppTextStyle.text
//                     .copyWith(color: Color.fromRGBO(134, 134, 134, 1)),
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 6,
//           ),
//           GestureDetector(
//             onTap: () {
//               dismissAllToast();
//             },
//             child: Icon(
//               Icons.close,
//               color: Colors.blue,
//               size: 20,
//             ),
//           )
//         ],
//       ),
//     ),
//     handleTouch: true,
//     position: ToastPosition.bottom,
//     duration: Duration(seconds: duration),
//   );
// }
