// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';

import '../../../../app/content/tests/flows/app_init_flow.dart';
import '../../../../company/setup/tests/flows/company_create_from_sign_up_flow.dart';
import '../../../../company/setup/tests/flows/open_drawer_flow.dart';
import '../flows/accounting_account_create_navigate_flow.dart';
import '../flows/accounting_account_fill_data_flow.dart';
import '../flows/accounting_account_list_navigate_flow.dart';
import '../flows/accounting_account_save_flow.dart';

void accountingAccountListFindAndVerifyDetailsTest(String email, String password) {
  testWidgets('Create accounting account, find by name, and verify details', (WidgetTester tester) async {
    String accountingAccountName = 'Cuenta Contable de prueba';
    String observations = 'Observaciones de prueba';

    await appInitFlow(tester);
    await companyCreateFromSignUpFlow(tester, email, password);
    await openDrawerFlow(tester);
    await accountingAccountListNavigateFlow(tester);

    await accountingAccountCreateNavigateFlow(tester);
    await accountingAccountFillDataFlow(
      tester,
      name: accountingAccountName,
      observations: observations,
    );
    await accountingAccountSaveFlow(tester);

    await tester.pumpAndSettle();

    expect(find.text(accountingAccountName), findsOneWidget);
    await tester.tap(find.text(accountingAccountName));
    await tester.pumpAndSettle();

    expect(find.text(observations), findsOneWidget);
  });
}
