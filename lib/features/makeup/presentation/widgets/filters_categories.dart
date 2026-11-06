import 'package:elara_flutter/core/constants/app_colors.dart';
import 'package:elara_flutter/features/makeup/presentation/widgets/app_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FiltersCategories extends StatelessWidget {
  final List<String> categories;
  final String selected;
  final ValueChanged<String> onSelected;

  const FiltersCategories({
    super.key,
    required this.selected,
    required this.onSelected,
    this.categories = const [
      'All Product',
      'Skin',
      'Eyes',
      'Cheeks',
      'Eyebrows',
      'Lips',
      'Burches',
      'Offers',
    ],
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final name = categories[index];
          final isSelected = name == selected;

          return AppBadge(
            text: name,
            onTap: () => onSelected(name),
            circular: 50,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            color: isSelected ? Colors.black87 : Colors.transparent,
            border: Border.all(
              color: isSelected
                  ? AppColors.darkBackgroundDefault
                  : AppColors.darkBorderDefault,
              width: 1.2.w,
            ),
            textStyle: TextStyle(
              color: isSelected ? Colors.white : Colors.grey.shade600,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          );
        },
      ),
    );
  }
}
