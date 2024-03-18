import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/custom_controller.dart';

class LobbyController extends GetxController with CustomController {
  @override
  String get logTag => 'LobbyController';

  final RxString uid = ''.obs;

  @override
  Future<void> onInit() async {
    await super.onInit();

    uid.value = loggedUserUID;
  }

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: uid.value)).then(
      (_) => Get.snackbar('Éxito', 'Codigo de vinculación copiado al portapapeles'),
    );
  }

  void navigateToCompany() => navigate.toCompany();
}
