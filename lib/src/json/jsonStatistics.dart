// To parse this JSON data, do
//
//     final jsonLeaderboard = jsonLeaderboardFromJson(jsonString);

import 'dart:convert';

List<JsonLeaderboard> jsonLeaderboardFromJson(String str) =>
    List<JsonLeaderboard>.from(
        json.decode(str).map((x) => JsonLeaderboard.fromJson(x)));

String jsonLeaderboardToJson(List<JsonLeaderboard> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JsonLeaderboard {
  JsonLeaderboard({
    required this.wins,
    required this.losses,
    required this.scoredGoals,
    required this.concededGoals,
    required this.yellowCards,
    required this.redCards,
    required this.rank,
    required this.team,
  });

  int wins;
  int losses;
  int scoredGoals;
  int concededGoals;
  int yellowCards;
  int redCards;
  int rank;
  Team team;

  factory JsonLeaderboard.fromJson(Map<String, dynamic> json) =>
      JsonLeaderboard(
        wins: json["wins"],
        losses: json["losses"],
        scoredGoals: json["scoredGoals"],
        concededGoals: json["concededGoals"],
        yellowCards: json["yellowCards"],
        redCards: json["redCards"],
        rank: json["rank"],
        team: Team.fromJson(json["team"]),
      );

  Map<String, dynamic> toJson() => {
        "wins": wins,
        "losses": losses,
        "scoredGoals": scoredGoals,
        "concededGoals": concededGoals,
        "yellowCards": yellowCards,
        "redCards": redCards,
        "rank": rank,
        "team": team.toJson(),
      };
}

class Team {
  Team({
    required this.id,
    required this.name,
    required this.image,
    required this.coach,
    required this.shortName,
  });

  String id;
  String name;
  String image;
  String coach;
  String shortName;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        coach: json["coach"],
        shortName: json["shortName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "coach": coach,
        "shortName": shortName,
      };
}
