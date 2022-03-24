import 'package:dukkantek_test/ui/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Logged in'),
          actions: [
            TextButton(onPressed: () => controller.logout(), child: const Text('Logout'))
          ],
        ),
        body: Center(
          widthFactor: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome ${controller.userName}'),
            ],
          ),
        ),
      ),
    );
  }
}
