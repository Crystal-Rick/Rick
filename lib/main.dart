import 'package:flutter/material.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xfff152a3a); // цвет фона для навигации
    return MaterialApp(
      title: 'Rick Morty',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String querySearch = ""; // переменная состояния запроса
  late List<Person> _filteredPersons; // переменная для отфильтрофанных значений // late означает что переменная будет определена позже
  int _selectedIndex = 0;

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

  // Функция для изменения выбранного индекса
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _filteredPersons = persons; // initState используется для инициализации нашей переменой чтоб изначально показывался весь список
  }

  void _filterPersons(String query) {
    setState(() {
      querySearch = query;
      if (query.isEmpty) { // булевое значение, если строка пуста то возвращается true или же весь наш список

        _filteredPersons = persons;
      } else {
        _filteredPersons = persons.where((person) {
          return person.name.toLowerCase().contains(query.toLowerCase());// это метод для фильтрации элементов в коллекциях, таких как списки. Он принимает функцию-предикат в качестве аргумента и возвращает новый итерабельный объект, содержащий только элементы, которые удовлетворяют условию.
        }).toList();// contains сверяет данные в именах персонажей и в запросе
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        automaticallyImplyLeading: false,// убрал отступы по умолчанию
        backgroundColor: const Color(0xfff0B1E2D),
        title: SearchBotton(theme: theme, onSearch: _filterPersons),
        
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16, right: 15, bottom: 20,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  child: Text(
                    'ВСЕГО ПЕРСОНАЖЕЙ: ${persons.length}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xfff5B6975),
                        fontSize: 10,
                        letterSpacing: 1.5
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 14),
                  child: Icon(Icons.grid_view_outlined, color: Color(0xfff5B6975)),
                ),
              ],
            ),
          ),
          Expanded(
            child: PersonsList(persons: _filteredPersons),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xfff152a3a),
        items: [
          BottomNavigationBarItem(
            backgroundColor: theme.primaryColor,
            icon: const ImageIcon(AssetImage('assets/images/guest.png')),
            label: 'Персонажи',
          ),
          BottomNavigationBarItem(
            backgroundColor: theme.primaryColor,
            icon: const ImageIcon(AssetImage('assets/images/location.png')),
            label: 'Локации',
          ),
          BottomNavigationBarItem(
            backgroundColor: theme.primaryColor,
            icon: const ImageIcon(AssetImage('assets/images/episode.png')),
            label: 'Эпизоды',
          ),
          BottomNavigationBarItem(
            backgroundColor: theme.primaryColor,
            icon: const ImageIcon(AssetImage('assets/images/Settings.png')),
            label: 'Настройки',
          ),
        ],
      ),
      backgroundColor: const Color(0xfff0B1E2D),
    );
  }
}

class SearchBotton extends StatelessWidget {
  const SearchBotton({
    super.key,
    required this.theme,
    required this.onSearch,
  });

  final ThemeData theme;
  final Function(String) onSearch;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16,right: 16,top: 11,bottom:  20,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xfff152A3A) ,
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: const Icon(Icons.search_rounded,color: Color(0xfff5B6975),),
          ),
          Expanded(
            child: TextField(
              onChanged: onSearch,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Найти персонажа',
              ),
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Color(0xfff5B6975),
                fontSize: 16,
              ),
            ),
          ),
          Container(child: Text('|',style: TextStyle(color: Color(0xfff5B6975)),),),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: const Icon(Icons.filter_alt_outlined,color: Color(0xfff5B6975),),
          ),
        ],
      ),
    );
  }
}


class Person {
  final String name;
  final String status;
  final bool state;
  final String imagePath;
  Person(this.name, this.status, this.state, this.imagePath);
}

class PersonsList extends StatelessWidget {
  final List<Person> persons;

  const PersonsList({super.key, required this.persons});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: persons.length,
      itemBuilder: (context, index) {
        final person = persons[index];
        return Container(
          decoration: const BoxDecoration(color: Color(0xfff0B1E2D)),
          margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 24),
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
                  person.state ? 'Живой' : 'Мертвый',
                  style: TextStyle(
                    color: person.state ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
                Text(
                  person.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  person.status,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
