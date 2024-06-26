import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../content/setup/interfaces/i_company_service.dart';
import '../../ui.dart';

class ModuleActiveToggle extends GetView<CompanyFormController> {
  final IPermissionsStructure module;

  const ModuleActiveToggle(this.module, {super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return CheckboxListTile(
          title: Text(module.name),
          value: Get.find<ICompanyService>().loggedCompany$?.hasModuleActive(module),
          onChanged: (bool? value) => controller.toggleModule(module),
        );
      },
    );
  }
}
