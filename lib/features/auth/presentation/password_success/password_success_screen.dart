import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:elara_flutter/features/auth/presentation/password_success/widgets/password_success_app_bar.dart';
import 'package:elara_flutter/features/auth/presentation/password_success/widgets/password_success_back_button.dart';
import 'package:elara_flutter/features/auth/presentation/password_success/widgets/password_success_message.dart';
import 'package:elara_flutter/features/auth/presentation/password_success/widgets/password_success_primary_button.dart';
import 'package:elara_flutter/features/auth/presentation/password_success/widgets/password_success_footer_section.dart';

class PasswordSuccessScreen extends StatelessWidget {
  const PasswordSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const PasswordSuccessAppBar(),
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PasswordSuccessBackButton(),
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const PasswordSuccessMessage(),
                            SizedBox(height: 32.h),
                            PasswordSuccessPrimaryButton(
                              text: 'Login',
                              onPressed: () {
                                context.go('/login');
                              },
                            ),
                            SizedBox(height: 8.h),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              const PasswordSuccessFooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
