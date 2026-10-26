import 'package:elara_flutter/features/bundle/presentation/screens/bundle_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Bundle screen shows every segment', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: BundleScreen()));

    expect(find.text('All Product'), findsOneWidget);
    expect(find.text('Mackup'), findsOneWidget);
    expect(find.text('Care'), findsOneWidget);
    expect(find.text('Korean'), findsOneWidget);
    expect(find.text('Bundles'), findsOneWidget);

    // Let the mock repository future complete so no timers stay pending.
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pump();
  });
}
