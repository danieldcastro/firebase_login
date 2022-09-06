import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../theme/app_colors.dart';

class LoginPageCardTextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool obscureText;
  final TextInputAction textInputAction;
  final String? Function(String?) validator;
  final void Function(String)? onSubmit;
  const LoginPageCardTextFieldWidget(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.textInputType,
      required this.validator,
      this.onSubmit,
      this.obscureText = false,
      this.textInputAction = TextInputAction.next})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    InputBorder defaultBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(color: AppColors().normalWhiteColor, width: 1));
    return TextFormField(
        onFieldSubmitted: onSubmit,
        validator: validator,
        keyboardType: textInputType,
        textAlign: TextAlign.center,
        style: Get.textTheme.bodyText2!
            .copyWith(color: AppColors().normalWhiteColor),
        controller: controller,
        obscureText: obscureText,
        textInputAction: textInputAction,
        decoration: InputDecoration(
            errorMaxLines: 1,
            errorStyle: const TextStyle(fontSize: 0.1),
            border: defaultBorder,
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide:
                    BorderSide(color: AppColors().normalRedColor, width: 1)),
            enabledBorder: defaultBorder,
            focusedBorder: defaultBorder,
            filled: false,
            hintStyle: Get.textTheme.bodyText2!
                .copyWith(color: AppColors().normalWhiteColor),
            hintText: hintText,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 0)));
  }
}
