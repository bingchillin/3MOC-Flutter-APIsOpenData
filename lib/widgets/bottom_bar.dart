import 'package:flutter/material.dart';


class BottomBarWidget extends StatelessWidget {
  final void Function(int) onTap;

  const BottomBarWidget({
    Key? key,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Accueil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          activeIcon: Icon(Icons.favorite),
          label: 'Favoris',
        ),
      ],
      onTap: onTap,
    );
  }
}

class Material3NavigationBar extends StatefulWidget {
  const Material3NavigationBar({super.key});

  @override
  State<Material3NavigationBar> createState() => _Material3NavigationBarState();
}

class _Material3NavigationBarState extends State<Material3NavigationBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(destinations: [
      NavigationDestination(icon: Icon(Icons.home), label: 'Accueil'),
      NavigationDestination(icon: Icon(Icons.favorite), label: 'Favoris'),
    ]);
  }
}
