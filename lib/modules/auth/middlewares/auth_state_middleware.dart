import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../config/routes.dart';
import '../services/session_service.dart';

class AuthStateMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final SessionService sessionService = Get.find();

    // Si el usuario intenta acceder a SignIn o SignUp y ya está autenticado, redirigir a HOME
    if (sessionService.isUserLoggedIn &&
        (route == Routes.SIGN_IN || route == Routes.SIGN_UP)) {
      return const RouteSettings(name: Routes.HOME);
    }

    // Si el usuario intenta acceder a una página que requiere autenticación y no está autenticado, redirigir a SignIn
    if (!sessionService.isUserLoggedIn &&
        route != Routes.SIGN_IN &&
        route != Routes.SIGN_UP) {
      return const RouteSettings(name: Routes.SIGN_IN);
    }

    return null;
  }
}
