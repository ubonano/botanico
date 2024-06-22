// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/vendor/module.dart';

void vendorCreateSuccessFromSignUpTest(String email, String password) {
  testWidgets('Create vendor success from sign up', (WidgetTester tester) async {
    await appInitFlow(tester);
    await companyCreateFromSignUpFlow(tester, email, password);
    await openDrawerFlow(tester);
    await vendorListNavigateFlow(tester);

    await vendorCreateNavigateFlow(tester);
    await vendorFillDataFlow(tester);
    await vendorSaveFlow(tester);

    expect(find.byKey(const Key('VendorListPage')), findsOneWidget);
  });
}
