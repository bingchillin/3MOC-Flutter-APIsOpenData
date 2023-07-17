import 'package:flutter/material.dart';
import 'package:apis_open_data/widgets/app_bar.dart';

class DetailsWidget extends StatefulWidget {
  static const String routeName = '/details';

  final String title;
  final String subtitle;
  final String url;
  final String description;
  final bool? isFavorite;

  final VoidCallback onAddToFavorites;
  final VoidCallback onRemoveFromFavorites;

  const DetailsWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.url,
    required this.onAddToFavorites,
    required this.onRemoveFromFavorites,
    required this.isFavorite,
  });

  @override
  State<DetailsWidget> createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
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
            child: Image.network(widget.url),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 0.0,
              left: 16.0,
              top: 16.0,
              right: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  //'Bonjour,',
                  widget.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 15),
                Text(
                  //'Recherchez une sortie, un concert ou un évènement',
                  widget.subtitle,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                IconButton(
                    onPressed:
                      widget.isFavorite == true ? widget.onRemoveFromFavorites : widget.onAddToFavorites
                    , icon: widget.isFavorite == true ? const Icon(Icons.favorite) : const Icon(Icons.favorite_outline)
                ),
                Text(widget.description.replaceAll(RegExp(r'<.+?>'), '')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
