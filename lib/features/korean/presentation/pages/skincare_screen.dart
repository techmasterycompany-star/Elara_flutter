import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';

import '../widgets/productcard.dart';

class SkincareScreen extends StatelessWidget {
  SkincareScreen({super.key});
  List<Widget> skincareproducts = [
    Productcard(),
    Productcard(),
    Productcard(),
    Productcard(),
    Productcard(),
    Productcard(),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: .vertical,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GridView.count(
              crossAxisSpacing: AppRadius.md,
              mainAxisSpacing: AppSpacing.md,
              childAspectRatio: 0.6,
              
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              children: skincareproducts,
            ),
          ],
        ),
      ),
    );
  }
}
