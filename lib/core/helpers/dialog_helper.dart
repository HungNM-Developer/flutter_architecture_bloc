import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/ui/widgets/dialog/common_dialog.dart';

import '../enums/notice_dialog_type.dart';

abstract class DialogHelper {
  void snackBar(
    BuildContext context, {
    required String content,
    Duration duration = const Duration(seconds: 1),
  });

  Future<T?> noticeDialog<T>(
    BuildContext context, {
    required String title,
    ActionCommonDialog? positiveAction,
    ActionCommonDialog? negativeAction,
    String? message,
    NoticeDialogType type = NoticeDialogType.warning,
    bool touchOutsideToDismiss = true,
  });

  Future<T?> actionDialog<T>(
    BuildContext context, {
    ActionCommonDialog? positiveAction,
    ActionCommonDialog? negativeAction,
    required Widget body,
    required Widget header,
    bool touchOutsideToDismiss = true,
  });

  Future<T?> bottomSheet<T>(
    BuildContext context, {
    String? title,
    VoidCallback? onBackPressed,
    Widget? action,
    Widget? child,
    Widget? childAbsolutely,
    bool isDismissible = true,
    bool enableDrag = true,
  });
}

class DialogHelperImpl implements DialogHelper {
  @override
  void snackBar(
    BuildContext context, {
    required String content,
    Duration duration = const Duration(seconds: 1),
  }) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        duration: duration,
      ),
    );
  }

  @override
  Future<T?> actionDialog<T>(BuildContext context,
      {ActionCommonDialog? positiveAction,
      ActionCommonDialog? negativeAction,
      required Widget body,
      required Widget header,
      bool touchOutsideToDismiss = true}) {
    throw UnimplementedError();
  }

  @override
  Future<T?> bottomSheet<T>(BuildContext context,
      {String? title,
      VoidCallback? onBackPressed,
      Widget? action,
      Widget? child,
      Widget? childAbsolutely,
      bool isDismissible = true,
      bool enableDrag = true}) {
    throw UnimplementedError();
  }

  @override
  Future<T?> noticeDialog<T>(BuildContext context,
      {required String title,
      ActionCommonDialog? positiveAction,
      ActionCommonDialog? negativeAction,
      String? message,
      NoticeDialogType type = NoticeDialogType.warning,
      bool touchOutsideToDismiss = true}) {
    throw UnimplementedError();
  }
}
