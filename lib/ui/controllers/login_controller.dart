import 'package:dukkantek_test/core/adapters/repository_adapter.dart';
import 'package:dukkantek_test/shared/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'home_controller.dart';

class LoginController extends GetxController {
  final ILoginRepository repository;
  LoginController({required this.repository});

  String userName = '';
  String password = '';

  HomeController homeController = Get.find();

  //Sign in with google data
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount ? _user;
  GoogleSignInAccount get user => _user!;

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

  signInGoogle() async{
    final googleUser = await googleSignIn.signIn();
    if(googleUser == null) return;

    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    homeController.userName = user.name;
    Get.toNamed(Routes.homePage);
  }
}
