import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/company/module.dart';

import '../../../module.dart';

class ViaShipmentEnabledFormFields extends GetView<ViaShipmentFormController> {
  const ViaShipmentEnabledFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return ProtectedWidget(
      module: ViaShipmentModule(),
      permission: ViaShipmentModule.updateKey,
      child: IconButton(
        key: key ?? const Key('ViaShipmentEnabledFormFields'),
        icon: const Icon(Icons.edit),
        onPressed: () => controller.isFieldsEnabled.value = !controller.isFieldsEnabled.value,
      ),
    );
  }
}
