import 'package:dukkantek_test/ui/controllers/login_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  String? userName = '';

 logout(){
   LoginController loginController = Get.find();
   loginController.logout();
 }
}