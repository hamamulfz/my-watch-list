import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:about/about.dart';

Widget createAboutPage(Widget body) {
  return MaterialApp(
    home: body,
  );
}

void main() {
  String desc =
      'Ditonton merupakan sebuah aplikasi katalog film yang dikembangkan oleh Dicoding Indonesia sebagai contoh proyek aplikasi untuk kelas Menjadi Flutter Developer Expert.';
  testWidgets('Description app text should display',
      (WidgetTester tester) async {
    await tester.pumpWidget(createAboutPage(const AboutPage()));
    expect(find.text(desc), findsOneWidget);
  });

  testWidgets('Tap Icon', (WidgetTester tester) async {
    await tester.pumpWidget(createAboutPage(const AboutPage()));
    final backIcon = find.byIcon(Icons.arrow_back);
    await tester.tap(backIcon);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.text(desc), findsNothing);
  });
}
