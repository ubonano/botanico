import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/company/company_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:get/get.dart';

import '../../worker_module.dart';

class WorkerLinkingController extends GetxController
    with FormController, LifeCycleLogging, GlobalServices, AuthenticationContext, WorkerContext, CompanyContext {
  @override
  String get logTag => 'WorkerLinkingController';

  @override
  List<String> formFields = ['uid'];

  @override
  Future<void> submit() async => await _linkWorker(getFieldValue('uid'));

  Future<void> _linkWorker(String workerId) async {
    await oprManager.perform(
      operationName: 'Link worker',
      permissionKey: WorkerModulePermissions.linkKey,
      successMessage: 'Trabajador vinculado',
      inTransaction: true,
      operation: (txn) async {
        final currentWorker = await workerRepo.fetch(currentUser!.uid);

        final worker = await workerRepo.get(workerId);
        final company = await companyRepo.get(currentWorker!.companyId);

        if (worker == null) throw WorkerNotFoundException();
        if (company == null) throw CompanyNotFoundException();

        final updatedWorker = worker.copyWith(companyId: company.uid, role: WorkerRole.employee);

        await workerRepo.updateWorker(updatedWorker, txn: txn);
        await workerRepo.createLinkedWorker(company.uid, updatedWorker, txn: txn);
      },
      onSuccess: navigate.toWorkerList,
    );
  }
}
