import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../theme/app_colors.dart';
import '../../controllers/login_controller.dart';

class LoginPageSubmitFormButtonWidget extends GetView<LoginController> {
  const LoginPageSubmitFormButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        bottom: -30,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: CircleAvatar(
            backgroundColor: AppColors().darkBlueColor,
            radius: 30,
            child: Ink(
              child: InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  controller.switchLoginOrRegisterSubmit();
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Get.theme.primaryColor,
                            AppColors().normalYellowColor
                          ],
                          begin: const Alignment(0, -1),
                          end: const Alignment(0, 1)),
                      borderRadius: BorderRadius.circular(100)),
                  child: Center(
                      child: Obx(() => Visibility(
                            visible: controller.isLoading.value,
                            replacement: Icon(
                              Icons.arrow_forward_rounded,
                              color: AppColors().normalWhiteColor,
                              size: 30,
                            ),
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: AppColors().normalWhiteColor,
                              ),
                            ),
                          ))),
                ),
              ),
            ),
          ),
        ));
  }
}
