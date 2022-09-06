import 'package:firebase_login/presentation/pages/initial/controllers/initial_controller.dart';
import 'package:get/get.dart';

class InitialPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitialController>(() => InitialController());
  }
}
