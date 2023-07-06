import 'package:apis_open_data/pages/home.dart';
import 'package:apis_open_data/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:apis_open_data/widgets/title.dart';
import 'package:apis_open_data/widgets/app_bar.dart';


class DetailsWidget extends StatelessWidget {
  static const String routeName = '/details';

  final String title;
  final String subtitle;
  final String url;

  const DetailsWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.url});

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image MAIS je n'arrive pas à size l'image pour qu'elle prenne toute la largeur
          SizedBox(
            width: double.infinity,
            height: 200,
            child: Image.network(url),
          ),
          const SizedBox(height: 15),
          TitleWidget(title: title, subtitle: subtitle),
        ],
      ),
      // Barre de navigation ---------------------------------------------------
      bottomNavigationBar: BottomBarWidget(
        onTap: onBottomLinkClicked,
      ),
    );
  }
}
