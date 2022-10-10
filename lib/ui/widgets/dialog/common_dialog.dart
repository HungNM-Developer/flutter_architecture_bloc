import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/core/enums/button_type.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_button.dart';

class ActionCommonDialog {
  final String title;
  final VoidCallback onPressed;
  final ButtonType type;

  ActionCommonDialog({
    required this.title,
    required this.onPressed,
    this.type = ButtonType.primary,
  });
}

class CommonDialog extends StatelessWidget {
  final bool touchOutsideToDismiss;
  final Widget? child;
  final ActionCommonDialog? positiveAction;
  final ActionCommonDialog? negativeAction;

  const CommonDialog({
    Key? key,
    this.touchOutsideToDismiss = true,
    this.child,
    this.positiveAction,
    this.negativeAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.center,
        children: [
          GestureDetector(
            onTap: touchOutsideToDismiss
                ? () => Navigator.of(context).pop()
                : null,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.amberAccent,
            ),
          ),
          Container(
            margin: REdgeInsets.symmetric(vertical: 80, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.white10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (child != null) child!,
                Divider(
                  color: Colors.amber,
                  height: 1.h,
                ),
                RPadding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: negativeAction != null
                            ? AppButton(
                                title: negativeAction!.title,
                                borderRadius: 12.r,
                                onPressed: negativeAction!.onPressed.call,
                                type: negativeAction!.type,
                              )
                            : AppButton(
                                title: 'Huy',
                                borderRadius: 12.r,
                                padding: REdgeInsets.symmetric(horizontal: 55),
                                onPressed: () => Navigator.of(context).pop(),
                                type: ButtonType.normal,
                              ),
                      ),
                      if (positiveAction != null) ...[
                        32.horizontalSpace,
                        Expanded(
                          child: AppButton(
                            title: positiveAction!.title,
                            borderRadius: 12.r,
                            onPressed: positiveAction!.onPressed.call,
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
