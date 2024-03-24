import 'package:get/get.dart';
import 'log_service.dart';

mixin CustomController on GetxController {
  String get logTag;

  late final LogService _log = Get.find();

  @override
  Future<void> onInit() async {
    super.onInit();
    _log.debug('+ $logTag initiated');
  }

  @override
  void onClose() {
    _log.debug('- $logTag destroyed');
    super.onClose();
  }
}
