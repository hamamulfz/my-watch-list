import 'package:ditonton/presentation/widgets/ditonton_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

buildDrawer() {
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(),
      drawer: DitontonDrawer(
        key: Key("drawer"),
      ),
    ),
  );
}

void main() {
  testWidgets('Just to pass the CI Test', (WidgetTester tester) async {
    await tester.pumpWidget(buildDrawer());
    final drawerIcon = find.byType(Icon);
    // Verify that our counter starts at 0.
    expect(find.byType(AppBar), findsOneWidget);
    expect(drawerIcon, findsOneWidget);

    await tester.tap(drawerIcon);
    await tester.pumpAndSettle();
    expect(find.byType(Drawer), findsOneWidget);
    expect(find.byType(ListTile), findsNWidgets(5));
  });
}
