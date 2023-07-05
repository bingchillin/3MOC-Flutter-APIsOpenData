import 'package:flutter/material.dart';
import 'package:apis_open_data/webservices/event.dart';
import 'package:apis_open_data/webservices/eventWebservice.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EventWidget'),
      ),
      body: FutureBuilder<List<Event>>(
        future: EventWebServices.getAllEvents(),
        builder: (context, AsyncSnapshot<List<Event>> snapShot) {
          if (snapShot.hasError) {
            return const Center(
              child: Text('Erreur'),
            );
          }

          if (snapShot.hasData) {
            final events = snapShot.data;
            if (events == null || events.isEmpty) {
              return const Center(child: Text('No events'));
            }

            return ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                return ListTile(
                  title: Text('${event.title}'),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
