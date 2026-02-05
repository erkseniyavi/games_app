import 'package:flutter/material.dart';
import 'package:games/api/games_api.dart';
import 'package:games/models/games_model.dart';
import 'package:games/widgets/league_view.dart';

class GameScoresScreen extends StatefulWidget {
  const GameScoresScreen({super.key});

  @override
  State<GameScoresScreen> createState() => _GameScoresScreenState();
}

class _GameScoresScreenState extends State<GameScoresScreen> {
  late Future<GamesScores> gamesScoresObject;
  String leagueId = '389';
  String year = '2025';

  @override
  void initState() {
    super.initState();
    gamesScoresObject = GameScoresApi().fetchGameScores(
      leagueId: leagueId,
      year: year,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: FutureBuilder<GamesScores>(
              future: gamesScoresObject,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      SizedBox(height: 50),
                      LeagueView(snapshot: snapshot),
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
