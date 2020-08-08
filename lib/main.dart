import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:mobile/app/pages/home/home.page.dart';

import 'app/constants/app.constants.dart';
import 'app/constants/language.constants.dart';

Future<void> main() async {
  final FlutterI18nDelegate flutterI18nDelegate = FlutterI18nDelegate(
    translationLoader: FileTranslationLoader(
      useCountryCode: false,
      fallbackFile: LanguageConstants.BRAZILIAN_PORTUGUESE,
      basePath: LanguageConstants.BASE_PATH,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await flutterI18nDelegate.load(null);

  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false, home: MyApp(flutterI18nDelegate)));
}

class MyApp extends StatelessWidget {
  final FlutterI18nDelegate flutterI18nDelegate;

  MyApp(this.flutterI18nDelegate);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.NAME,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        supportedLocales: [Locale("pt"), Locale("en")],
        localizationsDelegates: [
          flutterI18nDelegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        builder: FlutterI18n.rootAppBuilder(),
        home: HomePage(),
      );
}
