// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultIconButton extends StatelessWidget {
  static const Color _kColor = Colors.white10;

  final Widget icon;
  final Size? size;
  final VoidCallback? onPressed;
  final Color backgroundColor;

  const DefaultIconButton({
    super.key,
    required this.icon,
    this.size,
    this.onPressed,
    this.backgroundColor = _kColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      // ignore: sort_child_properties_last
      child: icon,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        fixedSize: size ?? Size(40.r, 40.r),
        shape: const CircleBorder(),
        elevation: 0,
        primary: backgroundColor,
        onSurface: backgroundColor,
      ),
    );
  }
}
