import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/worker/module.dart';

import '../../module.dart';

class AccountingAccountListController extends GetxController
    with PaginatedListHelper<AccountingAccountModel>, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'AccountingAccountListController';

  late final IAccountingAccountService _accountingAccountService = Get.find();

  late final IWorkerService _workerService = Get.find();
  late final ICompanyService _companyService = Get.find();

  @override
  Future<void> onInit() async {
    await _workerService.fetchLoggedWorker();
    await _companyService.fetchLoggedCompany();

    super.onInit();
  }

  @override
  StreamSubscription<List<AccountingAccountModel>>? initializeStream({
    required RxList<AccountingAccountModel> list$,
    DocumentSnapshot? startAfter,
    required int limit,
    required Function(List<AccountingAccountModel>) onNewData,
  }) =>
      _accountingAccountService.initializeStream(
        list$: list$,
        startAfter: startAfter,
        limit: limit,
        onNewData: onNewData,
      );
}
