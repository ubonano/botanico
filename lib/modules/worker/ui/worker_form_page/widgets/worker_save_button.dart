import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/ui/ui.dart';
import '../../ui.dart';

class WorkerSaveButton extends GetView<WorkerFormController> {
  const WorkerSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      key: key ?? const Key('WorkerSaveButton'),
      text: 'Guardar Perfil',
      onPressed: controller.secureSubmit,
    );
  }
}
