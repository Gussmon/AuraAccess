import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/screens/welcome_screen.dart'; // Cambiado aquí

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aura Access',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(), // Cambiado aquí para que inicie en el Splash
    );
  }
}
