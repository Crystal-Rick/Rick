import 'package:flutter/material.dart';

class PersonsHeader extends StatelessWidget {
  final int count;
  const PersonsHeader({super.key, required this.count});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child:
        Container(
          padding: const EdgeInsets.only(top: 4, bottom: 4),
          child: Text(
            'ВСЕГО ПЕРСОНАЖЕЙ: $count',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xff5B6975),
              fontSize: 10,
              letterSpacing: 1.5,
            ),
          ),
        ),),
        const SizedBox(width: 24,),
        const ImageIcon(AssetImage('assets/images/Grid.png'), color: Color(0xfff5B6975)),
        const SizedBox(width: 14,)

      ],
    );
  }
}