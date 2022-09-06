import 'package:firebase_login/core/services/firebase_auth_service.dart';
import 'package:firebase_login/domain/entities/user_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../../theme/app_colors.dart';

class LoginController extends GetxController {
  final FirebaseAuthService _firebaseAuthService =
      Get.find<FirebaseAuthService>();

  Rx<Color> cardFormLoginTitleColor = Get.theme.primaryColor.obs;
  Rx<Color> cardFormRegisterTitleColor = AppColors().normalWhiteColor.obs;

  final loginFormKey = GlobalKey<FormState>();
  final registerFormKey = GlobalKey<FormState>();

  UserEntity userEntity = UserEntity.empty();
  RxBool isLoading = false.obs;
  final pageViewController = PageController(
    initialPage: 0,
  );

  bool validEmail(String email) => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email);

  double getActualPage() {
    return (pageViewController.positions.isNotEmpty
            ? pageViewController.page
            : 0) ??
        0;
  }

  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  void goToLoginForm() {
    pageViewController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
    cardFormLoginTitleColor.value = Get.theme.primaryColor;
    cardFormRegisterTitleColor.value = AppColors().normalWhiteColor;
  }

  void goToRegisterForm() {
    pageViewController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
    cardFormLoginTitleColor.value = AppColors().normalWhiteColor;
    cardFormRegisterTitleColor.value = Get.theme.primaryColor;
  }

  void submitLoginForm() {
    if (loginFormKey.currentState!.validate()) {
      signInWithEmailAndPassword();
    }
  }

  void submitRegisterForm() {
    if (registerFormKey.currentState!.validate()) {
      createUserWithNameAndEmailAndPassword();
    }
  }

  void switchLoginOrRegisterSubmit() {
    if (pageViewController.page!.round() == 0) {
      submitLoginForm();
    } else {
      submitRegisterForm();
    }
  }

  Future<void> signInWithEmailAndPassword() async {
    isLoading.value = true;
    userEntity = await _firebaseAuthService.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    if (userEntity != UserEntity.empty()) {
      Get.offNamed(Routes.HOME, arguments: userEntity);
    }

    isLoading.value = false;
  }

  Future<void> createUserWithNameAndEmailAndPassword() async {
    isLoading.value = true;
    userEntity =
        await _firebaseAuthService.createUserWithNameAndEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
            userName: nameController.text);

    if (userEntity != UserEntity.empty()) {
      Get.offNamed(Routes.HOME, arguments: userEntity);
    }
    isLoading.value = false;
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
