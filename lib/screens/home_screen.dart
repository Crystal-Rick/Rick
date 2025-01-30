import 'package:flutter/material.dart';
import 'package:rickmorty/feature/PersonList.dart';
import 'package:rickmorty/feature/bottomNavigationBar.dart';
import 'package:rickmorty/feature/search_botton.dart';
import 'package:rickmorty/screens/episode_screen.dart';
import 'package:rickmorty/screens/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String querySearch = "";// Состояние для строки поиска
  late List<Person> _filteredPersons;// Фильтрованный список персонажей означает что перемменная будт объявлена позже
  int _selectedIndex = 0;  // Индекс выбранного элемента в нижней навигации

  @override
  void initState() {
    super.initState();
    _filteredPersons = persons; // Инициализация фильтрованного списка изначально показывает весь список персонажей
  }
// Метод для фильтрации персонажей
  void _filterPersons(String query) {
    setState(() {
      querySearch = query;
      if (query.isEmpty) {
        _filteredPersons = persons; // Если запрос пустой, показываем всех
      } else {
        _filteredPersons = persons.where((person) {
          return person.name.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }
// Обработчик выбора элемента в нижней навигации
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Обновляем выбранный индекс
    });
  }
// Возвращает текущий экран на основе выбранного индекса
  Widget _getSelectedScreen() {
    switch (_selectedIndex) {
      case 0:
        return PersonsList(persons: _filteredPersons);
      case 2:
        return EpisodesList(episodes: episodes);
      case 3:
        return const SettingsScreen();
      default:
        return const Center(
          child: Text(
            'Раздел в разработке',
            style: TextStyle(color: Colors.white),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xfff0b1e2d),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SearchBotton(theme: theme, onSearch: _filterPersons),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16), // Общий отступ
        child: Column(
          children: [
            const SizedBox(height: 20),// SizedBox для отступа между строкой поиска и списком персонажей
            Expanded(child: _getSelectedScreen(),), // Выбор экрана
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
        backgroundColor: const Color(0xfff0b1e2d),
    );
  }
}
