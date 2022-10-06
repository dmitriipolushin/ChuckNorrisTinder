import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> getNewJoke() async {
  var response =
      await http.get(Uri.parse('https://api.chucknorris.io/jokes/random'));
  return jsonDecode(response.body)['value'];
}
