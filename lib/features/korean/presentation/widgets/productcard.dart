import 'package:elara_flutter/core/constants/app_colors.dart';
import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';

class Productcard extends StatelessWidget {
  const Productcard({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: colorTheme.surface,
        boxShadow: [BoxShadow(blurRadius: 0.5)]
      ),
      child: Column(
        spacing: AppSpacing.sm,
        mainAxisAlignment: .spaceAround,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // TODO: Put the image
                  Image.asset('assets/images/logo.png', fit: BoxFit.contain),
        
                  Positioned(
                  top: AppSpacing.xs,
                  right: AppSpacing.xs,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border_outlined),
                    iconSize: AppSpacing.xl,
                  ),
                ),
        
                Positioned(
                  top: AppSpacing.xs,
                  left: AppSpacing.xs,
                  child: Text(
                    'New',
                    style: textTheme.bodyLarge?.copyWith(color: colorTheme.error),
                  ),
                ),
        
                Positioned(
                  bottom: AppSpacing.xs,
                  left: AppSpacing.xs,
        
                  child: Container(
                    padding: EdgeInsets.all(AppSpacing.xs),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppRadius.full),
                      color: colorTheme.surfaceContainer,
                    ),
                    child: Row(
                      spacing: AppRadius.sm,
                      children: [
                        Icon(Icons.star),
                        // TODO: Put the rating
                        Text('4.5'),
                      ],
                    ),
                  ),
                ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: AppSpacing.xs, right: AppSpacing.xs, bottom: AppSpacing.xs),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppSpacing.xs,
                  children: [
                    // TODO: Put the category
                    Text(
                      'category',
                      style: textTheme.labelSmall?.copyWith(
                        color: AppColors.lightDisabledContent,
                      ),
                    ),
                    // TODO: Put the name of the product
                    Text('Fixing spray', style: textTheme.bodyLarge),
                    // TODO: Put the price of the product
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$200.00', style: textTheme.bodyMedium),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppRadius.full),
                            color: colorTheme.onSurface,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                            color: colorTheme.surface,
                            iconSize: AppSpacing.lg,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            ),
          ],
      
      ),
    );
  }
}
