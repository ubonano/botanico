import 'package:flutter/material.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:get/get.dart';

import '../../../setup/permissions.dart';

class ViaShipmentCreateFAB extends StatelessWidget with NavigationHelperInstance {
  ViaShipmentCreateFAB({super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<ViaShipmentPermissions>();

    return ProtectedWidget(
      module: module,
      permission: module.createKey,
      child: FloatingActionButton(
        key: key ?? const Key('ViaShipmentCreateFAB'),
        onPressed: () => navigate.toViaShipmentForm(canPop: true),
        child: const Icon(Icons.add),
      ),
    );
  }
}
