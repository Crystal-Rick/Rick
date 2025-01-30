

import 'package:flutter/material.dart';
import 'package:rickmorty/feature/Persons_Header.dart';

class Person {
  final String name;
  final String status;
  final bool alive;
  final String imagePath;

  Person(this.name, this.status, this.alive, this.imagePath);
}
// Список персонажей
final List<Person> persons = [
  Person('Рик Санчез', 'Человек, Мужской', true, 'assets/images/Rick.jpg'),
  Person('Директор Агенства', 'Человек, Мужской', true, 'assets/images/Director.jpg'),
  Person('Морти Смит', 'Человек, Мужской', true, 'assets/images/Morty.jpg'),
  Person('Саммер Смит', 'Человек, Женский', true, 'assets/images/Sammer.jpg'),
  Person('Альберт Эйнштейн', 'Человек, Мужской', false, 'assets/images/Albert.jpg'),
  Person('Алан Райлс', 'Человек, Мужской', false, 'assets/images/Alan.jpg'),
  Person('Рик Санчез', 'Человек, Мужской', true, 'assets/images/Rick.jpg'),
  Person('Директор Агенства', 'Человек, Мужской', true, 'assets/images/Director.jpg'),
  Person('Морти Смит', 'Человек, Мужской', true, 'assets/images/Morty.jpg'),
  Person('Саммер Смит', 'Человек, Женский', true, 'assets/images/Sammer.jpg'),
  Person('Альберт Эйнштейн', 'Человек, Мужской', false, 'assets/images/Albert.jpg'),
  Person('Алан Райлс', 'Человек, Мужской', false, 'assets/images/Alan.jpg'),
];

class PersonsList extends StatelessWidget {
  final List<Person> persons;

  const PersonsList({super.key, required this.persons});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PersonsHeader(count: persons.length),
        const SizedBox(height: 20,),//  заголовок
        Expanded(
          child: ListView.builder(
            itemCount: persons.length,
            itemBuilder: (context, index) {
              final person = persons[index];
              return Container(
                decoration: const BoxDecoration(color: Color(0xfff0B1E2D)),
                margin: const EdgeInsets.only(bottom: 24),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(person.imagePath),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        person.alive ? 'Живой' : 'Мертвый',
                        style: TextStyle(
                          color: person.alive ? const Color(0xfff43D049) : const Color(0xfffEB5757),
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          letterSpacing: 1.5,
                        ),
                      ),
                      Text(
                        person.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          letterSpacing: 0.5,
                        ),
                      ),
                      Text(
                        person.status,
                        style: const TextStyle(
                          color: Color(0xfff6E798C),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
