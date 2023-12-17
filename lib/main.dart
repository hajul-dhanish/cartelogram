import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'data/Env/base_config.dart';
import 'data/sharedPref/SharedPref.dart';
import 'theme/appTheme.dart';
import 'view/initial_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  UserSharedPreferences().initSharedPreferences();
  const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: Environment.prod,
  );
  Environment().initConfig(environment);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // navigatorKey: NavigationService.navigatorKey,
      initialRoute: '/',
      title: 'Cartel-o-gram',
      localizationsDelegates: const [],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(
          dialogTheme: DialogTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: AppTheme.of(context).secondaryBackground,
          ),
          appBarTheme: const AppBarTheme(
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
          ),
          brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: const InitialView(),
    );
  }
}
