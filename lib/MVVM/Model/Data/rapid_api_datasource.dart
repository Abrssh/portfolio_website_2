import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RapidApiDataSource {
  Future<List<dynamic>> fetchPlayers(String metric) async {
    final apiKey = dotenv.env['rapidapi_football_api_key2'];

    String endpoint;
    switch (metric) {
      case "goals":
        endpoint =
            "https://free-api-live-football-data.p.rapidapi.com/football-get-top-players-by-goals?leagueid=47";
        break;
      case "assists":
        endpoint =
            "https://free-api-live-football-data.p.rapidapi.com/football-get-top-players-by-assists?leagueid=47";
        break;
      case "rating":
        endpoint =
            "https://free-api-live-football-data.p.rapidapi.com/football-get-top-players-by-rating?leagueid=47";
        break;
      default:
        throw Exception("Invalid sorting metric selected.");
    }

    try {
      final response = await http.get(
        Uri.parse(endpoint),
        headers: {
          'X-RapidAPI-Key': apiKey!,
          'X-RapidAPI-Host': 'free-api-live-football-data.p.rapidapi.com',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['response']['players'];
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized access. API needs to be Updated.");
      } else if (response.statusCode == 403 || response.statusCode == 429) {
        throw Exception("API limit exceeded. Please try again later.");
      } else if (response.statusCode == 404) {
        throw Exception("Data not found. API endpoint may have changed.");
      } else if (response.statusCode == 500) {
        throw Exception("Server error. Please try again later.");
      } else {
        throw Exception(
            "Failed to fetch players. Error code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("An Unknown error occurred. $e");
    }
  }
}
