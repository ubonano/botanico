import 'package:flutter/material.dart';

import '../../../module.dart';

class ViaShipmentListTileTrailingIconButtons extends StatelessWidget {
  final ViaShipmentModel viaShipment;

  const ViaShipmentListTileTrailingIconButtons(this.viaShipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ViaShipmentDeleteIconButton(viaShipment),
      ],
    );
  }
}