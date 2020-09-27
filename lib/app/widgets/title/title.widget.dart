import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class TitleWidget extends StatelessWidget {
  final Widget prefix;
  final String title;

  const TitleWidget({Key key, this.prefix, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          prefix != null ? prefix : Container(),
          Text(
            FlutterI18n.translate(context, title),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          )
        ],
      );
}
