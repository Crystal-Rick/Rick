import 'package:flutter/material.dart';
import 'package:rickmorty/Registr_Screen.dart';
import 'package:rickmorty/episode.dart';
import 'package:rickmorty/main.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0B1E2D),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 58, right: 52, top: 21, bottom: 66),
              child: const Image(image: AssetImage('assets/images/logo.png')),
            ),

            // Поле "Логин"
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Логин",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person, color: Colors.grey),
                      hintText: 'Логин',
                      filled: true,
                      fillColor: const Color(0xfff152A3A),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Поле "Пароль"
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Пароль",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.password_outlined, color: Colors.grey),
                      hintText: 'Пароль',
                      filled: true,
                      fillColor: const Color(0xfff152A3A),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Кнопка "Войти"
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 28),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
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
                    "Войти",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              
            ),
            Container(
              margin: EdgeInsets.only(left:  28,right: 28,top: 24,bottom:28),

              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('У вас еще нет аккаунта?',style: TextStyle(color: Colors.grey),),
                const SizedBox(width: 5,),
                GestureDetector(onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegScreen()),
                  );

                },
                  child: const Text(
                    "Создать",
                    style: TextStyle(
                      color: Color(0xFFF43D049),
                      fontWeight: FontWeight.bold,),
                  ),
                ),
              ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
