import 'package:dukkantek_test/ui/bindings/home_binding.dart';
import 'package:dukkantek_test/ui/bindings/login_binding.dart';
import 'package:dukkantek_test/ui/screens/home_page.dart';
import 'package:dukkantek_test/ui/screens/login_page.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
part 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    // Login pages
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBinding()
    ),

    GetPage(
      name: Routes.homePage,
      page: () => const HomePage(),
      binding: HomeBinding()
    ),
  ];
}