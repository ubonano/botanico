import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SnackbarHelper {
  void success(String message, {String title = 'Éxito', Duration? duration}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void error(String message, {String title = 'Error', Duration? duration}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void warning(String message, {String title = 'Advertencia', Duration? duration}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.orange,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void info(String message, {String title = 'Información', Duration? duration}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: duration,
    );
  }
}
