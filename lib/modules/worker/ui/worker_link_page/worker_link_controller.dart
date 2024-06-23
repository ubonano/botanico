import 'package:get/get.dart';

import '../../../app/setup/fields_key.dart';
import '../../../app/helpers/form_helper.dart';
import '../../../app/setup/global_helper.dart';
import '../../../app/helpers/life_cycle_logging_controller_helper.dart';
import '../../setup/interfaces/i_worker_service.dart';

class WorkerLinkController extends GetxController with GlobalHelper, FormHelper, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'WorkerLinkController';

  late final IWorkerService _workerService = Get.find();

  @override
  List<String> formFields = [FieldKeys.uid];

  @override
  Future<void> submit() async {
    try {
      await _workerService.link(getFieldValue(FieldKeys.uid));

      navigate.back();
    } catch (e) {
      logTag;
    }
  }
}
