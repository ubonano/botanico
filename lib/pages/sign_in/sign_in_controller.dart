import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../utils/custom_controller.dart';

class SignInController extends GetxController with CustomController {
  @override
  String get logTag => 'SignInController';

  final signInFormKey = GlobalKey<FormState>();
  final recoverPasswordFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final emailRecoverController = TextEditingController();
  final passwordController = TextEditingController();

  String get _email => emailController.text.trim();
  String get _emailRecover => emailRecoverController.text.trim();
  String get _password => passwordController.text.trim();

  Future<void> signIn() async {
    if (!signInFormKey.currentState!.validate()) return;

    await async.perform(
      operationName: 'Sign in',
      operation: (_) async => await auth.signIn(_email, _password),
      onSuccess: () async {
        await fetchProfile();
        await fetchCompany();

        if (isProfileLoaded && isCompanyLoaded) {
          navigate.toHome();
        }

        if (isProfileLoaded && !isCompanyLoaded) {
          navigate.toLobby();
        }

        if (!isProfileLoaded) {
          navigate.toProfileCreate();
        }
      },
    );
  }

  void recoverPassword() async {
    if (!recoverPasswordFormKey.currentState!.validate()) return;

    await async.perform(
      operationName: 'Recover password',
      successMessage: 'Se envio un email a tu casilla para restaurar tu contraseña',
      operation: (_) => auth.recoverPassword(_emailRecover),
      onSuccess: navigate.back,
    );
  }

  void navigateToSignUp() => navigate.toSignUp();

  @override
  void onClose() {
    disposeControllers();

    super.onClose();
  }

  void disposeControllers() {
    emailController.dispose();
    emailRecoverController.dispose();
    passwordController.dispose();
  }
}
