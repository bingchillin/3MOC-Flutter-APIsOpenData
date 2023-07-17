import 'package:apis_open_data/main.dart';
import 'package:apis_open_data/webservices/event_widget.dart';
import 'package:flutter/material.dart';
import 'package:apis_open_data/widgets/title.dart';

class Favorites extends StatefulWidget {
  static const String routeName = '/favorites';

  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {

    return  Column(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleWidget(title: 'Favoris', subtitle: 'Voici la liste de vos favoris',),
              EventWidget(filter: AppStateScope.of(context).favorites,),
            ]
          ),
        ),
      ],
    );
  }
}
