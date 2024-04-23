// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../authentication_module.dart';

void signUpSuccessTest(String email, String password) => main([email, password]);

void main(List<String> args) {
  testWidgets('Sign up success', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, args[0], args[1], args[1]);
    expect(find.byKey(const Key('WorkerCreatePage')), findsOneWidget);
  });
}
