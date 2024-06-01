import 'package:flutter/material.dart';
import '../../module.dart';

class StateTag extends StatelessWidget {
  final int state;

  const StateTag({
    required this.state,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shipmentState = ViaShipmentState.values[state];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        decoration: BoxDecoration(
          color: viaShipmentStateToColor(shipmentState),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Center(
          child: Text(
            viaShipmentStateLabels[shipmentState]!,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
