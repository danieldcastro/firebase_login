import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';

class HomePageCardMenuItemWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;
  const HomePageCardMenuItemWidget({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors().darkBlueColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FaIcon(
                  icon,
                  color: Get.theme.primaryColor,
                ),
                Text(title,
                    textAlign: TextAlign.center,
                    style: Get.textTheme.overline!.copyWith(
                        color: AppColors().normalWhiteColor, fontSize: 8)),
              ]),
        ),
      ),
    );
  }
}
