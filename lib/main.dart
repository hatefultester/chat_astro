import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'app/app.dart';
import 'app/app_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionContainer.dependencies();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('cs'),
          Locale('en'),
          Locale('es'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        useFallbackTranslations: true,
        child: const MyApp()),
  );
}