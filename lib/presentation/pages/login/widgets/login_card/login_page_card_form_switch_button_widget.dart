import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/login_controller.dart';

class LoginPageCardFormSwitchButtonWidget extends GetView<LoginController> {
  final Function onPressed;
  final String title;
  final Color color;
  const LoginPageCardFormSwitchButtonWidget({
    required this.color,
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: color == Get.theme.primaryColor,
            replacement: Text(title,
                style: Get.textTheme.bodyText2!.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                )),
            child: Container(
              padding: const EdgeInsets.only(
                bottom: 3, // Space between underline and text
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Get.theme.primaryColor,
                width: 3, // Underline thickness
              ))),
              child: Text(title,
                  style: Get.textTheme.bodyText2!.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
