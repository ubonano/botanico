import 'package:get/get.dart';
import '../services/loggin_service.dart';

mixin LogLifecycleController on GetxController {
  String get logTag;
  final LoggingService _loggingService = Get.find();

  @override
  void onInit() {
    super.onInit();

    _loggingService.debug('$logTag iniciado');
  }

  @override
  void onClose() {
    _loggingService.debug('$logTag eliminado');

    super.onClose();
  }
}

mixin LogLifecycleService on GetxService {
  String get logTag;
  final LoggingService _loggingService = Get.find();

  @override
  void onInit() {
    super.onInit();

    _loggingService.debug('$logTag iniciado');
  }

  @override
  void onClose() {
    _loggingService.debug('$logTag eliminado');

    super.onClose();
  }
}
