import 'package:apis_open_data/pages/favorites.dart';
import 'package:flutter/material.dart';
import 'package:apis_open_data/widgets/widgets.dart';


class MyHomePage extends StatelessWidget {
  static const String routeName = '/';


  const MyHomePage({super.key});

  final _previousRoute = Navigator.defaultRouteName;

  @override
  Widget build(BuildContext context) {
    void onBottomLinkClicked(int val) {
      Navigator.pushReplacementNamed(
        context,
        Favorites.routeName,
      );
    }

    return Scaffold(
      appBar: const AppBarWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titre + sous-titre ------------------------------------------------
          const TitleWidget(),
          // Barre de recherche ------------------------------------------------
          const SearchBarWidget(),
          // Liste -------------------------------------------------------------
          // PROBLEME DE DOUBLONS : on duplique le code car le widget ne marche pas
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  // Pour l'instant, on garde de côté pour l'appel api
                  //leading: Image.network(),
                  title: Text('Élément $index'),
                  subtitle: Text('Sous-titre de l\'élément $index'),
                );
              },
            ),
          ),
          //const ListWidget(),
        ],
      ),
      // Barre de navigation ---------------------------------------------------
      bottomNavigationBar: BottomBarWidget(
        onTap: onBottomLinkClicked,
      ),
    );
  }
}
