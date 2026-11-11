import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:elara_flutter/core/constants/app_colors.dart';
import 'package:elara_flutter/features/auth/presentation/login/widgets/auth_app_bar.dart';
import 'package:elara_flutter/features/auth/presentation/login/widgets/auth_tab_bar.dart';
import 'package:elara_flutter/features/auth/presentation/login/widgets/auth_text_field.dart';
import 'package:elara_flutter/features/auth/presentation/login/widgets/auth_primary_button.dart';
import 'package:elara_flutter/features/auth/presentation/login/widgets/google_sign_in_row.dart';
import 'package:elara_flutter/features/auth/presentation/login/widgets/footer_section.dart';
import 'package:elara_flutter/features/auth/data/customer_api.dart';
import 'package:elara_flutter/features/auth/domain/models/auth_response.dart';
import 'package:elara_flutter/core/routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> _onSignIn() async {
    try {
      final api = CustomerApi();
      final AuthResponse res = await api.login(
        email: _phoneController.text.trim(),
        password: _passwordController.text,
      );
      if (!mounted) return;
      // optional: store res.token with SharedPreferences
      final _ = res.token;
      context.go(AppRoutes.koreanLayout);
    } on AuthException catch (e) {
      _showError(e.message);
    } catch (e) {
      _showError(e.toString());
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
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
              const AuthAppBar(),
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
                      children: [
                        AuthTabBar(
                          selectedIndex: 0,
                          onSignInTap: () {},
                          onSignUpTap: () {
                            context.go('/signup');
                          },
                        ),
                        SizedBox(height: 24.h),
                        Text(
                          'Login to Your Account',
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
                          'Welcome to  Elara Platform',
                          style: GoogleFonts.manrope(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF51424A),
                            height: 28 / 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 24.h),
                        AuthTextField(
                          controller: _phoneController,
                          hintText: ' Phone',
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(height: 20.h),
                        AuthTextField(
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
                        SizedBox(height: 8.h),
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {
                              context.push(
                                '/verify-email',
                                extra: _phoneController.text.trim().isNotEmpty
                                    ? _phoneController.text.trim()
                                    : 'mariamhamd...23@gmail.com',
                              );
                            },
                            child: Text(
                              'Forget Password ?',
                              style: GoogleFonts.manrope(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.lightTextLink,
                                height: 28 / 14,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 24.h),
                        AuthPrimaryButton(
                          text: 'Sign in',
                          onPressed: _onSignIn,
                        ),
                        SizedBox(height: 12.h),
                        const GoogleSignInRow(),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't Hava an Account ? ",
                              style: GoogleFonts.manrope(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF6B6265),
                                height: 28 / 16,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                context.go('/signup');
                              },
                              child: Text(
                                'Sing up',
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
                        SizedBox(height: 12.h),
                        GestureDetector(
                          onTap: () {
                            context.push('/partner-signup');
                          },
                          child: Text(
                            'Sign up as Partner',
                            style: GoogleFonts.manrope(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.lightTextLink,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              const FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
