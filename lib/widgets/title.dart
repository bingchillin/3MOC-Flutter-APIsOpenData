import 'package:flutter/material.dart';


class TitleWidget extends StatelessWidget {
  final String title, subtitle;

  const TitleWidget({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 0.0, left: 16.0, top: 16.0, right: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            //'Bonjour,',
            title,
            style: Theme
                .of(context)
                .textTheme
                .titleLarge,
          ),
          const SizedBox(height: 15),
          Text(
            //'Recherchez une sortie, un concert ou un évènement',
            subtitle,
            style: Theme
                .of(context)
                .textTheme
                .titleMedium,
          ),
        ],
      ),
    );
  }
}
