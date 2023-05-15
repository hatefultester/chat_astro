/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_theme.dart';
import 'app_translations.dart';
import 'feature/user_profile/presentation/user_data_generation_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppTranslations(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('cs', 'CZ'),
        Locale('es', 'ES'),
      ],
      title: AppTranslations.appDisplayName,
      theme: AppTheme.theme,
      home: const UserDataGenerationScreen(),
    );
  }
}
