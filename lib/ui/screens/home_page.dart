import 'package:dukkantek_test/ui/controllers/home_controller.dart';
import 'package:dukkantek_test/ui/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          widthFactor: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome ${controller.userName}'),
              const SizedBox(height: 20),
                    Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
                          child: RoundedButton(
                            text: 'Logout',
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ),
            ],
          ),
          
        ),
      ),
    );
  }
}
