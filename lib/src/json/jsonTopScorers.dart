// ignore_for_file: file_names

import 'dart:convert';

JsontopScorers jsontopScorersFromJson(String str) =>
    JsontopScorers.fromJson(json.decode(str));

String jsontopScorersToJson(JsontopScorers data) => json.encode(data.toJson());

class JsontopScorers {
  JsontopScorers({
    required this.rank,
    required this.playerName,
    required this.gamesPlayed,
    required this.goals,
    required this.team,
    required this.image,
    required this.playerImage,
    required this.teamId,
  });

  int rank;
  String playerName;
  int gamesPlayed;
  int goals;
  String team;
  String image;
  String playerImage;
  String teamId;

  factory JsontopScorers.fromJson(Map<String, dynamic> json) => JsontopScorers(
        rank: json["rank"],
        playerName: json["playerName"],
        gamesPlayed: json["gamesPlayed"],
        goals: json["goals"],
        team: json["team"],
        image: json["image"],
        playerImage: json["playerImage"],
        teamId: json["teamId"],
      );

  Map<String, dynamic> toJson() => {
        "rank": rank,
        "playerName": playerName,
        "gamesPlayed": gamesPlayed,
        "goals": goals,
        "team": team,
        "image": image,
        "playerImage": playerImage,
        "teamId": teamId,
      };
}
