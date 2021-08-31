// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:basic_05_inheritedwidget_and_valuenotifier/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('UI smoke test', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('hello world'), findsOneWidget);
    expect(find.text('HELLO WORLD'), findsNothing);

    await tester.tap(find.text('PUSH'));
    await tester.pump();

    expect(find.text('hello world'), findsNothing);
    expect(find.text('HELLO WORLD'), findsOneWidget);
  });
}
