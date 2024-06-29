import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/ui/navigation.dart';
import '../../../../../app/ui/ui.dart';
import '../../../../content/setup/permissions.dart';

class WorkerListPageTileButton extends StatelessWidget with AppNavigationInstance {
  WorkerListPageTileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<WorkerPermissions>();

    return ProtectedWidget(
      key: key ?? const Key('WorkerListPageTileButton'),
      module: module,
      permission: module.viewKey,
      child: ListTile(
        leading: const Icon(Icons.work),
        title: const Text('Trabajadores'),
        onTap: navigate.toWorkerList,
      ),
    );
  }
}