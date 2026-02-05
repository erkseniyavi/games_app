import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:games/models/games_model.dart';

class LeagueView extends StatelessWidget {
  final AsyncSnapshot<GamesScores> snapshot;
  const LeagueView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var leagueName = snapshot
        .data
        ?.data?[0]
        .season
        ?.league
        ?.name; // данные снэпшота + сам список данных
    var country = snapshot
        .data
        ?.data?[0]
        .season
        ?.league
        ?.country
        ?.name; // данные снэпшота + сам список данных

    var matchsCount = snapshot.data?.data?.length;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${leagueName}, ${country}", style: TextStyle(fontSize: 27)),
          Container(
            height: 150,
            child: Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      width: 200,
                      child: Card(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: ListTile(
                          title: Text(("Матч №${(index + 1)}")),
                          subtitle: Text(
                            "${snapshot.data?.data?[index].homeTeam?.name} - ${snapshot.data?.data?[index].awayTeam?.name}, \n ${snapshot.data?.data?[index].homeResult} - ${snapshot.data?.data?[index].awayResult}",
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: matchsCount,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
