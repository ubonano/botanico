// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/via_shipment/module.dart';

void viaShipmentCreateEmptyFieldsFromSignUpTest(String email, String password) {
  testWidgets('Create via shipment with empty fields', (WidgetTester tester) async {
    await appInitFlow(tester);

    await companyCreateFromSignUpFlow(tester, email, password);

    await openDrawerFlow(tester);
    await viaShipmentListNavigateFlow(tester);

    await viaShipmentCreateNavigateFlow(tester);

    await viaShipmentSaveFlow(tester);
    expect(find.text('Este campo es obligatorio'), findsNWidgets(6));
  });
}
