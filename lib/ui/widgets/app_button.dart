import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/core/core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  static final REdgeInsets _defaultPadding = REdgeInsets.symmetric(
    vertical: 10,
    horizontal: 20,
  );
  static final double _defaultHeight = 48.h;
  final ButtonType type;
  final String title;
  final VoidCallback onPressed;
  final double? borderRadius;
  final REdgeInsets? padding;
  final Widget? prefix;
  final Widget? suffix;
  final MainAxisSize mainAxisSize;
  final double? height;
  final TextStyle? textStyle;
  const AppButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.borderRadius,
    this.padding,
    this.prefix,
    this.suffix,
    this.mainAxisSize = MainAxisSize.min,
    this.height,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? _defaultHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: type.getBackgroundColor(context),
          shadowColor: Colors.transparent,
          padding: padding ?? _defaultPadding,
          foregroundColor: type.getForegroundColor(context),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
            side: type == ButtonType.outline
                ? const BorderSide(
                    color: Colors.greenAccent,
                  )
                : BorderSide.none,
          ),
        ),
        child: Row(
          mainAxisSize: mainAxisSize,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefix != null) ...[
              prefix!,
              8.horizontalSpace,
            ],
            Text(
              title,
              style: textStyle ??
                  TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: type.getTextColor(context),
                  ),
            ),
            if (suffix != null) ...[
              8.horizontalSpace,
              suffix!,
            ],
          ],
        ),
      ),
    );
  }
}
