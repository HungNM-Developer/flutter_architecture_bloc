import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/core/enums/button_type.dart';
import 'package:flutter_architecture_bloc/core/routes/route_name.dart';
import 'package:flutter_architecture_bloc/di/injection.dart';
import 'package:flutter_architecture_bloc/states/cubit/authentication/authentication_cubit.dart';
import 'package:flutter_architecture_bloc/states/cubit/authentication/authentication_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/app_button.dart';
import '../../widgets/app_text_form_field.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final _authenticationBloc = getIt<AuthenticationCubit>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _authenticationBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      bloc: _authenticationBloc,
      listener: (context, state) {
        if (state is AuthenticationSuccess) {
          context.goNamed(RouteName.mainScreen);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: REdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                49.verticalSpace,
                Text(
                  'Chào mừng bạn',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 26.sp,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  'Đăng nhập vào tài khoản',
                  style: TextStyle(fontSize: 20.sp, color: Colors.black54),
                ),
                28.verticalSpace,
                AppTextFormField(
                  controller: _emailController,
                  hint: 'Thư điện tử',
                  label: 'Thư điện tử',
                  isRequired: true,
                ),
                24.verticalSpace,
                AppTextFormField(
                  controller: _passwordController,
                  hint: 'Mật khẩu',
                  label: 'Mật khẩu',
                  obscureText: true,
                  isRequired: true,
                ),
                10.verticalSpace,
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      context.goNamed(RouteName.forgotPassword);
                    },
                    child: Text(
                      'Quên mật khẩu',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
                30.verticalSpace,
                AppButton(
                  mainAxisSize: MainAxisSize.max,
                  title: 'Đăng nhập',
                  borderRadius: 10.r,
                  onPressed: () {
                    _authenticationBloc.login(
                      username: _emailController.text,
                      password: _passwordController.text,
                    );
                  },
                ),
                30.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Divider(
                        color: Colors.tealAccent.withOpacity(0.2),
                        height: 1.h,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      child: Text(
                        'Hoặc',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.tealAccent,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 2,
                      child: Divider(
                        height: 1.h,
                        color: Colors.tealAccent.withOpacity(0.2),
                      ),
                    ),
                  ],
                ),
                33.verticalSpace,
                AppButton(
                  title: 'Đăng nhập với Google',
                  mainAxisSize: MainAxisSize.max,
                  borderRadius: 10.r,
                  prefix: const Icon(Icons.access_alarm),
                  // SvgPicture.asset(
                  //   AppImages.google,
                  //   width: 24.r,
                  //   height: 24.r,
                  // ),
                  type: ButtonType.outline,
                  textStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
