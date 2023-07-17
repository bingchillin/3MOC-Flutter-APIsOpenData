import 'dart:ui';

import 'package:apis_open_data/pages/favorites.dart';
import 'package:apis_open_data/pages/home.dart';
import 'package:apis_open_data/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack);
      return true;
    };
  } catch(error) {
    debugPrint('Failed to init firebase : $error');
  }

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

    return AppStateWidget(
      child: MaterialApp(
        title: 'Flutter Interface',
        theme: darkTheme,
        home: const MyNavigationWidget(),
        initialRoute: MyHomePage.routeName,
        routes: {
          Favorites.routeName: (context) => const Favorites(),
        },
      ),
    );
  }
}

class AppState {
  final Set<String> favorites;

  AppState({
    this.favorites = const <String>{},
  });

  AppState copyWith({
    Set<String>? favorites,
  }) {
    return AppState(
      favorites: favorites ?? this.favorites,
    );
  }
}

class AppStateScope extends InheritedWidget {
  final AppState data;

  const AppStateScope(
    this.data, {
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static AppState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppStateScope>()!.data;

    //assert(result != null, 'No InheritedFavorites found in context');

    // return result;
  }

  @override
  bool updateShouldNotify(AppStateScope oldWidget) {
    return oldWidget.data != data;
  }
}

class AppStateWidget extends StatefulWidget {
  final Widget child;

  const AppStateWidget({required this.child, Key? key}) : super(key: key);

  static AppStateWidgetState of(BuildContext context) {
    return context.findAncestorStateOfType<AppStateWidgetState>()!;
  }

  @override
  State<AppStateWidget> createState() => AppStateWidgetState();
}

class AppStateWidgetState extends State<AppStateWidget> {
  AppState _data = AppState();

  void addToFavorites(String id) {
    debugPrint('add $id');
    if (!_data.favorites.contains(id)) {
      final Set<String> newFavorites = Set<String>.from(_data.favorites);
      newFavorites.add(id);
      setState(() {
        _data = _data.copyWith(
          favorites: newFavorites,
        );
      });
    }
  }

  void removeFromFavorites(String id) {
    debugPrint('remove $id');

    if (_data.favorites.contains(id)) {
      final Set<String> newFavorites = Set<String>.from(_data.favorites);
      newFavorites.remove(id);
      setState(() {
        _data = _data.copyWith(
          favorites: newFavorites,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppStateScope(_data, child: widget.child);
  }
}

class MyNavigationWidget extends StatefulWidget {
  const MyNavigationWidget({super.key});

  @override
  State<MyNavigationWidget> createState() => _MyNavigationWidgetState();
}

class _MyNavigationWidgetState extends State<MyNavigationWidget> {
  int currentPageIndex = 0;

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: [
        const MyHomePage(),
        const Favorites(),
      ][currentPageIndex],
      // Barre de navigation ---------------------------------------------------
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Accueil'),
          NavigationDestination(
            icon: AppStateScope.of(context).favorites.isNotEmpty
                ? Badge(
                    label: Text(
                        AppStateScope.of(context).favorites.length.toString()),
                    child: const Icon(Icons.favorite_outline))
                : const Icon(Icons.favorite_outline),
            selectedIcon: AppStateScope.of(context).favorites.isNotEmpty
                ? Badge(
                    label: Text(
                        AppStateScope.of(context).favorites.length.toString()),
                    child: const Icon(Icons.favorite))
                : Text(AppStateScope.of(context).favorites.length.toString()),
            label: 'Favoris',
          ),
        ],
        selectedIndex: currentPageIndex,
        animationDuration: const Duration(milliseconds: 200),
        onDestinationSelected: (index) async {
          await analytics.logEvent(
            name: 'navigation_widget_pressed',
            parameters: <String, dynamic>{
              'selected_index': index,
            },
          );

          setState(() {
            currentPageIndex = index;
          });
        },
      ),
    );
  }
}
