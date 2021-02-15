import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../lib/screens/dashboard.dart';
import '../matchers/macthers.dart';

void main() {
  // teste de widgets
  testWidgets(
      'Deve apresentar a imagem principal quando o dashboard esta aberto',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Dashboard(
      contactDao: null,
    )));
    final mainImage = find.byType(Image);
    expect(mainImage, findsOneWidget);
  });

  testWidgets(
      'Deve apresentar a primeira funcionalidade quando o dashboard esta aberto',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Dashboard(
      contactDao: null,
    )));
    final firstFeature = find.byType(FeatureItem);
    expect(firstFeature, findsWidgets);
  });

  testWidgets(
      'Deve apresentar a funcionalidade de transferencia quando o dashboard esta aberto',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Dashboard(
      contactDao: null,
    )));
    // final iconTransferFeatureItem =
    //     find.widgetWithIcon(FeatureItem, Icons.monetization_on);
    // expect(iconTransferFeatureItem, findsOneWidget);
    // final nameTransferFeatureItem =
    //     find.widgetWithText(FeatureItem, 'Transfer');
    // expect(nameTransferFeatureItem, findsOneWidget);
    final transferFeatureItem = find.byWidgetPredicate((widget) =>
        featureItemMatcher(widget, 'Transfer', Icons.monetization_on));
    expect(transferFeatureItem, findsOneWidget);
  });

  testWidgets(
      'Should display the transaction feed feature when the Dashboard is opened',
      (tester) async {
    // ignore: missing_required_param
    await tester.pumpWidget(MaterialApp(home: Dashboard()));
    final transferfeedFeatureItem = find.byWidgetPredicate((widget) =>
        featureItemMatcher(widget, 'Transaction Feed', Icons.description));
    expect(transferfeedFeatureItem, findsOneWidget);
  });
}
