import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../../module.dart';

class DeleteSlidableButton extends GetView<ViaShipmentDeleteController> {
  final ViaShipmentModel viaShipment;

  const DeleteSlidableButton(this.viaShipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return ProtectedWidget(
      permission: ViaShipmentModulePermissions.deleteKey,
      child: SlidableAction(
        onPressed: (context) async => await controller.submit(viaShipment),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        icon: Icons.delete,
        label: 'Eliminar',
      ),
    );
  }
}