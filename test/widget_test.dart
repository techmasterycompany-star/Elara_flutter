import 'package:flutter_test/flutter_test.dart';
import 'package:elara_flutter/main.dart';

void main() {
  testWidgets('App loads LoginScreen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Login to Your Account'), findsOneWidget);
  });
}
