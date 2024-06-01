// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../module.dart';

void signInNavigateSignUpTest() {
  testWidgets('Navigate to sign up from sign in', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpNavigateFlow(tester);
    expect(find.byKey(const Key('SignUpPage')), findsOneWidget);
  });
}