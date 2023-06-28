import 'package:apis_open_data/pages/favorites.dart';
import 'package:apis_open_data/widgets/listing.dart';
import 'package:flutter/material.dart';
import 'package:apis_open_data/widgets/widgets.dart';


class MyHomePage extends StatelessWidget {
  static const String routeName = '/';


  const MyHomePage({super.key});

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
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titre + sous-titre ------------------------------------------------
          TitleWidget(),
          // Barre de recherche ------------------------------------------------
          SearchBarWidget(),
          // Liste -------------------------------------------------------------
          Listing(),
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
