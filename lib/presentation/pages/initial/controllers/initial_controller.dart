import 'package:firebase_login/domain/entities/user_entity.dart';
import 'package:get/get.dart';

import '../../../../core/services/firebase_auth_service.dart';
import '../../../routes/routes.dart';

class InitialController extends GetxController {
  final _user = Get.find<FirebaseAuthService>().getLoggedUser();

  void chooseInitialPage() {
    Future.delayed(const Duration(milliseconds: 500), () {
      _user == null || _user == UserEntity.empty()
          ? Get.offNamed(Routes.LOGIN)
          : Get.offNamed(Routes.HOME, arguments: _user);
    });
  }

  @override
  void onInit() {
    chooseInitialPage();
    super.onInit();
  }
}
