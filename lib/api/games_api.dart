import 'dart:convert';

import 'package:games/models/games_model.dart';
import 'package:games/utilites/constants.dart';

import 'package:http/http.dart' as http;

class GameScoresApi {
  Future<GamesScores> fetchGameScores({
    required String leagueId,
    required String year,
  }) async {
    try {
      final queryParams = {
        'APPID': Constants.GAMES_APP_ID,
        'leagueid': leagueId,
        'year': year,
      };

      final uri = Uri.https(
        Constants.GAMES_BASE_URL_DOMAIN,
        Constants.GAMES_OF_LEAGUE_PATH,
        queryParams,
      );

      print('🌐 Request URI: $uri');

      final response = await http.get(uri);
      print('🔁 Status Code: ${response.statusCode}');
      print('📦 Response Body: ${response.body}');

      if (response.statusCode == 200) {
        return GamesScores.fromJson(json.decode(response.body));
      } else {
        throw Exception('Bad response: ${response.statusCode}');
      }
    } catch (e) {
      print('🔥 Exception in fetchGameScores: $e');
      rethrow;
    }
  }
}
