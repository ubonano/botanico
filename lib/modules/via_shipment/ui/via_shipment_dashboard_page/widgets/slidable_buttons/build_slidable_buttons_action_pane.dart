import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/worker/module.dart';

import '../../../../model/via_shipment_model.dart';
import '../../../../setup/permissions.dart';
import '../../../ui.dart';

final _module = Get.find<ViaShipmentPermissions>();

List<Widget> buildSlidableLeftButtonsActionPane(ViaShipmentModel shipment) {
  List<Widget> buttons = [];

  if (shipment.isNotInvoiced && _hasPermission(_module.invoiceKey)) {
    buttons.add(InvoiceSlidableButton(shipment));
  }
  if (shipment.isInvoiced && _hasPermission(_module.cancelInvoiceKey)) {
    buttons.add(CancelInvoiceSlidableButton(shipment));
  }
  if (_hasPermission(_module.changeDeliveryPlaceKey)) {
    buttons.add(ChangeDeliveryPlaceSlidableButton(shipment));
  }
  if (_hasPermission(_module.updateKey)) {
    buttons.add(EditSlidableButton(shipment));
  }
  if (_hasPermission(_module.deleteKey)) {
    buttons.add(DeleteSlidableButton(shipment));
  }
  return buttons;
}

List<Widget> buildSlidableRightButtonsActionPane(ViaShipmentModel shipment) {
  List<Widget> buttons = [];

  if (_hasPermission(_module.changeStateKey)) {
    buttons.add(ChangeStateSlidableButton(shipment));
  }

  if (shipment.isPending && _hasPermission(_module.processKey)) {
    buttons.add(ProcessSlidableButton(shipment));
  }
  if (shipment.isInProcess && _hasPermission(_module.prepareKey)) {
    buttons.add(PrepareSlidableButton(shipment));
  }
  if (shipment.isReady && _hasPermission(_module.deliverKey)) {
    buttons.add(DeliverSlidableButton(shipment));
  }
  if (shipment.isDelivered && _hasPermission(_module.archiveKey)) {
    buttons.add(ArchiveSlidableButton(shipment));
  }

  return buttons;
}

bool _hasPermission(String permission) => Get.find<IWorkerService>().loggedWorker$?.hasPermission(permission) ?? false;
