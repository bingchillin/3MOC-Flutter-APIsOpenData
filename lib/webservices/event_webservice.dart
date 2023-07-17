import 'dart:convert';

import 'package:apis_open_data/webservices/event.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class EventWebServices{
  static Future<List<Event>> getAllEvents({required Set<String>? filter}) async{
    try{
      final response = await http.get(Uri.parse('https://opendata.paris.fr/api/records/1.0/search/?dataset=que-faire-a-paris-&q=&lang=FR&rows=10&facet=date_start&facet=date_end&facet=address_name&facet=address_zipcode&facet=address_city&facet=pmr&facet=price_type&facet=access_type&facet=updated_at&facet=programs'));
      switch(response.statusCode){
        case 200:
          Map<String, dynamic>? mapResponse = json.decode(response.body) as Map<String, dynamic>?;

          if(mapResponse == null){
            return [];
          }

          final events = mapResponse['records'].cast<Map<String, dynamic>>();
          //debugPrint(filter as String?);
          if(filter != null) {
            return events.map<Event>((json) => Event.fromJson(json)).where((e) => filter.contains(e.title)).toList();
          }
          return events.map<Event>((json) => Event.fromJson(json)).toList();
        default:
          throw Exception('Failed to load events');
      }
    }catch(error){
      debugPrint('Error getting all events $error');
      rethrow;
    }
  }


}

