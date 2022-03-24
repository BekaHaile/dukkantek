import 'package:dukkantek_test/core/adapters/repository_adapter.dart';
import 'package:dukkantek_test/core/repository/login_repository.dart';
import 'package:dukkantek_test/ui/controllers/home_controller.dart';
import 'package:dukkantek_test/ui/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILoginRepository>(
        () =>LoginRepository(),
        fenix: true);
    Get.lazyPut(() => LoginController(repository: Get.find()));
    Get.lazyPut(() => HomeController());
  }
}