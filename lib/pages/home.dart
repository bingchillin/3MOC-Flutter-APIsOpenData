import 'package:apis_open_data/webservices/event_widget.dart';
import 'package:flutter/material.dart';
import 'package:apis_open_data/widgets/title.dart';

class MyHomePage extends StatelessWidget {
  static const String routeName = '/';

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () => throw Exception('Test Crash'),
          child: const Text('Crash'),
        ),
        // Titre + sous-titre ------------------------------------------------
        const TitleWidget(
          title: 'Bonjour,',
          subtitle: 'Recherchez une sortie, un concert ou un évènement',
        ),
        // Barre de recherche ------------------------------------------------
        //SearchBarWidget(),
        // Liste -------------------------------------------------------------
        const EventWidget(
          filter: null,
        ),
      ],
    );
  }
}
