import 'package:flutter/material.dart';

import '../../../../module.dart';

class ViaShipmentDashboardLayoutSmallTile extends StatelessWidget {
  final ViaShipmentModel shipment;
  final Animation<Color?> colorAnimation;

  const ViaShipmentDashboardLayoutSmallTile(this.shipment, this.colorAnimation, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(child: ShipmentIdWidget(shipment)),
            Flexible(child: ShipmentTypeWidget(shipment)),
          ],
        ),
        ClientWidget(shipment),
        DescriptionWidget(shipment),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(child: InvoicedWidget(shipment)),
            Flexible(child: PackageWidget(shipment)),
            Flexible(child: WeightWidget(shipment)),
            Flexible(child: DeliveryPlaceWidget(shipment)),
          ],
        ),
        StateWidget(shipment),
      ],
    );
  }
}