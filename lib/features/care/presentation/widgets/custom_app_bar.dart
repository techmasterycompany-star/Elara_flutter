import 'package:elara_flutter/core/constants/app_colors.dart';
import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.lightBackgroundDefault,
      centerTitle: true,
      title: Image.asset('assets/images/logo.png', height: 55.h, width: 120.w),
      leading: EndDrawerButton(),
      actions: [
        Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            Container(
              height: 20.h,
              width: 1.w,
              color: Theme.of(context).colorScheme.secondary,
            ),
            AppSpacing.horizontal4,
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outlined)),
            Container(
              height: 20.h,
              width: 1.w,
              color: Theme.of(context).colorScheme.secondary,
            ),
            AppSpacing.horizontal4,
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.local_grocery_store_rounded),
            ),
          ],
        ),
      ],
    );
  }
}
