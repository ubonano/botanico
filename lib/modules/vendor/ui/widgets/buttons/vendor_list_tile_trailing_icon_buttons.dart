import 'package:flutter/material.dart';

import '../../../module.dart';

class VendorListTileTrailingIconButtons extends StatelessWidget {
  final VendorModel vendor;

  const VendorListTileTrailingIconButtons(this.vendor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        VendorDeleteIconButton(vendor),
      ],
    );
  }
}
