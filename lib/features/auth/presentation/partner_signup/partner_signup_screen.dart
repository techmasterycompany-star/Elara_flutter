import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:elara_flutter/features/auth/presentation/partner_signup/widgets/partner_signup_app_bar.dart';
import 'package:elara_flutter/features/auth/presentation/partner_signup/widgets/partner_signup_header.dart';
import 'package:elara_flutter/features/auth/presentation/partner_signup/widgets/partner_signup_text_field.dart';
import 'package:elara_flutter/features/auth/presentation/partner_signup/widgets/partner_signup_primary_button.dart';
import 'package:elara_flutter/features/auth/presentation/partner_signup/widgets/partner_signup_google_row.dart';
import 'package:elara_flutter/features/auth/presentation/partner_signup/widgets/partner_signup_login_prompt.dart';
import 'package:elara_flutter/features/auth/presentation/partner_signup/widgets/partner_signup_footer_section.dart';
import 'package:elara_flutter/features/auth/data/customer_api.dart';

class PartnerSignupScreen extends StatefulWidget {
  const PartnerSignupScreen({super.key});

  @override
  State<PartnerSignupScreen> createState() => _PartnerSignupScreenState();
}

class _PartnerSignupScreenState extends State<PartnerSignupScreen> {
  final _phoneController = TextEditingController();

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> _onSendCode() async {
    try {
      final api = CustomerApi();
      await api.sendOtp(email: _phoneController.text.trim());
      if (!mounted) return;
      context.push(
        '/verify-email',
        extra: {'email': _phoneController.text.trim()},
      );
    } on AuthException catch (e) {
      _showError(e.message);
    } catch (e) {
      _showError(e.toString());
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
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
              const PartnerSignupAppBar(),
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFD98A9C).withValues(alpha: 0.25),
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
                        const PartnerSignupHeader(),
                        SizedBox(height: 24.h),
                        PartnerSignupTextField(
                          controller: _phoneController,
                          hintText: 'Phone',
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(height: 24.h),
                        PartnerSignupPrimaryButton(
                          text: 'Send Code',
                          onPressed: _onSendCode,
                        ),
                        SizedBox(height: 20.h),
                        PartnerSignupGoogleRow(
                          onTap: () {},
                        ),
                        SizedBox(height: 16.h),
                        PartnerSignupLoginPrompt(
                          onLoginTap: () {
                            context.go('/login');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              const PartnerSignupFooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
