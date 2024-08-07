import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../../../../../app/content/helpers/snackbar_helper.dart';
import '../../../../../../setup/model/shipment_model.dart';
import '../../../../../ui.dart';

class DescriptionWidget extends StatelessWidget {
  final ShipmentModel shipment;

  const DescriptionWidget(this.shipment, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Clipboard.setData(ClipboardData(text: shipment.description));
        Get.find<SnackbarHelper>().info('Descripcion copiada!', duration: const Duration(seconds: 1));
      },
      child: IconWithText(icon: Icons.description, text: shipment.description),
    );
  }
}
