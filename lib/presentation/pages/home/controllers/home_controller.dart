import 'dart:io';

import 'package:firebase_login/domain/entities/user_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/services/firebase_auth_service.dart';
import '../../../routes/routes.dart';

class HomeController extends GetxController {
  final FirebaseAuthService _firebaseAuthService =
      Get.find<FirebaseAuthService>();

  UserEntity userEntity = Get.arguments;

  String formatUserName() => userEntity.name.trim().contains(' ')
      ? '${userEntity.name.trim().split(' ').first} ${userEntity.name.trim().split(' ').last}'
      : userEntity.name;

  void signOut() async {
    await _firebaseAuthService.signOut(() {
      Get.offNamed(Routes.LOGIN);
    });
  }

  void openWebView() {
    _launchURL();
  }

  _launchURL() async {
    Uri url = Uri.parse(
        'https://autoatendimento.tokiomarine.com.br/smart/#/assistencia/auto');

    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  @override
  void onInit() {
    super.onInit();
    if (kIsWeb) {
    } else {
      if (Platform.isAndroid) WebView.platform = AndroidWebView();
    }
  }
}
