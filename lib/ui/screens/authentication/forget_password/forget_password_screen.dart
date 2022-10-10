// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/core/enums/forget_passwor_state.dart';
import 'package:flutter_architecture_bloc/core/routes/route_name.dart';
import 'package:flutter_architecture_bloc/di/injection.dart';
import 'package:flutter_architecture_bloc/states/cubit/forget_password/forget_password_cubit.dart';
import 'package:flutter_architecture_bloc/states/cubit/forget_password/forget_password_state.dart';
import 'package:flutter_architecture_bloc/ui/widgets/app_button.dart';
import 'package:flutter_architecture_bloc/ui/widgets/app_text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _emailController = TextEditingController();
  final _forgetPasswordBloc = getIt<ForgetPasswordCubit>();

  @override
  void dispose() {
    _emailController.dispose();
    _forgetPasswordBloc.close();
    super.dispose();
  }

  void _restorePassword({String? email}) {
    if (email != null && email.isNotEmpty && _validateEmail(email: email)) {
      _forgetPasswordBloc.restore(email: email);
      return;
    }
  }

  bool _validateEmail({required String email}) {
    return true;
  }

  void _impementState({
    required ForgetPasswordState state,
    required BuildContext context,
  }) {
    switch (forgetPasswordStateEnum(state)) {
      case RestoreForgetPasswordState.success:
        context.goNamed(RouteName.confirmRestorePassword);
        break;
      case RestoreForgetPasswordState.error:
        break;
    }
  }

  RestoreForgetPasswordState forgetPasswordStateEnum(
      ForgetPasswordState state) {
    if (state is ForgetPasswordSuccess) {
      return RestoreForgetPasswordState.success;
    }
    return RestoreForgetPasswordState.error;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      bloc: _forgetPasswordBloc,
      listener: (context, state) => _impementState(
        state: state,
        context: context,
      ),
      child: Scaffold(
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
                  'Quên mật khẩu',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                4.verticalSpace,
                Text(
                  'Nhập địa chỉ hộp thư điện tử để khôi phục mật khẩu',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20.sp,
                  ),
                ),
                61.verticalSpace,
                Text(
                  'Thư điện tử',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                7.verticalSpace,
                AppTextFormField(
                  controller: _emailController,
                  hint: 'Thư điện tử',
                ),
                66.verticalSpace,
                AppButton(
                  mainAxisSize: MainAxisSize.max,
                  borderRadius: 10.r,
                  height: 48.h,
                  title: 'Khôi phục mật khẩu',
                  onPressed: () {
                    _restorePassword(email: _emailController.text);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
