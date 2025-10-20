import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roqu_copy_trader/src/core/services/get_injection_container.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await GetInjectionContainer.init();
}
