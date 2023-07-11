import 'package:flutter/material.dart';

import '../pages/details.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  // Liste random
  final List<Map<String, dynamic>> _allEvents = [
    {"id": 1, "title": "Paris", "subtitle": 75012, "url": "https://fastly.picsum.photos/id/1047/200/300.jpg?blur=5&hmac=o8e3RqTLsttzlMCBtvlGmuwSXFJqhhWQ6Wrgdb5QltA"},
    {"id": 2, "title": "Lyon", "subtitle": 00, "url": "https://fastly.picsum.photos/id/1047/200/300.jpg?blur=5&hmac=o8e3RqTLsttzlMCBtvlGmuwSXFJqhhWQ6Wrgdb5QltA"},
    {"id": 3, "title": "Marseille", "subtitle": 13, "url": "https://fastly.picsum.photos/id/1047/200/300.jpg?blur=5&hmac=o8e3RqTLsttzlMCBtvlGmuwSXFJqhhWQ6Wrgdb5QltA"},
    {"id": 4, "title": "Woippy", "subtitle": 56, "url": "https://fastly.picsum.photos/id/1047/200/300.jpg?blur=5&hmac=o8e3RqTLsttzlMCBtvlGmuwSXFJqhhWQ6Wrgdb5QltA"},
    {"id": 5, "title": "Candy", "subtitle": 21, "url": "https://fastly.picsum.photos/id/1047/200/300.jpg?blur=5&hmac=o8e3RqTLsttzlMCBtvlGmuwSXFJqhhWQ6Wrgdb5QltA"},
    {"id": 6, "title": "Croustibat", "subtitle": 55, "url": "https://fastly.picsum.photos/id/1047/200/300.jpg?blur=5&hmac=o8e3RqTLsttzlMCBtvlGmuwSXFJqhhWQ6Wrgdb5QltA"},
    {"id": 7, "title": "Oignon", "subtitle": 30, "url": "https://fastly.picsum.photos/id/1047/200/300.jpg?blur=5&hmac=o8e3RqTLsttzlMCBtvlGmuwSXFJqhhWQ6Wrgdb5QltA"},
    {"id": 8, "title": "Banana", "subtitle": 14, "url": "https://fastly.picsum.photos/id/1047/200/300.jpg?blur=5&hmac=o8e3RqTLsttzlMCBtvlGmuwSXFJqhhWQ6Wrgdb5QltA"},
    {"id": 9, "title": "Dooferschmitt", "subtitle": 100, "url": "https://fastly.picsum.photos/id/1047/200/300.jpg?blur=5&hmac=o8e3RqTLsttzlMCBtvlGmuwSXFJqhhWQ6Wrgdb5QltA"},
    {"id": 10, "title": "Kanye Paris", "subtitle": 32, "url": "https://fastly.picsum.photos/id/1047/200/300.jpg?blur=5&hmac=o8e3RqTLsttzlMCBtvlGmuwSXFJqhhWQ6Wrgdb5QltA"},
  ];

  // Liste vide pour stocker les résultats de la recherche
  List<Map<String, dynamic>> _foundEvents = [];

  @override
  initState() {
    _foundEvents = _allEvents;
    super.initState();
  }

  // Fonction de filtre, appelée à chaque changement dans le TextField
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    // Affichage de tous les events si le champ de recherche est vide
    if (enteredKeyword.isEmpty) {
      results = _allEvents;
    } else {
      results = _allEvents
          .where((event) => event["title"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // toLowerCase() pour rendre la recherche insensible à la casse
    }

    setState(() {
      _foundEvents = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Nom de l\'évènement...', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              // Ternaire pour afficher la liste des résultats ou un message si aucun résultat
              child: _foundEvents.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundEvents.length,
                      itemBuilder: (context, index) => ListTile(
                        // Id---------------------------------------------------
                        leading: Image.network(_foundEvents[index]['url'].toString()),

                        // Titre de l'event-------------------------------------
                        title: Text(_foundEvents[index]['title'].toString(),
                            style: Theme.of(context).textTheme.titleLarge),

                        // Sous-titre de l'event--------------------------------
                        subtitle: Text(
                            _foundEvents[index]["subtitle"].toString(),
                            style: Theme.of(context).textTheme.titleMedium),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsWidget(
                                title: _foundEvents[index]['title'].toString(),
                                subtitle: _foundEvents[index]['subtitle'].toString(),
                                url: _foundEvents[index]['url'].toString(),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Text(
                      'Aucun évènement trouvé',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
