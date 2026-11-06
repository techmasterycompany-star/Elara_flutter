import 'package:elara_flutter/features/makeup/presentation/widgets/product_dropdown_button.dart';
import 'package:elara_flutter/features/makeup/presentation/widgets/product_dropdown_button_right.dart';
import 'package:flutter/material.dart';

class FilterOptionsBar extends StatelessWidget {
  const FilterOptionsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProductDropdownButton(),
        Spacer(),
        ProductDropdownButtonRight(),
      ],
    );
  }
}
