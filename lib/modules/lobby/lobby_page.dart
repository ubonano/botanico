import 'package:botanico/modules/auth/sign_out/sign_out_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'lobby_controller.dart';

class LobbyPage extends GetView<LobbyController> {
  const LobbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lobby"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => QrImageView(
                data: controller.uid.value,
                version: QrVersions.auto,
                size: 200.0,
              ),
            ),
            const SizedBox(height: 20),
            const Text('Muestra este código a tu empleador para vincularte a la empresa.'),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: controller.copyToClipboard, child: const Text('Copiar código de vinculación')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.navigateToCompany,
              child: const Text('¿Necesitas registrar una empresa?'),
            ),
            const SizedBox(height: 20),
            const SignOutButton(),
          ],
        ),
      ),
    );
  }
}
