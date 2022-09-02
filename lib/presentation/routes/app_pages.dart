import 'package:get/get_navigation/src/routes/get_route.dart';

import '../bindings/bindings.dart';
import '../pages/pages.dart';
import 'routes.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
        name: Routes.LOGIN,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: Routes.HOME,
        page: () => const HomePage(),
        binding: HomeBinding()),
  ];
}
