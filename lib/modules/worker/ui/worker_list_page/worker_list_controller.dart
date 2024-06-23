import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/company/module.dart';

import '../../setup/interfaces/i_worker_service.dart';

class WorkerListController extends GetxController
    with PaginatedListHelper<WorkerModel>, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'WorkerListController';

  late final IWorkerService _workerService = Get.find();
  late final ICompanyService _companyService = Get.find();

  WorkerModel? get currentWorker => _workerService.loggedWorker$;

  @override
  Future<void> onInit() async {
    await _workerService.fetchLoggedWorker();
    await _companyService.fetchLoggedCompany();

    super.onInit();
  }

  @override
  StreamSubscription<List<WorkerModel>>? initStream({
    required RxList<WorkerModel> list$,
    DocumentSnapshot? startAfter,
    required int limit,
    required Function(List<WorkerModel>) onNewData,
  }) =>
      _workerService.initStream(
        list$: list$,
        startAfter: startAfter,
        limit: limit,
        onNewData: onNewData,
      );
}
