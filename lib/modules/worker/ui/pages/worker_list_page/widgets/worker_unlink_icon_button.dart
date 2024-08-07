import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/ui/ui.dart';
import '../../../../content/setup/interfaces/i_worker_service.dart';
import '../../../../content/setup/module.dart';

class WorkerUnlinkIconButton extends StatelessWidget {
  final WorkerModel worker;

  const WorkerUnlinkIconButton(this.worker, {super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<WorkerModule>();

    return ProtectedWidget(
      module: module,
      permission: WorkerKeys.unlink.id,
      child: IconButton(
        key: key ?? const Key('WorkerUnlinkIconButton'),
        icon: const Icon(Icons.person_off),
        onPressed: () => ConfirmationDialog.show(
          context,
          content: '¿Estás seguro de que quieres desvincular a este trabajador?',
          onConfirm: () => Get.find<IWorkerService>().unlink(worker.uid),
        ),
      ),
    );
  }
}
