// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import 'common_dialog.dart';

// class NoticeDialog extends StatelessWidget {
//   final ActionCommonDialog? positiveAction;
//   final ActionCommonDialog? negativeAction;
//   final String title;
//   final String? message;
//   final NoticeDialogType type;
//   final bool touchOutsideToDismiss;
//   const NoticeDialog({
//     Key? key,
//     this.positiveAction,
//     this.negativeAction,
//     required this.title,
//     this.message,
//     this.type = NoticeDialogType.warning,
//     this.touchOutsideToDismiss = true,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CommonDialog(
//       touchOutsideToDismiss: touchOutsideToDismiss,
//       positiveAction: positiveAction,
//       negativeAction: negativeAction,
//       child: Column(
//         children: [
//           30.verticalSpace,
//           SvgPicture.asset(type.icon),
//           20.verticalSpace,
//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 20.sp,
//               fontWeight: FontWeight.w500,
//               color: ThemeHelper.textColorTitleNoticeDialog(context),
//             ),
//           ),
//           if (message?.isNotEmpty ?? false)
//             Text(
//               message!,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 15.sp,
//                 color: ThemeHelper.textColorContentNoticeDialog(context),
//               ),
//             ),
//           30.verticalSpace,
//         ],
//       ),
//     );
//   }
// }
