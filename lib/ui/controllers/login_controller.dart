import 'package:dukkantek_test/core/adapters/repository_adapter.dart';
import 'package:dukkantek_test/shared/routes/app_pages.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class LoginController extends GetxController {
  final ILoginRepository repository;
  LoginController({required this.repository});

  String userName = '';
  String password = '';

  HomeController homeController = Get.find();

  login() {
    final loginPayload = {"user_name": userName, "password": password};

    repository.login(loginPayload).then(
      (loginResponse) {
        //assuming the loginResponse has the proper flag and auth key
        if (loginResponse.statusCode == 200) {
          homeController.userName = loginResponse.data["username"];
          Get.toNamed(Routes.homePage);
        }
      },
      onError: (err) {
        // ignore: avoid_print
        print("$err");
      },
    );
  }
}
