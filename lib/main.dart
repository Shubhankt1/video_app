import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import 'screens/splash_screen.dart';
import 'utils/app_styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();
  WindowOptions windowOptions = const WindowOptions(
    minimumSize: Size(400, 550),
    size: Size(450, 580),
    center: true,
    title: "Ting!",
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme(),
      darkTheme: AppThemes.darkTheme(),
      // themeMode: ThemeMode.dark,
      home: const SplashScreen(),
    );
  }
}
