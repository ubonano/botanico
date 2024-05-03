import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkerLinkPage extends GetView<WorkerLinkController> {
  const WorkerLinkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('WorkerLinkPage'),
      title: 'Vincular Trabajador',
      drawer: null,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(child: WorkerUidInputField(controller, onFieldSubmitted: controller.secureSubmit)),
                    WorkerPasteUidButton(),
                  ],
                ),
                const WorkerLinkButton(),
                const WorkerScanQrButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
