import 'package:flutter/material.dart';
import 'package:rickmorty/Registr_Screen.dart';
import 'package:rickmorty/main.dart';
import 'package:rickmorty/login_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0B1E2D),
      body: Container(

        child:Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Text('Хотите зарегистрировать аккаунт?',style: TextStyle(color: Colors.white),),

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
      ),
    );

  }
}