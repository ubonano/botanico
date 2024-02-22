import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../session/services/session_service.dart';
import '../../session/controllers/user_profile_controller.dart';
import '../services/navigation_service.dart';

class HomePage extends StatelessWidget {
  final SessionService sessionService = Get.find();
  final UserProfileController userProfileController = Get.find();
  final NavigationService navigationService = Get.find();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sessionService.fetchUserProfile();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () {
                final userProfile = sessionService.userProfileObx.value;
                return userProfile != null
                    ? Column(
                        children: [
                          Text("UID: ${userProfile.uid}"),
                          Text("Email: ${userProfile.email}"),
                          Text("Nombre: ${userProfile.name}"),
                          Text("Fecha de Nacimiento: ${userProfile.birthDate}"),
                          Text("Teléfono: ${userProfile.phone}"),
                          Text("DNI: ${userProfile.dni}"),
                        ],
                      )
                    : const Text("Cargando perfil...");
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  navigationService.navigateToUserProfile(canPop: true),
              child: const Text("Perfil del Usuario"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await sessionService.signOut();
                navigationService.navigateToLogin();
              },
              child: const Text("Cerrar Sesión"),
            ),
          ],
        ),
      ),
    );
  }
}
