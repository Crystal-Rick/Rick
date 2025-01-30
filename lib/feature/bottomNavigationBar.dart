import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
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
    );
  }
}
