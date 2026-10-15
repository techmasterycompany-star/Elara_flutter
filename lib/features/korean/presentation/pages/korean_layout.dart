import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:elara_flutter/core/widgets/pill_button.dart';
import 'package:flutter/material.dart';

import 'skincare_screen.dart';
import 'Mackup_screen.dart';

class KoreanLayout extends StatefulWidget {
  const KoreanLayout({super.key});

  @override
  State<KoreanLayout> createState() => _KoreanLayoutState();
}

class _KoreanLayoutState extends State<KoreanLayout> {
  int index = 0;

  final List<Widget> pages = const [
    SkincareScreen(),
    MackupScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu, size: 30)),
        title: Image.asset('assets/images/logo.png', height: 100),
        centerTitle: true,
      ),

      body: Container(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: Column(
          spacing: AppSpacing.xl,
          crossAxisAlignment: .start,
          children: [_buildPath(textTheme, index),
          Row(
            spacing: AppSpacing.xs,
            children: [
              PillButton(
                message: 'Skincare',
                isSelected: index == 0,
                onPressed: () => setState(() => index = 0),
              ),
              PillButton(
                message: 'Mackup',
                isSelected: index == 1,
                onPressed: () => setState(() => index = 1),
              ),
            ],
          ),

          IndexedStack(
            index: index,
            children: pages,
          )
          ],
        ),
      ),
    );
  }
}

Widget _buildPath(TextTheme textTheme, int index) {
  final currentPath = index == 0 ? 'Skincare' : 'Mackup';
  return Text(
    'Home / Product / Korean Product / $currentPath',
    style: textTheme.bodyLarge,
  );
}
