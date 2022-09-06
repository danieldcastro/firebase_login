import 'package:firebase_login/core/util/global_show_snackbar_function.dart';
import 'package:firebase_login/presentation/pages/login/widgets/login_card/form_page_view/login_page_card_text_field_widget.dart';
import 'package:firebase_login/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/login_controller.dart';

class LoginPageCardLoginFormWidget extends GetView<LoginController> {
  const LoginPageCardLoginFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Form(
          key: controller.loginFormKey,
          child: Column(children: [
            LoginPageCardTextFieldWidget(
                hintText: 'Email',
                controller: controller.emailController,
                textInputType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isNotEmpty && controller.validEmail(value)) {
                    return null;
                  }
                  GlobalShowSnackbarFunction().show('Não esqueça do email',
                      color: AppColors().normalRedColor);
                  return 'Não esqueça do email';
                }),
            const SizedBox(
              height: 10,
            ),
            LoginPageCardTextFieldWidget(
                hintText: 'Senha',
                obscureText: true,
                controller: controller.passwordController,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onSubmit: (value) => controller.switchLoginOrRegisterSubmit(),
                validator: (value) {
                  if (value!.isEmpty || value.length < 6) {
                    GlobalShowSnackbarFunction().show(
                        'A senha precisa ter pelo menos 6 caracteres',
                        color: AppColors().normalRedColor);
                    return 'A senha precisa ter pelo menos 6 caracteres';
                  }
                  return null;
                }),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: true,
                      onChanged: (tapped) {},
                      activeColor: Get.theme.primaryColor,
                    ),
                    Text(
                      'Lembrar Sempre',
                      style: Get.textTheme.caption!
                          .copyWith(color: AppColors().normalWhiteColor),
                    ),
                  ],
                ),
                TextButton(
                  child: Text(
                    'Esqueceu a senha?',
                    style: Get.textTheme.caption!
                        .copyWith(color: Get.theme.primaryColor),
                  ),
                  onPressed: () {},
                )
              ],
            )
          ]),
        )
      ],
    );
  }
}
