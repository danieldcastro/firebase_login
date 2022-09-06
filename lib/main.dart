import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login/core/bindings/initial_bindings.dart';
import 'package:firebase_login/presentation/routes/app_pages.dart';
import 'package:firebase_login/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';
import 'presentation/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  InitialBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Firebase login',
      initialRoute: Routes.INITIAL,
      initialBinding: InitialBindings(),
      defaultTransition: Transition.fadeIn,
      theme: AppTheme.theme,
      getPages: AppPages.pages,
    );
  }
}
