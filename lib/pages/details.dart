import 'package:apis_open_data/pages/home.dart';
import 'package:apis_open_data/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titre + sous-titre ------------------------------------------------
          TitleWidget(title: 'Détails,', subtitle: 'Détails de levent,'),
        ],
      ),
      // Barre de navigation ---------------------------------------------------
      bottomNavigationBar: BottomBarWidget(
        onTap: onBottomLinkClicked,
      ),
    );
  }
}
