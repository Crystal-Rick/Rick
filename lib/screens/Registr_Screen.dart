import 'package:flutter/material.dart';
import 'package:rickmorty/screens/login_screen.dart';

class RegScreen extends StatelessWidget {
  const RegScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B1E2D), 
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28), // Общий отступ слева и справа
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Выравнивание элементов слева
            children: [
              const SizedBox(height: 54), // Отступ сверху вместо margin

                 GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const ImageIcon(AssetImage('assets/images/back.png'),color: Colors.white,),
                            ),

              const SizedBox(height: 28), // Отступ после стрелки
              const Text(
                "Создать аккаунт",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 40), // Отступ перед полем "Имя"
              const Text(
                'Имя',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8,),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Имя',
                  filled: true,
                  fillColor: const Color(0xfff152A3A),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none

                  )
                ),
              ),
              const SizedBox(height: 10,),
              const Text(
                'Фамилия',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8,),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Фамилия',
                  filled: true,
                  fillColor: const Color(0xfff152a3a),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none
                  )
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Отчество',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8,),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Отчество',
                  filled: true,
                  fillColor: const Color(0xfff152a3a),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none
                  )
                ),
              ),
              const SizedBox(height: 36,),
              Divider(
                color: const Color(0xfff152a3a).withOpacity(0.5),
                thickness: 2,
              ),
              const SizedBox(height: 36,),
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
                  hintText: 'Логин',
                  prefixIcon: const ImageIcon(AssetImage('assets/images/User.png'),color: Color(0xfff5B6975),),
                  filled: true,
                  fillColor: const Color(0xfff152A3A),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 10,),
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
                obscureText: false,
                decoration: InputDecoration(
                  prefixIcon: const ImageIcon(AssetImage('assets/images/password.png'),color: Color(0xfff5B6975),),
                  hintText: 'Пароль',
                  filled: true,
                  fillColor: const Color(0xfff152A3A),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 63,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
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
                    "Создать",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
