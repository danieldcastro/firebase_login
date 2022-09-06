import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';

class HomePageSectionTitleWidget extends StatelessWidget {
  final String title;
  const HomePageSectionTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Get.textTheme.headline6!.copyWith(
          color: AppColors().normalWhiteColor,
          fontWeight: FontWeight.w900,
          letterSpacing: 1),
    );
  }
}
