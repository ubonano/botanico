import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../../../../setup/interfaces/i_shipment_service.dart';

class ArchiveSlidableButton extends StatelessWidget {
  final ShipmentModel shipment;

  const ArchiveSlidableButton(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) async => await Get.find<IShipmentService>().archive(shipment),
      backgroundColor: Colors.grey,
      foregroundColor: Colors.white,
      icon: Icons.archive,
      label: 'Archivar',
    );
  }
}
