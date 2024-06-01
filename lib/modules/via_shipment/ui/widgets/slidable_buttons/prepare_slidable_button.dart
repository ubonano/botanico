import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../../module.dart';

class PrepareSlidableButton extends GetView<ViaShipmentStateController> {
  final ViaShipmentModel viaShipment;

  const PrepareSlidableButton(this.viaShipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return ProtectedWidget(
      permission: ViaShipmentModulePermissions.prepareKey,
      child: SlidableAction(
        onPressed: (context) async => await controller.prepare(viaShipment),
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.white,
        icon: Icons.check_circle,
        label: 'Lista',
      ),
    );
  }
}
