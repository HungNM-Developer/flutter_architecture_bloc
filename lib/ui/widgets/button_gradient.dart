import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/config/config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/app_colors.dart';
import '../../core/enums/button_type.dart';
import 'custom_outline.dart';

class ButtonGradient extends StatelessWidget {
  final Function() onTap;
  final String title;
  final double width;
  final double height;
  final Widget? prefix;
  final ButtonType type;

  const ButtonGradient({
    super.key,
    required this.onTap,
    required this.title,
    required this.width,
    required this.height,
    required this.type,
    this.prefix,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomOutline(
        strokeWidth: type == ButtonType.outline ? 1.5.w : 3.w,
        radius: 25.r,
        padding: REdgeInsets.all(2),
        width: width,
        height: height,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.kPinkColor,
            AppColors.kGreenColor,
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: type == ButtonType.outline
                  ? [
                      Colors.transparent,
                      Colors.transparent,
                    ]
                  : [
                      AppColors.kPinkColor.withOpacity(0.5),
                      AppColors.kGreenColor.withOpacity(0.5)
                    ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (prefix != null) ...[
                prefix!,
                10.horizontalSpace,
              ],
              Text(
                title,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: AppColors.kWhiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
