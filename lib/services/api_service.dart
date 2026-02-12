import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/pokemon.dart';

class ApiService {
  static const String _baseUrl = 'https://api.pokemontcg.io/v2';
  
  String get _apiKey => dotenv.env['API_KEY'] ?? '';

  Future<List<PokemonCard>> fetchCards({
    int page = 1,
    int pageSize = 20,
    String? query,
  }) async {
    final Map<String, String> qParams = {
      'page': page.toString(),
      'pageSize': pageSize.toString(),
    };
    if (query != null && query.isNotEmpty) {
      qParams['q'] = 'name:"$query*"';
    }
    
    final Uri url = Uri.parse('$_baseUrl/cards').replace(queryParameters: qParams);

    final response = await http.get(
      url,
      headers: _apiKey.isNotEmpty ? {'X-Api-Key': _apiKey} : {},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> cardsJson = data['data'];
      return cardsJson.map((json) => PokemonCard.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cards: ${response.statusCode}');
    }
  }
}
