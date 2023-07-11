import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

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

void main() {
  testWidgets("Test that the title widget has correct content", (widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(home: TitleWidget(title: "toto", subtitle: "tata"),));

    final titleFinder = find.text("toto");
    final subTitleFinder = find.text("tata");

    expect(titleFinder, findsOneWidget);
    expect(subTitleFinder, findsOneWidget);
  });
}

