import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/config/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetailButton extends StatelessWidget {
  const MovieDetailButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: REdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFF43466a),
            //const Color(0xFF192E5A).withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF292B37).withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 4,
              ),
            ],
          ),
          child: Icon(
            Icons.add,
            color: AppColors.kWhiteColor,
            size: 35.sp,
          ),
        ),
        Container(
          padding: REdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFF43466a),
            //const Color(0xFF192E5A).withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF292B37).withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 4,
              ),
            ],
          ),
          child: Icon(
            Icons.favorite_border_outlined,
            color: AppColors.kWhiteColor,
            size: 35.sp,
          ),
        ),
        Container(
          padding: REdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFF43466a),
            //const Color(0xFF192E5A).withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF292B37).withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 4,
              ),
            ],
          ),
          child: Icon(
            Icons.download,
            color: AppColors.kWhiteColor,
            size: 35.sp,
          ),
        ),
        Container(
          padding: REdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFF43466a),
            //const Color(0xFF192E5A).withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF292B37).withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 4,
              ),
            ],
          ),
          child: Icon(
            Icons.share,
            color: AppColors.kWhiteColor,
            size: 35.sp,
          ),
        ),
      ],
    );
  }
}
