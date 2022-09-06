import 'package:firebase_login/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'controllers/home_controller.dart';
import 'widgets/home_page_card_menu_item_widget.dart';
import 'widgets/home_page_list_view_empty_card_item_widget.dart';
import 'widgets/home_page_section_title_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().secondNormalBlackColor,
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo.png',
          height: 25,
        ),
        toolbarHeight: 45,
        elevation: 0,
        backgroundColor: AppColors().secondNormalBlackColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              onTap: controller.signOut,
              child: Icon(
                Icons.exit_to_app_outlined,
                color: AppColors().normalWhiteColor,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Get.theme.primaryColor,
              AppColors().normalYellowColor
            ])),
            child: Row(children: [
              CircleAvatar(
                backgroundColor: AppColors().normalWhiteColor,
                child: FaIcon(
                  FontAwesomeIcons.userTie,
                  color: AppColors().primarySwatch,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bem-vindo',
                    style: Get.textTheme.overline!.copyWith(
                        color: AppColors().normalWhiteColor.withOpacity(.7),
                        fontWeight: FontWeight.w100),
                  ),
                  Text(controller.formatUserName(),
                      style: Get.textTheme.bodyText2!
                          .copyWith(color: AppColors().normalWhiteColor)),
                ],
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const HomePageSectionTitleWidget(
                title: 'Cotar e Contratar',
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    HomePageCardMenuItemWidget(
                      icon: FontAwesomeIcons.carSide,
                      title: 'Automóvel',
                      onTap: () {
                        controller.openWebView();
                      },
                    ),
                    HomePageCardMenuItemWidget(
                      icon: FontAwesomeIcons.house,
                      title: 'Residência',
                      onTap: () {},
                    ),
                    HomePageCardMenuItemWidget(
                      icon: FontAwesomeIcons.heartPulse,
                      title: 'Vida',
                      onTap: () {},
                    ),
                    HomePageCardMenuItemWidget(
                      icon: FontAwesomeIcons.crutch,
                      title: 'Acidentes\nPessoais',
                      onTap: () {},
                    ),
                    HomePageCardMenuItemWidget(
                      icon: FontAwesomeIcons.motorcycle,
                      title: 'Moto',
                      onTap: () {},
                    ),
                    HomePageCardMenuItemWidget(
                      icon: FontAwesomeIcons.solidBuilding,
                      title: 'Empresa',
                      onTap: () {},
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const HomePageSectionTitleWidget(
                title: 'Minha Família',
              ),
              const SizedBox(
                height: 5,
              ),
              HomePageListViewEmptyCardItemWidget(
                icon: Icons.add_circle_outline_rounded,
                message:
                    'Adicione aqui membros da sua família e compartilhe os seguros com eles.',
                onTap: () {},
              ),
              const SizedBox(
                height: 15,
              ),
              const HomePageSectionTitleWidget(
                title: 'Contratados',
              ),
              const SizedBox(
                height: 5,
              ),
              HomePageListViewEmptyCardItemWidget(
                icon: Icons.sentiment_dissatisfied,
                message: 'Você ainda não possui seguros contratados.',
                onTap: () {},
              )
            ]),
          )
        ],
      ),
    );
  }
}
