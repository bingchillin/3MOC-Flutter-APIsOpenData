import 'package:flutter/material.dart';
import 'package:apis_open_data/webservices/event.dart';
import 'package:apis_open_data/webservices/eventWebservice.dart';

import '../pages/details.dart';

class EventWidget extends StatefulWidget {
  const EventWidget({Key? key}) : super(key: key);

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  final String url =
      "https://fastly.picsum.photos/id/1047/200/300.jpg?blur=5&hmac=o8e3RqTLsttzlMCBtvlGmuwSXFJqhhWQ6Wrgdb5QltA";

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder<List<Event>>(
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

              return Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const TextField(
                    //onChanged: (value) => _runFilter(value),
                    decoration: InputDecoration(
                        labelText: 'Nom de l\'évènement...',
                        suffixIcon: Icon(Icons.search)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: events.length,
                      itemBuilder: (context, index) {
                        final event = events[index];
                        return ListTile(
                          leading: Image.network(url),
                          title: Text(event.title,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleLarge),
                          subtitle: Text(event.dateStart,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleSmall),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailsWidget(
                                      title: events[index].title,
                                      subtitle: events[index].dateStart,
                                      url: url,
                                    ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
