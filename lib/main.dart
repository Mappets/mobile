import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/pages/home/home.page.dart';

void main() {
  runApp(GetMaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mappets',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      );
}
