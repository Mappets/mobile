import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class TitleWidget extends StatelessWidget {
  final String title;

  const TitleWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        FlutterI18n.translate(context, title),
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      );
}
