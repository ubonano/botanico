import 'package:botanico/modules/foundation/config/routes.dart';
import 'package:get/get.dart';

import 'common_services.dart';

class NavigationService extends GetxService with CommonServices {
  void navigateToHome({bool canPop = false}) => navigateTo(Routes.HOME, canPop: canPop);
  void navigateToLobby({bool canPop = false}) => navigateTo(Routes.LOBBY, canPop: canPop);
  void navigateToSignIn({bool canPop = false}) => navigateTo(Routes.SIGN_IN, canPop: canPop);
  void navigateToSignUp({bool canPop = false}) => navigateTo(Routes.SIGN_UP, canPop: canPop);
  void navigateToUserProfile({bool canPop = false}) => navigateTo(Routes.USER_PROFILE, canPop: canPop);
  void navigateToCompanyProfile({bool canPop = false}) => navigateTo(Routes.COMPANY_PROFILE, canPop: canPop);

  void navigateTo(String route, {bool canPop = false}) {
    if (canPop) {
      Get.toNamed(route);
    } else {
      Get.offAllNamed(route);
    }
  }

  void goBack() => Get.back();
}