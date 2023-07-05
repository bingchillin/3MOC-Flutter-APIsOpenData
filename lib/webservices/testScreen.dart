import 'package:flutter/material.dart';
import 'package:apis_open_data/webservices/event.dart';
import 'package:apis_open_data/webservices/eventWebservice.dart';
import 'package:apis_open_data/webservices/eventWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: EventWidget(),
    );
  }
}

class WebServicesHome extends StatefulWidget {
  const WebServicesHome({Key? key}) : super(key: key);

  @override
  State<WebServicesHome> createState() => _WebServicesHomeState();
}

class _WebServicesHomeState extends State<WebServicesHome> {
  bool _loading = true;
  final List<Event> _events = [];
  String? _error;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    try {
      final events = await EventWebServices.getAllEvents();
      setState(() {
        _loading = false;
        _events.addAll(events);
      });
    } catch (error) {
      setState(() {
        _loading = false;
        _error = 'Une erreur est survenue';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coucou'),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    if(_loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_error != null) {
      return Center(
        child: Text(_error ?? ''),
      );
    }

    if(_events.isEmpty) {
      return const Center(
        child: Text('Oups, aucun utilisateur'),
      );
    }

    return ListView.builder(
      itemCount: _events.length,
      itemBuilder: (context, index) {
        final event = _events[index];
        return ListTile(
          title: Text('${event.title}'),
        );
      },
    );
  }
}
