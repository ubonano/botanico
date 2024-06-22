import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/company/module.dart';

import '../../module.dart';

class WorkerListPage extends GetView<WorkerListController> {
  const WorkerListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('workerListPage'),
      title: 'Trabajadores Vinculados',
      drawer: CustomDrawer(),
      body: Obx(() => WorkerList(controller.list$.toList())),
      floatingActionButton: WorkerLinkFAB(),
    );
  }
}
