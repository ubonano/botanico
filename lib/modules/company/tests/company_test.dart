// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/company/company_module.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:integration_test/integration_test.dart';

/* 

-To run execute:

flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=lib/modules/company/tests/company_test.dart \
  -d chrome

*/

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  _createCompanyFromSignUp();
}

// Crear test para crear company desde sign in
void _createCompanyFromSignUp() {
  createCompanyWithEmptyFieldsFromSignUpTest(generateRandomEmail(), 'password123');
  createCompanyWithInvalidPhoneFromSignUpTest(generateRandomEmail(), 'password123');
  createCompanySuccessFromSignUpTest(generateRandomEmail(), 'password123');
}
