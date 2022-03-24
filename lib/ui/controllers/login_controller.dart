import 'package:dukkantek_test/core/adapters/repository_adapter.dart';
import 'package:dukkantek_test/shared/routes/app_pages.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final ILoginRepository repository;
  LoginController({required this.repository});

  
  String userName = '';
  String password = '';

  login() {
    final loginPayload = {
      "user_name": userName,
      "password": password
    };

    repository.login(loginPayload).then((loginResponse) {
        //assuming the loginResponse has the proper flag and auth key
          Get.toNamed(Routes.homePage);
      },
      onError: (err) {
        // ignore: avoid_print
        print("$err");
      },);
  }
}