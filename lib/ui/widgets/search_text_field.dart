import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/config/config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTapFilter;
  final String? hint;

  const SearchTextField({
    Key? key,
    this.controller,
    this.onChanged,
    this.onTapFilter,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: TextStyle(
          color: Colors.amberAccent,
          fontSize: 14.sp,
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22.r),
            borderSide: BorderSide(
              color: Colors.amberAccent,
              width: 1.r,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22.r),
            borderSide: BorderSide(
              color: Colors.amberAccent,
              width: 1.r,
            ),
          ),
          prefixIcon: Padding(
            padding: REdgeInsets.only(top: 12, bottom: 12),
            child: SvgPicture.asset(
              AppSvgImages.passwordInvisible,
              width: 20.r,
              height: 20.r,
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: onTapFilter,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 24.h,
                  child: VerticalDivider(
                    color: Colors.amberAccent,
                    width: 1.w,
                  ),
                ),
                10.horizontalSpace,
                SvgPicture.asset(
                  AppSvgImages.passwordVisible,
                  width: 20.r,
                  height: 20.r,
                ),
              ],
            ),
          ),
          hintText: hint,
          contentPadding: REdgeInsets.symmetric(vertical: 12, horizontal: 10),
          isDense: true,
          counterText: '',
          hintStyle: TextStyle(
            color: Colors.amberAccent,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
