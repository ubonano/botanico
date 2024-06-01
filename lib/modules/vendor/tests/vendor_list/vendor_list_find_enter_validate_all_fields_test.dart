// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/vendor/module.dart';

void vendorListFindAndVerifyDetailsTest(String email, String password) {
  testWidgets('Create vendor, find by name, and verify details', (WidgetTester tester) async {
    String vendorName = 'Proveedor de prueba';
    String cuit = '201234567890';
    String registrationType = 'Monotributo';
    String address = 'Calle 123, 4567890';
    String phone = '1234567890';
    String observations = 'Observaciones de prueba';

    await appInitFlow(tester);
    await companyCreateFromSignUpFlow(tester, email, password);
    await openDrawerFlow(tester);
    await vendorListNavigateFlow(tester);

    await vendorCreateNavigateFlow(tester);
    await vendorFillDataFlow(tester,
        name: vendorName,
        cuit: cuit,
        registrationType: registrationType,
        address: address,
        phone: phone,
        observations: observations);
    await vendorSaveFlow(tester);

    await tester.pumpAndSettle();

    expect(find.text(vendorName), findsOneWidget);
    await tester.tap(find.text(vendorName));
    await tester.pumpAndSettle();

    expect(find.text(cuit), findsOneWidget);
    expect(find.text(registrationType), findsOneWidget);
    expect(find.text(address), findsOneWidget);
    expect(find.text(phone), findsOneWidget);
    expect(find.text(observations), findsOneWidget);
  });
}