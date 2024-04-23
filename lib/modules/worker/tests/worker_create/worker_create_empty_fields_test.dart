// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/main.dart' as app;
import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(List<String> args) {
  testWidgets('Crear trabajador - validacion de campos vacios', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 2));

    await signUpFlow(tester, args[0], args[1], args[1]);

    final saveButton = find.byKey(const Key('saveWorkerButton'));

    await tester.tap(saveButton);
    await tester.pumpAndSettle();

    expect(find.text('Este campo es obligatorio'), findsNWidgets(4));
  });
}
