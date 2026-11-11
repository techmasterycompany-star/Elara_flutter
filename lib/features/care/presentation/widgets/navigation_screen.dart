import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:elara_flutter/features/care/presentation/widgets/app_badge.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppBadge(onTap: () {}, text: 'Home'),
        AppSpacing.horizontal8,
        Text('/'),
        AppSpacing.horizontal8,
        AppBadge(
          onTap: () {
            context.push('/TopFaceScreen');
          },
          text: 'Product l',
        ),
        AppSpacing.horizontal8,
        Text('/'),
        AppSpacing.horizontal8,
        AppBadge(
          onTap: () {
            context.push('/MackupBrandScreen');
          },
          text: 'Mackup',
        ),
        AppSpacing.horizontal8,
        Text('/'),
        AppSpacing.horizontal8,
        AppBadge(onTap: () {}, text: 'Nivea'),
      ],
    );
  }
}
