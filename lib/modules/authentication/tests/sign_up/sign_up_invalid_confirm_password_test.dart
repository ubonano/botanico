// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../authentication_module.dart';

void main() {
  testWidgets('Sign up with wrong password confirm', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, '', 'password123', 'password');
    expect(find.text('Las contraseñas no coinciden'), findsOneWidget);
  });
}
