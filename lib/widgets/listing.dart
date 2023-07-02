import 'package:apis_open_data/pages/details.dart';
import 'package:flutter/material.dart';

class Listing extends StatelessWidget {

  const Listing({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          final String title = 'Élément $index';
          final String subtitle = 'Sous-titre de l\'élément $index';
          const String url = "https://fastly.picsum.photos/id/1047/200/300.jpg?blur=5&hmac=o8e3RqTLsttzlMCBtvlGmuwSXFJqhhWQ6Wrgdb5QltA";

          return ListTile(
            leading: Image.network(url),
            title: Text(title),
            subtitle: Text(subtitle),

            //Accéder à la page de détails -------------------------------------
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsWidget(
                    title: title,
                    subtitle: subtitle,
                    url: url,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}