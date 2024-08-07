import 'package:get/get.dart';

import '../../../../app/content/setup/fields_key.dart';
import '../../../../app/content/helpers/form_helper.dart';
import '../../../../app/content/helpers/global_helper.dart';
import '../../../../app/content/helpers/life_cycle_logging_controller_helper.dart';
import '../../../setup/interfaces/i_vendor_service.dart';

class VendorFormController extends GetxController
    with FormHelper<VendorModel>, GlobalHelper, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'VendorFormController';

  late final IVendorService _vendorService = Get.find();

  var registrationType = ''.obs;

  @override
  List<String> formFields = [
    FieldKeys.name,
    FieldKeys.cuit,
    FieldKeys.address,
    FieldKeys.phone,
    FieldKeys.observations,
  ];

  @override
  Future<void> populateFormFields() async {
    modelForUpdate = await _vendorService.get(modelId);

    if (modelForUpdate != null) {
      setFieldValue(FieldKeys.name, modelForUpdate!.name);
      setFieldValue(FieldKeys.cuit, modelForUpdate!.cuit);
      registrationType.value = modelForUpdate!.registrationType;
      setFieldValue(FieldKeys.address, modelForUpdate!.address);
      setFieldValue(FieldKeys.phone, modelForUpdate!.phone);
      setFieldValue(FieldKeys.observations, modelForUpdate!.observations);
    }
  }

  @override
  Future<void> submit() async {
    try {
      isUpdateMode ? await _vendorService.update(buildModel()) : await _vendorService.create(buildModel());
      Get.back();
    } catch (e) {
      logTag;
    }
  }

  @override
  VendorModel buildModel() => VendorModel(
        uid: isUpdateMode ? modelForUpdate!.uid : '',
        name: getFieldValue(FieldKeys.name),
        cuit: getFieldValue(FieldKeys.cuit),
        registrationType: registrationType.value,
        address: getFieldValue(FieldKeys.address),
        phone: getFieldValue(FieldKeys.phone),
        observations: getFieldValue(FieldKeys.observations),
      );
}
