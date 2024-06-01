// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../module.dart';

void signUpNavigateSignInTest() {
  testWidgets('Navigate to sign in from sign up', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpNavigateFlow(tester);
    await signInNavigateFlow(tester);
    expect(find.byKey(const Key('SignInPage')), findsOneWidget);
  });
}