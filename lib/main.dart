import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';

import 'package:rickmorty/screens/Registr_Screen.dart';
import 'package:rickmorty/screens/home_screen.dart';
import 'package:rickmorty/screens/login_screen.dart';



void main() {
 // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
// цвет фона для навигации
    return MaterialApp(
      title: 'Rick Morty',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xfff152a3a),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xfff152a3a)),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/reg':(context) => const RegScreen(),
      },
    );
  }
}


