import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../module.dart';

class WorkerPermissionToggle extends GetView<WorkerPermissionToggleController> {
  final WorkerPermissionModel permission;

  const WorkerPermissionToggle(this.permission, {super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return CheckboxListTile(
          title: Text(permission.name),
          value: controller.worker$?.permissions[permission.id] ?? false,
          onChanged: (bool? value) => controller.togglePermission(permission.id),
        );
      },
    );
  }
}
