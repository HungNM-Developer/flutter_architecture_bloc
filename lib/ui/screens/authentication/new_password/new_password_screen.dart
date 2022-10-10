import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/app_button.dart';
import '../../../widgets/app_text_form_field.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                8.verticalSpace,
                Text(
                  'Thiết lập mật khẩu mới',
                  style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                3.verticalSpace,
                Text(
                  'Hãy tạo mật khẩu thật bảo mật và ghi nhớ chính xác.',
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.black54,
                  ),
                ),
                26.verticalSpace,
                AppTextFormField(
                  controller: _passwordController,
                  label: 'Mật khẩu',
                  hint: 'Mật khẩu',
                  obscureText: true,
                  isRequired: true,
                  validate: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Cannot be blank';
                    }
                    return null;
                  },
                ),
                24.verticalSpace,
                AppTextFormField(
                  controller: _confirmPasswordController,
                  label: 'Nhập lại mật khẩu',
                  hint: 'Nhập lại mật khẩu',
                  obscureText: true,
                  isRequired: true,
                  suffixChangeByValidate: true,
                  validate: (value) {
                    if (value != _passwordController.text) {
                      return "Doesn't match";
                    }
                    return null;
                  },
                ),
                35.verticalSpace,
                AppButton(
                  title: 'Lưu mật khẩu',
                  borderRadius: 10.r,
                  mainAxisSize: MainAxisSize.max,
                  onPressed: () {
                    if (_formKey.currentState?.validate() == false) return;
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
