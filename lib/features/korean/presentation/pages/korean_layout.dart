import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';

class KoreanLayout extends StatefulWidget {
  const KoreanLayout({super.key});

  @override
  State<KoreanLayout> createState() => _KoreanLayoutState();
}

class _KoreanLayoutState extends State<KoreanLayout> {
  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
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
          crossAxisAlignment: .start,
          children: [_buildPath(textTheme)],
        ),
      ),
    );
  }
}

Widget _buildPath(TextTheme textTheme) =>
    Text('Home / Product / Korean Product / ', style: textTheme.bodyLarge);
