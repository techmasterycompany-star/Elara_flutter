import 'package:elara_flutter/core/constants/app_colors.dart';
import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:elara_flutter/features/makeup/presentation/pages/mackup%20brand/widgets/all_brand.dart';
import 'package:elara_flutter/features/makeup/presentation/widgets/app_footer.dart';
import 'package:elara_flutter/features/makeup/presentation/widgets/custom_app_bar.dart';
import 'package:elara_flutter/features/makeup/presentation/pages/mackup%20brand/widgets/navigation_screen_mackup_brand.dart';
import 'package:flutter/material.dart';

class MackupBrandScreen extends StatelessWidget {
  const MackupBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackgroundDefault,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  NavigationScreenMackupBrand(),
                  AppSpacing.vertical32,
                  Text(
                    'All Brand',
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  AppSpacing.vertical20,
                  Text(
                    'A   B   C  D   E   F   G   H   L   M   N   O   S  R',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  AppSpacing.vertical16,
                  AllBrand(text: 'A'),
                  AppSpacing.vertical16,
                  AllBrand(text: 'B'),
                  AppSpacing.vertical16,
                  AllBrand(text: 'C'),
                  AppSpacing.vertical16,
                  AllBrand(text: 'C'),
                  AppSpacing.vertical16,
                  AllBrand(text: 'C'),
                ],
              ),
            ),
            AppSpacing.vertical32,
            AppFooter(),
          ],
        ),
      ),
    );
  }
}
