import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:get/get.dart';

class SignOutController extends GetxController with LifeCycleLogging {
  @override
  String get logTag => 'SignOutController';

  late final OperationManagerService _oprManager = Get.find();
  late final AuthRepository _authRepo = Get.find();
  late final PostSignOutService _postSignOutService = Get.find();

  Future<void> submit() async => await _signOut();

  Future<void> _signOut() async {
    await _oprManager.perform(
      operationName: 'Sign out',
      operation: (_) async => await _authRepo.signOut(),
      onSuccess: _postSignOutService.handlePostSignOut,
    );
  }

  @override
  void dispose() {
    Get.delete<PostSignOutService>();

    super.dispose();
  }
}
