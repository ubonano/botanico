import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../app/content/helpers/global_helper.dart';
import 'content/setup/interfaces/i_worker_business_logic.dart';
import 'content/setup/interfaces/i_worker_service.dart';
import 'content/setup/permissions.dart';

class WorkerService with GlobalHelper implements IWorkerService {
  late final WorkerPermissions _module = Get.find();
  late final IWorkerBusinessLogic _workerBusinessLogic = Get.find();

  @override
  WorkerModel? get loggedWorker$ => _workerBusinessLogic.loggedWorker$;

  @override
  Future<WorkerModel?> fetchLoggedWorker() async => _workerBusinessLogic.fetchLoggedWorker();

  @override
  void clearCurrentWorker() => _workerBusinessLogic.clearLoggedWorker();

  @override
  Future<WorkerModel?> get(String id) async => await operation.perform(
        operationName: 'Get worker $id',
        module: _module,
        permissionKey: _module.viewKey,
        operation: (_) async => await _workerBusinessLogic.get(id),
      );

  @override
  Future<void> create(WorkerModel worker) async => await operation.perform(
        operationName: 'Create worker ${worker.uid}',
        operation: (_) async => await _workerBusinessLogic.create(worker),
      );

  @override
  Future<void> update(WorkerModel worker) async {
    await operation.perform(
      operationName: 'Update worker ${worker.uid}',
      operation: (_) async => await _workerBusinessLogic.update(worker),
    );
  }

  @override
  Future<void> link(String id) async => await operation.perform(
        operationName: 'Link worker $id',
        module: _module,
        permissionKey: _module.linkKey,
        inTransaction: true,
        operation: (txn) async => await _workerBusinessLogic.link(id, txn),
      );

  @override
  Future<void> unlink(String id) async => await operation.perform(
        operationName: 'Unlink worker $id',
        module: _module,
        permissionKey: _module.unlinkKey,
        inTransaction: true,
        operation: (txn) async => await _workerBusinessLogic.unlink(id, txn),
      );

  @override
  StreamSubscription<List<WorkerModel>>? initStream({
    required RxList<WorkerModel> list$,
    DocumentSnapshot? startAfter,
    int limit = 20,
    Function(List<WorkerModel>)? onNewData,
  }) =>
      _workerBusinessLogic.initStream(list$: list$, startAfter: startAfter, limit: limit, onNewData: onNewData);
}
