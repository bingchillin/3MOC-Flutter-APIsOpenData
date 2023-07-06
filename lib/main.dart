import 'package:apis_open_data/pages/favorites.dart';
import 'package:apis_open_data/pages/home.dart';
import 'package:apis_open_data/widgets/app_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final MaterialColor customColor = const MaterialColor(
    0xFF9AE19D,
    <int, Color>{
      50: Color(0xFFE1F6E6),
      100: Color(0xFFB7E7B8),
      200: Color(0xFF8FD98E),
      300: Color(0xFF67CA63),
      400: Color(0xFF41BD45),
      500: Color(0xFF1CB020),
      600: Color(0xFF1AA81D),
      700: Color(0xFF17961A),
      800: Color(0xFF138417),
      900: Color(0xFF0E7011),
    },
  );

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Données pour le thème (dark + couleurs vertes) --------------------------
    final darkTheme = ThemeData.dark().copyWith(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: customColor,
      ),
    );

    return MaterialApp(
      title: 'Flutter Interface',
      theme: darkTheme,
      home: const MyNavigationWidget(),
      initialRoute: MyHomePage.routeName,
      routes: {
        Favorites.routeName: (context) => const Favorites(),
      },
    );
  }
}

class MyNavigationWidget extends StatefulWidget {
  const MyNavigationWidget({super.key});

  @override
  State<MyNavigationWidget> createState() => _MyNavigationWidgetState();
}

class _MyNavigationWidgetState extends State<MyNavigationWidget> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: [
        MyHomePage(),
        Favorites(),
      ][currentPageIndex],
      // Barre de navigation ---------------------------------------------------
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Accueil'),
          NavigationDestination(icon: Icon(Icons.favorite), label: 'Favoris'),
        ],
        onDestinationSelected: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
    );
  }
}
