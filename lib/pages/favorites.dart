import 'package:flutter/material.dart';
import 'package:apis_open_data/widgets/title.dart';

class Favorites extends StatelessWidget {
  static const String routeName = '/favorites';

  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {

    return const Column(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleWidget(title: 'Favoris', subtitle: 'Voici la liste de vos favoris',),
            ]
          ),
        ),
      ],
    );
  }
}
