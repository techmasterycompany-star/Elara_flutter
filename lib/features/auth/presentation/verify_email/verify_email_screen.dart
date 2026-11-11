import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:elara_flutter/features/auth/presentation/verify_email/widgets/verify_email_app_bar.dart';
import 'package:elara_flutter/features/auth/presentation/verify_email/widgets/verify_email_back_button.dart';
import 'package:elara_flutter/features/auth/presentation/verify_email/widgets/verify_email_header.dart';
import 'package:elara_flutter/features/auth/presentation/verify_email/widgets/verify_email_otp_input.dart';
import 'package:elara_flutter/features/auth/presentation/verify_email/widgets/verify_email_resend_prompt.dart';
import 'package:elara_flutter/features/auth/presentation/verify_email/widgets/verify_email_primary_button.dart';
import 'package:elara_flutter/features/auth/presentation/verify_email/widgets/verify_email_footer_section.dart';
import 'package:elara_flutter/features/auth/data/customer_api.dart';
import 'package:elara_flutter/features/auth/domain/models/auth_response.dart';

class VerifyEmailScreen extends StatefulWidget {
  final String email;

  const VerifyEmailScreen({
    super.key,
    this.email = 'mariamhamd...23@gmail.com',
  });

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  String _enteredOtp = '';

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> _onVerify() async {
    if (_enteredOtp.length < 6) {
      _showError('Please enter all 6 digits of the OTP');
      return;
    }
    try {
      final api = CustomerApi();
      final AuthResponse res = await api.verifyOtp(
        email: widget.email,
        otp: _enteredOtp,
      );
      if (!mounted) return;
      context.push(
        '/create-new-password',
        extra: {
          'email': widget.email,
          'otp': _enteredOtp,
          'token': res.token,
        },
      );
    } on AuthException catch (e) {
      _showError(e.message);
    } catch (e) {
      _showError(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const VerifyEmailAppBar(),
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VerifyEmailBackButton(),
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
                            VerifyEmailHeader(email: widget.email),
                            SizedBox(height: 32.h),
                            VerifyEmailOtpInput(
                              onChanged: (val) {
                                setState(() {
                                  _enteredOtp = val;
                                });
                              },
                              onCompleted: (val) {
                                setState(() {
                                  _enteredOtp = val;
                                });
                              },
                            ),
                            SizedBox(height: 28.h),
                            VerifyEmailResendPrompt(
                              onResendTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('OTP resent successfully'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 32.h),
                            VerifyEmailPrimaryButton(
                              text: 'Verify Email',
                              onPressed: _onVerify,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              const VerifyEmailFooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
