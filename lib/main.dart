import 'package:flutter/material.dart';
// 1. Vinculamos la página del Splash usando la ruta correcta
import 'package:flutter_application_1/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AuraAccess',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 30, 86, 56),
        ),
        useMaterial3: true,
      ),
      // 2. Apuntamos el inicio de la app al Splash
      home: const SplashScreen(),
    );
  }
}
