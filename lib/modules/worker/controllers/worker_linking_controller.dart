import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/company/company_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:get/get.dart';

import '../worker_module.dart';

class WorkerLinkingController extends GetxController with FormController, LifeCycleLogging {
  @override
  String get logTag => 'WorkerLinkingController';

  late final OperationManagerService _oprManager = Get.find();

  @override
  List<String> formFields = ['uid'];

  late final NavigationService _navigate = Get.find();
  late final AuthRepository _authRepo = Get.find();
  late final WorkerRepository _workerRepo = Get.find();
  late final CompanyRepository _companyRepo = Get.find();

  @override
  Future<void> submit() async => await _linkWorker(getFieldValue('uid'));

  Future<void> _linkWorker(String workerId) async {
    await _oprManager.perform(
      operationName: 'Link worker',
      permissionKey: WorkerModulePermissions.linkKey,
      successMessage: 'Trabajador vinculado',
      inTransaction: true,
      operation: (txn) async {
        final currentWorker = await _workerRepo.fetch(_authRepo.user!.uid);

        final worker = await _workerRepo.get(workerId);
        final company = await _companyRepo.get(currentWorker!.companyId);

        if (worker == null) throw WorkerNotFoundException();
        if (company == null) throw CompanyNotFoundException();

        final updatedWorker = worker.copyWith(companyId: company.uid, role: WorkerRole.employee);

        await _workerRepo.updateWorker(updatedWorker, txn: txn);
        await _workerRepo.createLinkedWorker(company.uid, updatedWorker, txn: txn);
      },
      onSuccess: _navigate.toWorkerList,
    );
  }
}
