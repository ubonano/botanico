import 'package:botanico/pages/recover_password/recover_password_dialog.dart';
import 'package:botanico/widgets/buttons/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/buttons/custom_button.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/input_fields/email_input_field.dart';
import '../../widgets/input_fields/password_input_field.dart';
import 'sign_in_controller.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  get _formKey => controller.formKey;

  get _emailCtrl => controller.textCtrls[0];
  get _passwordCtrl => controller.textCtrls[1];

  void _submit() => controller.submit();
  void _toSignUp() => controller.navigateToSignUp();
  void _showRecoverPasswordDialog() => Get.dialog(const RecoverPasswordDialog());

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Iniciar Sesión',
      drawer: null,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmailInputField(controller: _emailCtrl, onFieldSubmitted: _submit),
              PasswordInputField(controller: _passwordCtrl, onFieldSubmitted: _submit),
              CustomButton(text: 'Iniciar Sesión', onPressed: _submit),
              CustomTextButton(text: '¿Olvidaste tu contraseña', onPressed: _showRecoverPasswordDialog),
              CustomTextButton(text: '¿No tenes cuenta? Crear nueva cuenta', onPressed: _toSignUp),
            ],
          ),
        ),
      ),
    );
  }
}
