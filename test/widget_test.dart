import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sentimentapp/main.dart';
import 'package:sentimentapp/pages/error_page.dart';
import 'package:sentimentapp/pages/home_page.dart';
import 'package:sentimentapp/pages/result_page.dart';

void main() {
  //test if the home screen is renedered correctly

  testWidgets('HomePage renders title correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: HomePage(),
    ));

    expect(find.text('#Check the sentiment of your favourite subreddit!#'),
        findsOneWidget);
  });
}
