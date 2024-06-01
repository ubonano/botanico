import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

class ModuleListController extends GetxController with LifeCycleLoggingControllerHelper, GlobalHelper {
  @override
  String get logTag => 'ModuleListController';

  late final ModuleRepository _moduleService = Get.find();

  List<ModuleModel> get modules$ => _moduleService.modules$;
}