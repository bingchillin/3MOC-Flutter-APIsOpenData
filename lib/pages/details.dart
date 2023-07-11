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
    );
  }
}