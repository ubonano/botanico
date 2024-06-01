import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../module.dart';

abstract class IWorkerRepository {
  Future<WorkerModel?> get(String id);
  Future<void> createWorker(WorkerModel worker, {Transaction? txn});
  Future<void> createLinkedWorker(String companyId, WorkerModel worker, {Transaction? txn});
  Future<void> updateWorker(WorkerModel worker, {Transaction? txn});
  Future<void> updatePartialWorker(String workerId, Map<String, dynamic> changes, {Transaction? txn});
  Future<void> deleteLinkedWorker(String companyId, String workerId, {Transaction? txn});
  Stream<List<WorkerModel>> linkedWorkersStream(String companyId);
}