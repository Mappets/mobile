import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(context) => Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Center(child: Text(FlutterI18n.translate(context, "register"))));
}
