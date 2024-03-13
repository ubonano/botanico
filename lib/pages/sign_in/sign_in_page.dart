import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/input_fields/email_input_field.dart';
import '../../widgets/input_fields/password_input_field.dart';
import 'sign_in_controller.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  Function signIn() => controller.signIn;
  Function toSignUp() => controller.signIn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar Sesión')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.signInFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmailInputField(
                controller: controller.emailController,
                onFieldSubmitted: signIn,
              ),
              PasswordInputField(
                controller: controller.passwordController,
                onFieldSubmitted: signIn,
              ),
              ElevatedButton(onPressed: signIn, child: const Text('Iniciar Sesión')),
              const SizedBox(height: 20),
              TextButton(onPressed: _showRecoverPasswordDialog, child: const Text("¿Olvidaste tu contraseña?")),
              const SizedBox(height: 20),
              TextButton(onPressed: toSignUp, child: const Text('¿No tenes cuenta? Crear nueva cuenta')),
            ],
          ),
        ),
      ),
    );
  }

  void _showRecoverPasswordDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text("Recuperar contraseña"),
        content: Form(
          key: controller.recoverPasswordFormKey,
          child: EmailInputField(
            controller: controller.emailRecoverController,
            onFieldSubmitted: signIn,
          ),
        ),
        actions: [
          TextButton(onPressed: controller.recoverPassword, child: const Text("Enviar")),
        ],
      ),
    );
  }
}
