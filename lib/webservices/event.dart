class Event {
  final String title;
  final String dateStart;
  final String dateEnd;
  final String description;
  final String coverUrl;
  final String address;



  Event({
    required this.title,
    required this.dateStart,
    required this.dateEnd,
    required this.description,
    required this.coverUrl,
    required this.address,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      title: json['fields']['title'] != null ? json['fields']['title'] as String : '',
      dateStart: json['fields']['date_start'] != null ? json['fields']['date_start'] as String : '',
      dateEnd: json['fields']['date_end'] != null ? json['fields']['date_end'] as String : '',
      description: json['fields']['description'] != null ? json['fields']['description'] as String : '',
      coverUrl: json['fields']['cover_url'] != null ? json['fields']['cover_url'] as String : '',
      address: json['fields']['address_text'] != null ? json['fields']['address_text'] as String : '',
    );
  }

  @override
  String toString() {
    return 'Event{title: $title, dateStart: $dateStart, dateEnd: $dateEnd, description: $description, coverUrl: $coverUrl, address: $address}';
  }
}