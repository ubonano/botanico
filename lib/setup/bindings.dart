// ignore_for_file: library_prefixes

import 'package:botanico/modules/authentication/module.dart' as auth;
import 'package:botanico/modules/company/module.dart' as company;
import 'package:botanico/modules/foundation/module.dart' as foundation;
import 'package:botanico/modules/worker/module.dart' as worker;
import 'package:botanico/modules/vendor/module.dart' as vendor;
import 'package:botanico/modules/accounting_account/module.dart' as accountingAccount;
import 'package:botanico/modules/via_shipment/module.dart' as viaShipment;

import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    auth.dependencies();
    worker.dependencies();
    company.dependencies();
    foundation.dependencies();
    vendor.dependencies();
    accountingAccount.dependencies();
    viaShipment.dependencies();
  }
}