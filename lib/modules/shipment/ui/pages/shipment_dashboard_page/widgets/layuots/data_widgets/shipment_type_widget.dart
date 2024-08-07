import 'package:flutter/material.dart';

import '../../../../../../setup/model/shipment_model.dart';
import '../../../../../ui.dart';

class ShipmentTypeWidget extends StatelessWidget {
  final ShipmentModel shipment;

  const ShipmentTypeWidget(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return IconWithText(
      icon: shipmentTypeIcons[shipmentTypeFromString(shipment.type)]!,
      text: shipmentTypeLabels[shipmentTypeFromString(shipment.type)]!,
      iconColor: shipmentTypeToColor(shipmentTypeFromString(shipment.type)),
    );
  }
}
