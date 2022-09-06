import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';

class LoginPageBackgroundGradientWidget extends StatelessWidget {
  const LoginPageBackgroundGradientWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Get.theme.primaryColor,
              AppColors().normalYellowColor
            ])),
          ),
        ),
        Expanded(
          child: Container(
            color: AppColors().secondNormalBlackColor,
          ),
        )
      ],
    );
  }
}
