import 'package:flutter/material.dart';


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
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xfff152A3A),
      ),
      child: Row(
        children: [
          const SizedBox(width: 15,),
          const Image(image: AssetImage('assets/images/search.png'), color: Color(0xfff5B6975)),
          const SizedBox(width: 10,),
          Expanded(
            child: TextField(
              onChanged: onSearch,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Найти персонажа',
              ),
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Color(0xfff5B6975),
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 10,),
          const Text('|', style: TextStyle(color: Color(0xfff5B6975))),
          const SizedBox(width: 10,),
          const Image(image: AssetImage('assets/images/filter.png'), color: Color(0xfff5B6975)),
          const SizedBox(width: 15,)
        ],
      ),

    );

  }
}