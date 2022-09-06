import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../theme/app_colors.dart';
import '../../controllers/login_controller.dart';
import 'form_page_view/login_page_card_login_form_widget.dart';
import 'form_page_view/login_page_card_register_form_widget.dart';
import 'login_page_card_form_switch_button_widget.dart';
import 'login_page_submit_form_button_widget.dart';

class LoginPageFormCardWidget extends GetView<LoginController> {
  const LoginPageFormCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: AppColors().darkBlueColor,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Obx(() => Row(
                        children: [
                          LoginPageCardFormSwitchButtonWidget(
                              onPressed: controller.goToLoginForm,
                              title: 'Entrar',
                              color: controller.cardFormLoginTitleColor.value),
                          const SizedBox(
                            width: 10,
                          ),
                          LoginPageCardFormSwitchButtonWidget(
                              onPressed: controller.goToRegisterForm,
                              title: 'Cadastrar',
                              color:
                                  controller.cardFormRegisterTitleColor.value),
                        ],
                      )),
                  SizedBox(
                    height: 200,
                    child: PageView(
                      controller: controller.pageViewController,
                      children: const [
                        LoginPageCardLoginFormWidget(),
                        LoginPageCardRegisterFormWidget()
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const LoginPageSubmitFormButtonWidget()
          ],
        ),
      ),
    );
  }
}
