import 'package:botanico/services/loggin_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../services/navigation_service.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final NavigationService _navigationService;
  final LoggingService _loggingService;

  AuthController({
    required FirebaseAuth auth,
    required GoogleSignIn googleSignIn,
    required NavigationService navigationService,
    required LoggingService loggingService,
  })  : _auth = auth,
        _googleSignIn = googleSignIn,
        _navigationService = navigationService,
        _loggingService = loggingService;

  User? getLoggedInUser() => _auth.currentUser;

  Future<User?> _authOperation(Future<UserCredential> Function() operation,
      String successLog, String errorLog) async {
    try {
      final UserCredential userCredential = await operation();
      _loggingService.logInfo(
          '$successLog: UID=${userCredential.user?.uid}, Email=${userCredential.user?.email}');

      _navigationService.navigateToHome();

      return userCredential.user;
    } catch (e) {
      _loggingService.logError('$errorLog: ${e.toString()}');
      Get.snackbar('Error', _getErrorMessage(e));
      return null;
    }
  }

  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    return _authOperation(
      () => _auth.createUserWithEmailAndPassword(
          email: email, password: password),
      'Registro exitoso',
      'Error al registrar',
    );
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    return _authOperation(
      () => _auth.signInWithEmailAndPassword(email: email, password: password),
      'Inicio de sesión exitoso',
      'Error al iniciar sesión',
    );
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      return _authOperation(
        () => _auth.signInWithCredential(GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        )),
        'Inicio de sesión con Google exitoso',
        'Error al iniciar sesión con Google',
      );
    } catch (e) {
      _loggingService
          .logError('Error al iniciar sesión con Google: ${e.toString()}');
      Get.snackbar('Error al iniciar sesión con Google', _getErrorMessage(e));
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      _loggingService.logInfo('Cierre de sesión exitoso');
      _navigationService.navigateToLogin();
    } catch (e) {
      _loggingService.logError('Error al cerrar sesión: ${e.toString()}');
      Get.snackbar('Error al cerrar sesión',
          'No se pudo cerrar sesión correctamente. Inténtalo de nuevo.');
    }
  }

  String _getErrorMessage(Object e) {
    if (e is FirebaseAuthException) {
      if (e.message!.contains('email-already-in-use')) {
        return 'El email ya está en uso por otra cuenta.';
      } else if (e.message!.contains('user-not-found')) {
        return 'No se encontró usuario con este email.';
      } else if (e.message!.contains('wrong-password')) {
        return 'La contraseña es incorrecta.';
      } else if (e.message!.contains('user-disabled')) {
        return 'El usuario ha sido deshabilitado.';
      } else if (e.message!.contains('too-many-requests')) {
        return 'Demasiadas solicitudes. Por favor, intenta de nuevo más tarde.';
      } else if (e.message!.contains('operation-not-allowed')) {
        return 'La operación no está permitida.';
      } else if (e.message!
          .contains('account-exists-with-different-credential')) {
        return 'Ya existe una cuenta con el mismo email pero diferentes credenciales de inicio de sesión.';
      } else if (e.message!.contains('invalid-credential')) {
        return 'Credencial inválida proporcionada para iniciar sesión.';
      } else if (e.message!.contains('weak-password')) {
        return 'La contraseña es demasiado débil. Por favor, elige una contraseña más fuerte.';
      } else if (e.message!.contains('invalid-email')) {
        return 'El email proporcionado no es válido.';
      }
    }
    return 'Ocurrió un error desconocido. Por favor, inténtalo de nuevo más tarde.';
  }
}
