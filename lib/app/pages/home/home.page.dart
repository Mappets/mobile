import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/pages/home/home.controller.dart';

class HomePage extends StatelessWidget {
  final Controller controller = Get.put(Controller());

  @override
  Widget build(context) => Scaffold(
      appBar: AppBar(title: Text("Home")), body: Center(child: Text("Home")));
}
