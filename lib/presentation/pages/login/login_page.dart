import 'package:firebase_login/presentation/pages/login/widgets/login_card/login_page_form_card_widget.dart';
import 'package:firebase_login/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'controllers/login_controller.dart';
import 'widgets/login_page_background_gradient_widget.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.height,
          child: Stack(
            children: [
              const LoginPageBackgroundGradientWidget(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                        alignment: context.isPhone
                            ? Alignment.centerLeft
                            : Alignment.center,
                        child:
                            Image.asset('assets/images/logo.png', height: 25)),
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: context.isPhone
                          ? Alignment.centerLeft
                          : Alignment.center,
                      child: Text(
                        'Bem Vindo!',
                        style: Get.textTheme.headline6!.copyWith(
                            color: AppColors().normalWhiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: context.isPhone
                          ? Alignment.centerLeft
                          : Alignment.center,
                      child: Text(
                        'Aqui você gerencia seus seguros e de seus familiares em poucos cliques!',
                        style: Get.textTheme.bodyText1!.copyWith(
                            color: AppColors().normalWhiteColor,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    const Spacer(),
                    const LoginPageFormCardWidget(),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'tokio',
                          style: Get.textTheme.caption!
                              .copyWith(color: AppColors().normalWhiteColor),
                        ),
                        Text('resolve',
                            style: Get.textTheme.caption!
                                .copyWith(color: AppColors().normalYellowColor))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Acesse através das redes sociais',
                      style: Get.textTheme.caption!
                          .copyWith(color: AppColors().normalWhiteColor),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: FaIcon(
                                FontAwesomeIcons.google,
                                color: AppColors().normalWhiteColor,
                              )),
                          TextButton(
                              onPressed: () {},
                              child: FaIcon(
                                FontAwesomeIcons.facebookF,
                                color: AppColors().normalWhiteColor,
                              )),
                          TextButton(
                              onPressed: () {},
                              child: FaIcon(
                                FontAwesomeIcons.twitter,
                                color: AppColors().normalWhiteColor,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
