import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  final List<Map<String, dynamic>> _allEvents = [
    {"id": 1, "title": "Paris", "subtitle": 75012},
    {"id": 2, "title": "Lyon", "subtitle": 00},
    {"id": 3, "title": "Marseille", "subtitle": 13},
    {"id": 4, "title": "Woippy", "subtitle": 56},
    {"id": 5, "title": "Candy", "subtitle": 21},
    {"id": 6, "title": "Croustibat", "subtitle": 55},
    {"id": 7, "title": "Oignon", "subtitle": 30},
    {"id": 8, "title": "Banana", "subtitle": 14},
    {"id": 9, "title": "Dooferschmitt", "subtitle": 100},
    {"id": 10, "title": "Becky", "subtitle": 32},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundEvents = [];

  @override
  initState() {
    _foundEvents = _allEvents;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allEvents;
    } else {
      results = _allEvents
          .where((event) =>
              event["title"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
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
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundEvents.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundEvents.length,
                      itemBuilder: (context, index) => ListTile(
                        leading: Text(
                          _foundEvents[index]["id"].toString(),
                          style: const TextStyle(
                              fontSize: 24, color: Colors.white),
                        ),
                        title: Text(_foundEvents[index]['title'],
                            style: Theme.of(context).textTheme.titleLarge),
                        subtitle: Text(
                            _foundEvents[index]["subtitle"].toString(),
                            style: Theme.of(context).textTheme.titleMedium),
                      ),
                    )
                  : Text(
                      'No results found',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
