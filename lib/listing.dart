import 'package:flutter/material.dart';

class Listing extends StatelessWidget {

  static const String routeName = '/listing';

  const Listing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CityExplore Paris'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded
            (
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
