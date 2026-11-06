import 'package:elara_flutter/core/constants/app_colors.dart';
import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:elara_flutter/features/makeup/presentation/widgets/custom_text_form_fild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      height: 255.h,
      width: double.infinity,
      color: AppColors.lightDisabledBackgroundAppFooter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Be the first one to know about new products, offers',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          AppSpacing.vertical8,
          SizedBox(height: 48.h, child: CustomTextFormFild()),
          AppSpacing.vertical16,
          Row(
            children: [
              Expanded(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: AppColors.iconColorAppFooter,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: AppColors.lightBorderDefault,
                        width: 1.5.w,
                      ),
                    ),
                    child: Icon(
                      Icons.call,
                      color: AppColors.lightBorderDefault,
                    ),
                  ),
                  title: Text(
                    'PHONE SUPPORT',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  subtitle: Text(
                    '0123456789',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
              // AppSpacing.horizontal4,
              Expanded(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: AppColors.iconColorAppFooter,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: AppColors.lightBorderDefault,
                        width: 1.5.w,
                      ),
                    ),
                    child: Icon(
                      Icons.email_outlined,
                      color: AppColors.lightBorderDefault,
                    ),
                  ),
                  title: Text(
                    'EMAIL SUPPORT',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  subtitle: Text(
                    'Elara shop23@gmail.com',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
