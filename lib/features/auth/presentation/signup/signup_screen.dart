import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:elara_flutter/core/constants/app_colors.dart';
import 'package:elara_flutter/features/auth/presentation/signup/widgets/signup_app_bar.dart';
import 'package:elara_flutter/features/auth/presentation/signup/widgets/signup_back_button.dart';
import 'package:elara_flutter/features/auth/presentation/signup/widgets/signup_tab_bar.dart';
import 'package:elara_flutter/features/auth/presentation/signup/widgets/signup_text_field.dart';
import 'package:elara_flutter/features/auth/presentation/signup/widgets/signup_primary_button.dart';
import 'package:elara_flutter/features/auth/presentation/signup/widgets/signup_google_sign_in_row.dart';
import 'package:elara_flutter/features/auth/presentation/signup/widgets/signup_footer_section.dart';
import 'package:elara_flutter/features/auth/data/customer_api.dart';
import 'package:elara_flutter/features/auth/domain/models/customer.dart';
import 'package:elara_flutter/features/auth/domain/models/auth_response.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
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

  Future<void> _onSignUp() async {
    try {
      final api = CustomerApi();
      final customer = Customer(
        id: '',
        name: _fullNameController.text.trim(),
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim(),
      );
      final AuthResponse res = await api.signup(
        customer: customer,
        password: _passwordController.text,
      );
      if (!mounted) return;
      final _ = res.token;
      context.push(
        '/verify-email',
        extra: {'email': customer.email},
      );
    } on AuthException catch (e) {
      _showError(e.message);
    } catch (e) {
      _showError(e.toString());
    }
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
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
              const SignupAppBar(),
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SignupBackButton(
                      onTap: () {
                        context.go('/login');
                      },
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFD98A9C)
                                .withValues(alpha: 0.25),
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
                            SignupTabBar(
                              selectedIndex: 1,
                              onSignInTap: () {
                                context.go('/login');
                              },
                              onSignUpTap: () {},
                            ),
                            SizedBox(height: 24.h),
                            Text(
                              'Creat Your Account',
                              style: GoogleFonts.manrope(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF6B6265),
                                height: 38 / 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              'Sing up to get start',
                              style: GoogleFonts.manrope(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF51424A),
                                height: 28 / 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 24.h),
                            SignupTextField(
                              controller: _fullNameController,
                              hintText: 'Full Name',
                            ),
                            SizedBox(height: 20.h),
                            SignupTextField(
                              controller: _emailController,
                              hintText: 'Email',
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(height: 20.h),
                            SignupTextField(
                              controller: _phoneController,
                              hintText: ' Phone',
                              keyboardType: TextInputType.phone,
                            ),
                            SizedBox(height: 20.h),
                            SignupTextField(
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
                            SignupTextField(
                              controller: _confirmPasswordController,
                              hintText: ' Connfirm password',
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
                            SignupPrimaryButton(
                              text: 'Sign in',
                              onPressed: _onSignUp,
                            ),
                            SizedBox(height: 12.h),
                            const SignupGoogleSignInRow(),
                            SizedBox(height: 16.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Aleardy Hava an Account ? ',
                                  style: GoogleFonts.manrope(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF6B6265),
                                    height: 28 / 16,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.go('/login');
                                  },
                                  child: Text(
                                    'Login',
                                    style: GoogleFonts.manrope(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.lightTextLink,
                                      height: 28 / 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              const SignupFooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
