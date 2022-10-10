import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/core/core.dart';
import 'package:flutter_architecture_bloc/ui/widgets/app_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ConfirmRestorePasswordScreen extends StatefulWidget {
  const ConfirmRestorePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmRestorePasswordScreen> createState() =>
      _ConfirmRestorePasswordScreenState();
}

class _ConfirmRestorePasswordScreenState
    extends State<ConfirmRestorePasswordScreen> {
  void _goAuthentication(BuildContext context) {
    context.goNamed(RouteName.authenticationScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: REdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Đã gởi thư điện tử',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              Text(
                'Vui lòng kiểm tra thư điện tử để hoàn thành các bước hướng dẫn khôi phục mật khẩu',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20.sp,
                ),
              ),
              55.verticalSpace,
              AppButton(
                mainAxisSize: MainAxisSize.max,
                borderRadius: 10.r,
                type: ButtonType.outline,
                height: 48.h,
                title: 'Đến trang đăng nhập',
                onPressed: () {
                  _goAuthentication(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
