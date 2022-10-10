import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common_dialog.dart';

class ActionDialog extends StatelessWidget {
  final ActionCommonDialog? positiveAction;
  final ActionCommonDialog? negativeAction;
  final bool touchOutsideToDismiss;
  final Widget? body;
  final Widget? header;
  const ActionDialog({
    Key? key,
    this.positiveAction,
    this.negativeAction,
    this.body,
    this.header,
    this.touchOutsideToDismiss = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonDialog(
      touchOutsideToDismiss: touchOutsideToDismiss,
      negativeAction: negativeAction,
      positiveAction: positiveAction,
      child: Column(
        children: [
          if (header != null) ...[
            RPadding(
              padding: const EdgeInsets.all(16),
              child: header!,
            ),
            Divider(
              color: Colors.black12,
              height: 1.h,
            ),
          ],
          if (body != null) body!,
        ],
      ),
    );
  }
}
