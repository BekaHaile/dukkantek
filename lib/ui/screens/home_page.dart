import 'package:dukkantek_test/ui/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController>{
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Center(widthFactor: MediaQuery.of(context).size.width, child: Text('Welcome ${controller.userName}'),);
  }

}