import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListLoader extends StatelessWidget {
  final Widget child;
  final RefreshController controller;
  final FutureOr<Object?> Function()? onRefresh;
  final FutureOr<Object?> Function()? onLoadMore;
  final bool hasNext;

  const ListLoader({
    Key? key,
    required this.child,
    required this.controller,
    this.hasNext = false,
    this.onRefresh,
    this.onLoadMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: controller,
      onLoading: _loadMore,
      onRefresh: _refresh,
      enablePullUp: hasNext && onLoadMore != null,
      enablePullDown: onRefresh != null,
      child: child,
    );
  }

  Future<void> _loadMore() async {
    if (controller.isRefresh) return;
    await onLoadMore?.call();
    controller.loadComplete();
  }

  Future<void> _refresh() async {
    if (controller.isLoading) {
      controller.loadComplete();
    }
    await onRefresh?.call();
    controller.refreshCompleted();
  }
}
