import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../module.dart';

class ViaShipmentFormPage extends GetView<ViaShipmentFormController> {
  const ViaShipmentFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('ViaShipmentFormPage'),
      title: controller.isUpdateMode ? 'Via Shipment' : 'Create Via Shipment',
      actionButtons: controller.isUpdateMode ? const [ViaShipmentEnabledFormFields()] : [],
      drawer: null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: ShipmentIdInputField(controller)),
                  const ShipmentIdSearchButton(),
                  const SizedBox(width: 16.0),
                  Expanded(child: IsInvoicedInputField(controller)),
                ],
              ),
              CreatedDateTimeInputField(controller),
              Row(
                children: [
                  Expanded(child: StateInputField(controller)),
                  const SizedBox(width: 16.0),
                  Expanded(child: TypeInputField(controller)),
                ],
              ),
              Row(
                children: [
                  Expanded(child: ClientInputField(controller)),
                  const SizedBox(width: 16.0),
                  Expanded(child: DeliveryPlaceInputField(controller)),
                ],
              ),
              Row(
                children: [
                  Expanded(child: PackageInputField(controller)),
                  const SizedBox(width: 16.0),
                  Expanded(child: WeightInputField(controller)),
                ],
              ),
              DescriptionInputField(controller),
              const ViaShipmentSaveButton(),
            ],
          ),
        ),
      ),
    );
  }
}