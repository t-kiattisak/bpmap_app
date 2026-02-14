// Basic Flutter widget test (no Riverpod).

import 'package:bpmap_app/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('BPMap'), findsOneWidget);
  });
}
