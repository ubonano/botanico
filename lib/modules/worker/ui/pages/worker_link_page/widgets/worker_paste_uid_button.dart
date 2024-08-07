import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../app/content/setup/fields_key.dart';
import '../../../ui.dart';

class WorkerPasteUidButton extends GetView<WorkerLinkController> {
  const WorkerPasteUidButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: key ?? const Key('WorkerPasteUidButton'),
      icon: const Icon(Icons.paste),
      onPressed: pasteWorkerId,
    );
  }

  void pasteWorkerId() async {
    final ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    controller.setFieldValue(FieldKeys.uid, data?.text ?? '');
  }
}
