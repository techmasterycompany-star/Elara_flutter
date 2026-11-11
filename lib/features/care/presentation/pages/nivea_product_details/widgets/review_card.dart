import 'package:elara_flutter/core/constants/app_colors.dart';
import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            'Engy Ahmed ',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Text(
            'Verified Reviewe',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: Text(
            '28/2/2026',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        AppSpacing.vertical12,
        Row(
          children: [
            Icon(
              Icons.star,
              color: AppColors.darkBackgroundDefault,
              size: 20.sp,
            ),
            Icon(
              Icons.star,
              color: AppColors.darkBackgroundDefault,
              size: 20.sp,
            ),
            Icon(
              Icons.star,
              color: AppColors.darkBackgroundDefault,
              size: 20.sp,
            ),
            Icon(
              Icons.star,
              color: AppColors.darkBackgroundDefault,
              size: 20.sp,
            ),
            Icon(
              Icons.star,
              color: AppColors.darkBackgroundDefault,
              size: 20.sp,
            ),
          ],
        ),
        AppSpacing.vertical12,
        Text(
          'My favorite  Uplifted Mascara ',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        AppSpacing.vertical12,
        Text(
          'This is my forever favorite loose powder let me face look flawless my favorite is the cherry blossom',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          height: 230.h,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                height: 226.h,
                width: 191.w,
                margin: EdgeInsets.only(right: 8.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  image: DecorationImage(
                    image: AssetImage('assets/images/review_image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            itemCount: 3,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
