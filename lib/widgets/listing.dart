import 'package:apis_open_data/pages/details.dart';
import 'package:flutter/material.dart';

class Listing extends StatelessWidget {

  const Listing({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded
        (
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.network("https://fastly.picsum.photos/id/1047/200/300.jpg?blur=5&hmac=o8e3RqTLsttzlMCBtvlGmuwSXFJqhhWQ6Wrgdb5QltA"),
              title: Text('Élément $index'),
              subtitle: Text('Sous-titre de l\'élément $index'),
              onTap: () {
                // Naviguer vers la page des détails avec les paramètres title et subtitle
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailsWidget(),
                  ),
                );
              },
            );
          },
        ),
      );
  }
}
