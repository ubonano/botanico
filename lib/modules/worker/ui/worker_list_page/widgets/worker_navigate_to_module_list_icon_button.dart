import 'package:flutter/material.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:get/get.dart';

import '../../../model/worker_model.dart';
import '../../../setup/permissions.dart';

class WorkerNavigateToModuleListIconButton extends StatelessWidget with NavigationHelperInstance {
  final WorkerModel worker;

  WorkerNavigateToModuleListIconButton(this.worker, {super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<WorkerPermissions>();
    return ProtectedWidget(
      module: module,
      permission: module.managePermissionsKey,
      child: IconButton(
        key: key ?? const Key('WorkerNavigateToModuleListIconButton'),
        icon: const Icon(Icons.security),
        onPressed: () => navigate.toPermissions(worker.uid, canPop: true),
      ),
    );
  }
}
