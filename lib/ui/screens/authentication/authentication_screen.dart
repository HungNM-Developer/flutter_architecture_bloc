import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/config/app_images.dart';
import 'package:flutter_architecture_bloc/core/enums/button_type.dart';
import 'package:flutter_architecture_bloc/core/routes/route_name.dart';
import 'package:flutter_architecture_bloc/di/injection.dart';
import 'package:flutter_architecture_bloc/states/cubit/authentication/authentication_cubit.dart';
import 'package:flutter_architecture_bloc/states/cubit/authentication/authentication_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../config/app_colors.dart';
import '../../widgets/app_text_form_field.dart';
import '../../widgets/button_gradient.dart';

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
        backgroundColor: AppColors.bgDarkBlue,
        extendBody: true,
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: REdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              49.verticalSpace,
              Text(
                'Wellcome,',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 35.sp,
                  color: AppColors.kWhiteColor,
                ),
              ),
              Text(
                'Sign in with your account',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: AppColors.kGreyColor,
                ),
              ),
              70.verticalSpace,
              AppTextFormField(
                controller: _emailController,
                hint: 'User name or email',
                label: 'User name or email',
                isRequired: true,
              ),
              30.verticalSpace,
              AppTextFormField(
                controller: _passwordController,
                hint: 'Password',
                label: 'Password',
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
                    'forget password',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
              30.verticalSpace,
              ButtonGradient(
                onTap: () {
                  context.goNamed(RouteName.movieHomeScreen);
                },
                title: 'Sign In',
                height: 44.h,
                width: double.infinity,
                type: ButtonType.primary,
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
              ButtonGradient(
                onTap: () {},
                title: 'Sign In with Google',
                height: 44.h,
                width: double.infinity,
                type: ButtonType.outline,
                prefix: Image(
                  image: AppImages.google,
                  width: 20.w,
                  height: 20.w,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
