import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
void main() {
  //debugPaintSizeEnabled = true;
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
        useMaterial3: false,
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
  String _querySearch = "";// переменная состояния запроса
  late  List<Person> _filteredPersons;// переменная для отфильтрофанных значений, late означает что переменная будет объявлена позже
  int _selectedIndex = 0;

  // Список персонажей
  final List<Person> persons = [
    Person('Рик Санчез', 'Человек, Мужской', true, 'assets/images/Rick.jpg'),
    Person('Рик Санчез', 'Человек, Мужской', true, 'assets/images/Rick.jpg'),
    Person('Рик Санчез', 'Человек, Мужской', true, 'assets/images/Rick.jpg'),
    Person('Директор Агенства', 'Человек, Мужской', true, 'assets/images/Director.jpg'),
    Person('Морти Смит', 'Человек, Мужской', true, 'assets/images/Morty.jpg'),
    Person('Саммер Смит', 'Человек, Женский', true, 'assets/images/Sammer.jpg'),
    Person('Рик Санчез', 'Человек, Мужской', true, 'assets/images/Rick.jpg'),
    Person('Рик Санчез', 'Человек, Мужской', true, 'assets/images/Rick.jpg'),
    Person('Рик Санчез', 'Человек, Мужской', true, 'assets/images/Rick.jpg'),
    Person('Директор Агенства', 'Человек, Мужской', true, 'assets/images/Director.jpg'),
    Person('Морти Смит', 'Человек, Мужской', true, 'assets/images/Morty.jpg'),
    Person('Саммер Смит', 'Человек, Женский', true, 'assets/images/Sammer.jpg'),
    Person('Альберт Эйнштейн', 'Человек, Мужской', false, 'assets/images/Albert.jpg'),
    Person('Алан Райлс', 'Человек, Мужской', false, 'assets/images/Alan.jpg'),
    Person('Рик Санчез', 'Человек, Мужской', true, 'assets/images/Rick.jpg'),
    Person('Рик Санчез', 'Человек, Мужской', true, 'assets/images/Rick.jpg'),
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
  void initState(){
    super.initState();
    _filteredPersons = persons; // назначаем что при пустой строке поиска будет показываться весь список персов
  }
  void _filterPersons(String query){
    setState(() {
      _querySearch = query;
      if (query.isEmpty){
       _filteredPersons = persons;// булевое значение, если строка пуста то возвращается true или же весь наш список
      } else{
        _filteredPersons = persons.where((Person){//.where в Dart — это метод для фильтрации элементов в коллекциях, таких как списки. Он принимает функцию-предикат в качестве аргумента и возвращает новый итерабельный объект, содержащий только элементы, которые удовлетворяют условию.
          return Person.name.toLowerCase().contains(query.toLowerCase());// contains сверяет данные в именах персонажей и в запросе
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body:
      CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(
              preferredSize:  Size.fromHeight(48),
              child: SearchBotton(theme: theme, onSearch: _filterPersons,),
            ),

            pinned: true,
            snap: true,
            floating: true,
            backgroundColor: theme.primaryColor,
          ),
          SliverToBoxAdapter(
            child: Container(
              margin:  EdgeInsets.only(left: 16, right: 15,  bottom: 20,top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: 4, bottom: 4),
                    child: Text(
                      'Количество персонажей: ${persons.length}', // Отображаем количество персонажей
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: 14),
                    child: Icon(Icons.grid_view_outlined, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          PersonsList(persons: persons),
        ],
      ),

      bottomNavigationBar:BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xfff152a3a),
        items:   [
          BottomNavigationBarItem(backgroundColor:theme.primaryColor ,
            icon: ImageIcon(AssetImage('assets/images/guest.png')),
            label: 'Персонажи',
          ),
          BottomNavigationBarItem(backgroundColor:theme.primaryColor ,
            icon: ImageIcon(AssetImage('assets/images/location.png')),
            label: 'Локации',
          ),
          BottomNavigationBarItem(backgroundColor:theme.primaryColor ,
            icon: ImageIcon(AssetImage('assets/images/episode.png')),
            label: 'Эпизоды',
          ),
          BottomNavigationBarItem(backgroundColor:theme.primaryColor ,
            icon: ImageIcon(AssetImage('assets/images/Settings.png')),
            label: 'Настройки',
          ),
        ],
      ),


      backgroundColor: theme.primaryColor,
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

      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: theme.highlightColor,
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only( left: 15, top: 12, bottom: 12),
                child: const Icon(Icons.search_rounded),
              ),

              Container(

                margin: const EdgeInsets.only(left: 10,right: 59),
                padding: const EdgeInsets.only( top: 12, bottom: 12),

                child: Text(
                  'Найти персонажа',
                 style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: theme.hintColor,
                    fontSize: 16,
                  ),
                    //border: InputBorder.none,
                  ),
                ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: const Text('|'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: const Icon(Icons.filter_alt_outlined),
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
    final theme = Theme.of(context);
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          final person = persons[index];

          return Container(
            decoration: BoxDecoration(color: theme.primaryColor),
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
        childCount: persons.length,
      ),
    );
  }
}
