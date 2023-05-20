/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'dart:io';

import 'package:chat_astro/core/services/impl/session_service_impl.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_theme.dart';
import '../feature/user_creation/presentation/user_creation_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<SessionServiceImpl>().locale = context.locale;
    return GetMaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      defaultTransition:
          kIsWeb || Platform.isIOS ? null : Transition.rightToLeftWithFade,
      locale: context.locale,
      title: 'Chat astro',
      theme: AppTheme.theme,
      home: const UserCreationScreen(),
    );
  }
}
