import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/company/module.dart';

import '../module.dart';

class VendorUpdatePage extends GetView<VendorUpdateController> {
  const VendorUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('VendorUpdatePage'),
      title: 'Proveedor',
      drawer: null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              NameInputField(controller),
              AddressInputField(controller),
              PhoneInputField(controller),
              ObservationsInputField(controller),
              VendorSaveButton(controller),
            ],
          ),
        ),
      ),
    );
  }
}
