import 'package:flutter/material.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../../module.dart';

class VendorUpdateIconButton extends StatelessWidget with NavigationHelperInstance {
  final VendorModel vendor;

  VendorUpdateIconButton(this.vendor, {super.key});

  @override
  Widget build(BuildContext context) {
    return ProtectedWidget(
      permission: VendorModulePermissions.updateKey,
      child: IconButton(
        key: key ?? const Key('VendorUpdateIconButton'),
        icon: const Icon(Icons.edit),
        onPressed: () => navigate.toVendorForm(id: vendor.uid, canPop: true),
      ),
    );
  }
}
