import 'package:flutter/material.dart';
import 'package:rickmorty/screens/Registr_Screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0b1e2d),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
        const Text('Хотите зарегистрировать аккаунт?',
          style: TextStyle(color: Colors.white),
        ),

            SizedBox(
            width: double.infinity,
            child: ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF41B9E5),
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text(
        "Регистрация",
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
            ),

      ),]
      ),
    );

  }
}