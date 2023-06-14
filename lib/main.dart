import 'package:apis_open_data/listing.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MaterialColor customColor = const MaterialColor(
    0xFF9AE19D,
    <int, Color>{
      50: Color(0xFFE1F6E6),
      100: Color(0xFFB7E7B8),
      200: Color(0xFF8FD98E),
      300: Color(0xFF67CA63),
      400: Color(0xFF41BD45),
      500: Color(0xFF1CB020),
      600: Color(0xFF1AA81D),
      700: Color(0xFF17961A),
      800: Color(0xFF138417),
      900: Color(0xFF0E7011),
    },
  );

  @override
  Widget build(BuildContext context) {
    // Données pour le thème (dark + couleurs vertes) --------------------------
    final darkTheme = ThemeData.dark().copyWith(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: customColor,
      ),
    );

    return MaterialApp(
      title: 'Flutter Interface',
      theme: darkTheme,
      home: MyHomePage(),
      initialRoute: '/',
      routes: {
        Listing.routeName : (context) => const Listing(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CityExplore Paris'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titre + sous-titre ------------------------------------------------
          Padding(
            padding: const EdgeInsets.only(bottom: 0.0, left: 16.0, top: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bonjour,',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 15),
                Text(
                  'Recherchez une sortie, un concert ou un évènement',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          // Barre de recherche ------------------------------------------------
          const Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Adresse, date...',
                suffixIcon: Icon(Icons.search)
              ),
            ),
          ),
          // Liste -------------------------------------------------------------
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Élément $index'),
                  subtitle: Text('Sous-titre de l\'élément $index'),
                );
              },
            ),
          ),
        ],
      ),
      // Barre de navigation ---------------------------------------------------
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoris',
          ),
        ],
      ),
    );
  }
}
