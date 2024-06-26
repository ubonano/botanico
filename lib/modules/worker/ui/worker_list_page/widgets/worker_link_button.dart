import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/ui/ui.dart';
import '../../ui.dart';

class WorkerLinkButton extends StatelessWidget {
  const WorkerLinkButton({super.key});

  @override
  Widget build(BuildContext context) {
    late final WorkerLinkController controller = Get.find();
    return CustomButton(
      key: key ?? const Key('WorkerLinkButton'),
      text: 'Vincular Trabajador',
      onPressed: controller.secureSubmit,
    );
  }
}
