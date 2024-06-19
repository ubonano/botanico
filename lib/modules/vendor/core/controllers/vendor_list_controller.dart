import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/worker/module.dart';

import '../../module.dart';

class VendorListController extends GetxController
    with PaginatedListHelper<VendorModel>, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'VendorListController';

  late final IVendorService _vendorService = Get.find();

  late final IWorkerService _workerService = Get.find();
  late final ICompanyService _companyService = Get.find();

  @override
  Future<void> onInit() async {
    await _workerService.fetchLoggedWorker();
    await _companyService.fetchLoggedCompany();

    super.onInit();
  }

  @override
  StreamSubscription<List<VendorModel>>? initStream({
    required RxList<VendorModel> list$,
    DocumentSnapshot? startAfter,
    required int limit,
    required Function(List<VendorModel>) onNewData,
  }) =>
      _vendorService.initStream(
        list$: list$,
        startAfter: startAfter,
        limit: limit,
        onNewData: onNewData,
      );
}
