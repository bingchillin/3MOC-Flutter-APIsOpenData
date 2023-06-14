import 'package:flutter/material.dart';

class Listing extends StatelessWidget {

  static const String routeName = '/listing';

  const Listing({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded
        (
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Élément $index'),
              subtitle: Text('Sous-titre de l\'élément $index'),
            );
          },
        ),
      );
  }
}
