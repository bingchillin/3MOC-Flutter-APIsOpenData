import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

FirebaseAnalytics analytics = FirebaseAnalytics.instance;

class Details extends StatelessWidget {
  static const String routeName = '/details';

  const Details({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    analytics.setCurrentScreen(screenName: routeName);
    return const Placeholder();
  }
}