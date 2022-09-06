import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/util/global_show_snackbar_function.dart';
import '../../../../../theme/app_colors.dart';
import '../../../controllers/login_controller.dart';
import 'login_page_card_text_field_widget.dart';

class LoginPageCardRegisterFormWidget extends GetView<LoginController> {
  const LoginPageCardRegisterFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.registerFormKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        LoginPageCardTextFieldWidget(
            hintText: 'Nome',
            obscureText: false,
            controller: controller.nameController,
            textInputType: TextInputType.text,
            validator: (value) {
              if (value!.isEmpty || value.length < 3) {
                GlobalShowSnackbarFunction().show(
                    'O nome precisa ter pelo menos 3 caracteres',
                    color: AppColors().normalRedColor);
                return 'O nome precisa ter pelo menos 3 caracteres';
              }
              return null;
            }),
        const SizedBox(
          height: 10,
        ),
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
      ]),
    );
  }
}
