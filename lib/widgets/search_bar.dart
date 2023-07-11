import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Nom de l\'évènement...',
            suffixIcon: Icon(Icons.search)
        ),
      ),
    );
  }
}
