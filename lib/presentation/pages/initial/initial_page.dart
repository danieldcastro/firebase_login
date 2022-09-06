import 'package:firebase_login/presentation/pages/initial/controllers/initial_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitialPage extends GetView<InitialController> {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.chooseInitialPage();
    return Scaffold(
      backgroundColor: Get.theme.primaryColor,
      body: Center(
          child: Image.asset(
        'assets/images/logo.png',
        height: 50,
      )),
    );
  }
}
