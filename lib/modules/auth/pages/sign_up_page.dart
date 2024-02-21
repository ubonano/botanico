import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../foundation/utils/validator.dart';
import '../../foundation/widgets/custom_input_field.dart';
import '../controllers/sign_up_controller.dart';

class SignUpPage extends GetView<SignUpPageController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomInputField(
                label: 'Email',
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: Validator.emailValidator,
              ),
              const SizedBox(height: 10),
              CustomInputField(
                label: 'Contraseña',
                controller: controller.passwordController,
                obscureText: true,
                validator: Validator.passwordValidator,
              ),
              const SizedBox(height: 10),
              CustomInputField(
                label: 'Confirmar Contraseña',
                controller: controller.confirmPasswordController,
                obscureText: true,
                validator: (value) => Validator.confirmPasswordValidator(
                    value, controller.passwordController.text),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    controller.signUp();
                  }
                },
                child: const Text('Registrar'),
              ),
              TextButton(
                onPressed: controller.navigateToLogin,
                child: const Text('¿Ya teenes cuenta? Inicia sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
