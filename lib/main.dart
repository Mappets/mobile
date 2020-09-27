import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:mobile/app/providers/user.provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/constants/app.constants.dart';
import 'app/constants/language.constants.dart';
import 'app/constants/route.constants.dart';
import 'app/constants/shared_preferences.constants.dart';
import 'app/interfaces/user.interface.dart';
import 'app/routing/routes.dart';

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

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String userString =
      sharedPreferences.getString(SharedPreferencesConstants.USER);

  if (userString != null) {
    UserProvider userProvider = UserProvider.getInstance;
    userProvider.user = User.fromJson(jsonDecode(userString));
  }

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: AppConstants.NAME,
    theme: ThemeData(
        primaryColor: Color(0xFF42B883),
        accentColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme:
            AppBarTheme(iconTheme: IconThemeData(color: Colors.white))),
    supportedLocales: [
      Locale(LanguageConstants.BRAZILIAN_PORTUGUESE),
      Locale(LanguageConstants.AMERICAN_ENGLISH)
    ],
    localizationsDelegates: [
      flutterI18nDelegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate
    ],
    builder: FlutterI18n.rootAppBuilder(),
    initialRoute: RouteConstants.EDIT_PET,
    getPages: appRoutes,
  ));
}
