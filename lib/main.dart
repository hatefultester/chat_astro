import 'package:flutter/widgets.dart';
import 'app.dart';
import 'dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionContainer.dependencies();
  runApp(const MyApp());
}

