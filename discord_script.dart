import 'package:http/http.dart' as http;

void main() {
  sendDiscordMessage();
}

void sendDiscordMessage() async {
  String url = 'https://discord.com/api/webhooks/1126240339582259331/uYs7XrwLOderBCt-ru3dr4wcl9mXg6roDNRbmWIVAEg8SegfiMKZOFtB1rA86JEMQSub';
  String message = 'Si ça marche j\'insulte Kenny' ;

  final response = await http.post(
    Uri.parse(url),
    body: {'content': message},
  );

  if (response.statusCode == 200 || response.statusCode == 204) {
    print('Message sent to Discord successfully!');
  } else {
    print('Failed to send message to Discord. Status code: ${response.statusCode}');
  }
}
