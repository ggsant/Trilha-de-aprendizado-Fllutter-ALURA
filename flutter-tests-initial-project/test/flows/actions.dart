import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../matchers/macthers.dart';

Future clickOnTheTransferFeatureItem(WidgetTester tester) async {
  final transferFeatureItem = find.byWidgetPredicate((widget) =>
      featureItemMatcher(widget, 'Transfer', Icons.monetization_on));
  expect(transferFeatureItem, findsOneWidget);
  await tester.tap(transferFeatureItem);
  await tester.pumpAndSettle();
}
