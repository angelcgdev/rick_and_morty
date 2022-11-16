import 'dart:convert';

import 'package:helloworld/src/models/characters.model.dart';
import 'package:http/http.dart' as http;

class MainService {
  static Future<Characters?> getCharacters() async {
    try {
      final url = Uri.https('rickandmortyapi.com', '/api/character');
      final response = await http.get(url);
      return Characters.fromJson(jsonDecode(response.body));
    } catch (error) {
      return null;
    }
  }
}
