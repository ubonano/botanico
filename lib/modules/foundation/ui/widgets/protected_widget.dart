import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/worker/module.dart';

class ProtectedWidget extends StatelessWidget {
  final Widget child;
  final String permission;
  final ModuleModel module;

  const ProtectedWidget({required this.module, required this.permission, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Get.find<ICompanyService>().loggedCompany$?.hasModuleActive(module) == true &&
              Get.find<IWorkerService>().loggedWorker$?.hasPermission(permission) == true
          ? child
          : const SizedBox.shrink(),
    );
  }
}
