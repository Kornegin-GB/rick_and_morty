import 'package:flutter/material.dart';

class CharacterInfoItem extends StatelessWidget {
  const CharacterInfoItem({super.key, required this.title, required this.data});

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$title: ", style: TextStyle(fontWeight: FontWeight.bold)),
        Flexible(child: Text(data)),
      ],
    );
  }
}
