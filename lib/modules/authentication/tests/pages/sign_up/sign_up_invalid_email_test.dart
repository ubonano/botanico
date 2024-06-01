// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../module.dart';

void signUpInvalidEmailTest() {
  testWidgets('Sign up with invalid email', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, 'invalid-email', '', '');
    expect(find.text('Ingresa un email válido'), findsOneWidget);
  });
}