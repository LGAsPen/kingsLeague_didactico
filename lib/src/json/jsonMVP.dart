// ignore_for_file: file_names

import 'dart:convert';

JsonMvp jsonMvpFromJson(String str) => JsonMvp.fromJson(json.decode(str));

String jsonMvpToJson(JsonMvp data) => json.encode(data.toJson());

class JsonMvp {
  JsonMvp({
    required this.playerName,
    required this.gamesPlayed,
    required this.mvps,
    required this.rank,
    required this.team,
    required this.image,
    required this.playerImage,
    required this.teamId,
  });

  String playerName;
  int gamesPlayed;
  int mvps;
  int rank;
  String team;
  String image;
  String playerImage;
  String teamId;

  factory JsonMvp.fromJson(Map<String, dynamic> json) => JsonMvp(
        playerName: json["playerName"],
        gamesPlayed: json["gamesPlayed"],
        mvps: json["mvps"],
        rank: json["rank"],
        team: json["team"],
        image: json["image"],
        playerImage: json["playerImage"],
        teamId: json["teamId"],
      );

  Map<String, dynamic> toJson() => {
        "playerName": playerName,
        "gamesPlayed": gamesPlayed,
        "mvps": mvps,
        "rank": rank,
        "team": team,
        "image": image,
        "playerImage": playerImage,
        "teamId": teamId,
      };
}
