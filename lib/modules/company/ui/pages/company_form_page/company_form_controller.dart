import 'package:get/get.dart';

import '../../../../app/ui/ui.dart';
import '../../../../worker/content/setup/interfaces/i_worker_service.dart';
import '../../../../app/content/setup/fields_key.dart';
import '../../../../app/content/helpers/form_helper.dart';
import '../../../../app/content/helpers/global_helper.dart';
import '../../../../app/content/helpers/life_cycle_logging_controller_helper.dart';
import '../../../setup/interfaces/i_company_service.dart';

class CompanyFormController extends GetxController
    with FormHelper<CompanyModel>, GlobalHelper, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'CompanyFormController';

  late final ICompanyService _companyService = Get.find();
  late final IWorkerService _workerService = Get.find();

  @override
  List<String> formFields = [
    FieldKeys.name,
    FieldKeys.address,
    FieldKeys.city,
    FieldKeys.province,
    FieldKeys.country,
    FieldKeys.phone,
  ];

  @override
  Future<void> populateFormFields() async {
    modelForUpdate = await _companyService.get(modelId);

    if (modelForUpdate != null) {
      setFieldValue(FieldKeys.name, modelForUpdate!.name);
      setFieldValue(FieldKeys.address, modelForUpdate!.address);
      setFieldValue(FieldKeys.city, modelForUpdate!.city);
      setFieldValue(FieldKeys.province, modelForUpdate!.province);
      setFieldValue(FieldKeys.country, modelForUpdate!.country);
      setFieldValue(FieldKeys.phone, modelForUpdate!.phone);
    }
  }

  @override
  Future<void> submit() async {
    try {
      isUpdateMode ? await _companyService.update(buildModel()) : await _companyService.create(buildModel());

      await _workerService.fetchCurrentWorker();
      await _companyService.fetchCurrentCompany();

      HomePage.navigate();
    } catch (e) {
      logTag;
    }
  }

  @override
  CompanyModel buildModel() => CompanyModel(
        uid: isUpdateMode ? modelForUpdate!.uid : '',
        name: getFieldValue(FieldKeys.name),
        address: getFieldValue(FieldKeys.address),
        city: getFieldValue(FieldKeys.city),
        province: getFieldValue(FieldKeys.province),
        country: getFieldValue(FieldKeys.country),
        phone: getFieldValue(FieldKeys.phone),
      );

  Future<void> toggleModule(IModuleStructure module) async {
    if (modelForUpdate != null) {
      modelForUpdate!.toggleModule(module);
      await _companyService.update(modelForUpdate!);

      await _companyService.fetchCurrentCompany();
    }
  }
}
