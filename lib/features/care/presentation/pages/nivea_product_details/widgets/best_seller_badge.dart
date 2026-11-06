import 'package:elara_flutter/core/constants/app_colors.dart';
import 'package:elara_flutter/features/makeup/presentation/widgets/app_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerBadge extends StatelessWidget {
  const BestSellerBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppBadge(
          height: 40.h,
          width: 90.w,
          circular: 16,
          padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
          text: 'Best Seller',
          textStyle: TextStyle(
            color: AppColors.lightIconWhite,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
          color: AppColors.colorStatusGold,
        ),
        Spacer(),
        IconButton(
          style: IconButton.styleFrom(
            // backgroundColor: ,
            shape: CircleBorder(
              side: BorderSide(color: AppColors.darkIconSecondary, width: 1.5),
            ),
          ),
          onPressed: () {},
          icon: Icon(Icons.favorite_outline_outlined),
        ),
      ],
    );
  }
}
