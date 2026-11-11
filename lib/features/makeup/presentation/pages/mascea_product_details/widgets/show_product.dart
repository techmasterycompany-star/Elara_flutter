import 'package:elara_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowProduct extends StatefulWidget {
  final List<String> images;
  const ShowProduct({super.key, required this.images});

  @override
  State<ShowProduct> createState() => _ShowProductState();
}

class _ShowProductState extends State<ShowProduct> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final images = widget.images;
    if (images.isEmpty) {
      return const Center(child: Text('No images available'));
    }
    return Row(
      children: [
        Card(
          color: Colors.white,
          elevation: 3,
          margin: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 118, 17, 79),
            child: Image.network(
              images[selectedIndex],
              key: ValueKey(selectedIndex),
              height: 284.h,
              width: 207.w,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.image_not_supported);
              },
            ),
          ),
        ),

        SizedBox(
          width: 140.w,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: images.length,
            itemBuilder: (context, index) {
              final isSelected = index == selectedIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Card(
                  color: Colors.white,
                  elevation: 3,
                  margin: const EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: isSelected
                          ? AppColors.lightBorderDefault
                          : AppColors.lightIconWhite,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                    images[index],
                    height: 108.h,
                    width: 140.w,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.image_not_supported);
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
