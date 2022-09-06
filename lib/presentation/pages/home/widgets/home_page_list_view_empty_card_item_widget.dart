import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';

class HomePageListViewEmptyCardItemWidget extends StatelessWidget {
  final String message;
  final IconData icon;
  final void Function()? onTap;
  const HomePageListViewEmptyCardItemWidget({
    Key? key,
    required this.message,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: AppColors().darkBlueColor,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(5),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    icon,
                    color: AppColors().normalWhiteColor,
                    size: 35,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: Get.textTheme.caption!
                        .copyWith(color: AppColors().normalWhiteColor),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
