import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:elara_flutter/features/auth/presentation/create_new_password/widgets/create_new_password_app_bar.dart';
import 'package:elara_flutter/features/auth/presentation/create_new_password/widgets/create_new_password_back_button.dart';
import 'package:elara_flutter/features/auth/presentation/create_new_password/widgets/create_new_password_header.dart';
import 'package:elara_flutter/features/auth/presentation/create_new_password/widgets/create_new_password_text_field.dart';
import 'package:elara_flutter/features/auth/presentation/create_new_password/widgets/create_new_password_primary_button.dart';
import 'package:elara_flutter/features/auth/presentation/create_new_password/widgets/create_new_password_footer_section.dart';
import 'package:elara_flutter/features/auth/data/customer_api.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> _onResetPassword() async {
    final extra = GoRouterState.of(context).extra;
    final map = extra is Map<String, dynamic> ? extra : <String, dynamic>{};
    final email = (map['email'] ?? '').toString();
    final otp = (map['otp'] ?? map['token'] ?? '').toString();
    try {
      final api = CustomerApi();
      await api.resetPassword(
        email: email,
        otp: otp,
        newPassword: _passwordController.text,
      );
      if (!mounted) return;
      context.push('/password-success');
    } on AuthException catch (e) {
      _showError(e.message);
    } catch (e) {
      _showError(e.toString());
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CreateNewPasswordAppBar(),
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CreateNewPasswordBackButton(),
                    SizedBox(height: 16.h),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: [
                          BoxShadow(
                            color:
                                const Color(0xFFD98A9C).withValues(alpha: 0.25),
                            blurRadius: 24,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 40.h,
                        ),
                        child: Column(
                          children: [
                            const CreateNewPasswordHeader(),
                            SizedBox(height: 24.h),
                            CreateNewPasswordTextField(
                              controller: _passwordController,
                              hintText: 'password',
                              obscureText: _obscurePassword,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                                child: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: const Color(0xFF6B6265),
                                  size: 24.sp,
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            CreateNewPasswordTextField(
                              controller: _confirmPasswordController,
                              hintText: 'Connfirm password',
                              obscureText: _obscureConfirmPassword,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureConfirmPassword =
                                        !_obscureConfirmPassword;
                                  });
                                },
                                child: Icon(
                                  _obscureConfirmPassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: const Color(0xFF6B6265),
                                  size: 24.sp,
                                ),
                              ),
                            ),
                            SizedBox(height: 24.h),
                            CreateNewPasswordPrimaryButton(
                              text: 'Reaset Password',
                              onPressed: _onResetPassword,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              const CreateNewPasswordFooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
