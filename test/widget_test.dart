import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:vr_view/main.dart';

void main() {
  testWidgets('app builds and shows the home page', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const NameBar());

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
