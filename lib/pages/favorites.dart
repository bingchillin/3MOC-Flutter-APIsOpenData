import 'package:apis_open_data/pages/home.dart';
import 'package:apis_open_data/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:apis_open_data/widgets/title.dart';
import 'package:apis_open_data/widgets/bottom_bar.dart';


class Favorites extends StatelessWidget {
  static const String routeName = '/favorites';

  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    void onBottomLinkClicked(int val) {
      Navigator.pushReplacementNamed(
        context,
        MyHomePage.routeName,
      );
    }

    return Scaffold(
      appBar: const AppBarWidget(),
      body: const Column(
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
      ),
      bottomNavigationBar: BottomBarWidget(
        onTap: onBottomLinkClicked,
      ),
    );
  }
}
