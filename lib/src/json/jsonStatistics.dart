// ignore_for_file: file_names

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
    required this.team,
    required this.rank,
  });

  int wins;
  int losses;
  int scoredGoals;
  int concededGoals;
  int yellowCards;
  int redCards;
  Team team;
  int rank;

  factory JsonLeaderboard.fromJson(Map<String, dynamic> json) =>
      JsonLeaderboard(
        wins: json["wins"],
        losses: json["losses"],
        scoredGoals: json["scoredGoals"],
        concededGoals: json["concededGoals"],
        yellowCards: json["yellowCards"],
        redCards: json["redCards"],
        team: Team.fromJson(json["team"]),
        rank: json["rank"],
      );

  Map<String, dynamic> toJson() => {
        "wins": wins,
        "losses": losses,
        "scoredGoals": scoredGoals,
        "concededGoals": concededGoals,
        "yellowCards": yellowCards,
        "redCards": redCards,
        "team": team.toJson(),
        "rank": rank,
      };
}

class Team {
  Team({
    required this.color,
    required this.id,
    required this.name,
    required this.image,
    required this.imageWhite,
    required this.url,
    required this.channel,
    required this.socialNetworks,
    required this.players,
    required this.coach,
    required this.shortName,
    required this.coachInfo,
    required this.president,
  });

  String color;
  String id;
  String name;
  String image;
  String imageWhite;
  String url;
  String channel;
  List<String> socialNetworks;
  List<Player> players;
  String coach;
  String shortName;
  CoachInfo coachInfo;
  President president;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        color: json["color"],
        id: json["id"],
        name: json["name"],
        image: json["image"],
        imageWhite: json["imageWhite"],
        url: json["url"],
        channel: json["channel"],
        socialNetworks: List<String>.from(json["socialNetworks"].map((x) => x)),
        players:
            List<Player>.from(json["players"].map((x) => Player.fromJson(x))),
        coach: json["coach"],
        shortName: json["shortName"],
        coachInfo: CoachInfo.fromJson(json["coachInfo"]),
        president: President.fromJson(json["president"]),
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "id": id,
        "name": name,
        "image": image,
        "imageWhite": imageWhite,
        "url": url,
        "channel": channel,
        "socialNetworks": List<dynamic>.from(socialNetworks.map((x) => x)),
        "players": List<dynamic>.from(players.map((x) => x.toJson())),
        "coach": coach,
        "shortName": shortName,
        "coachInfo": coachInfo.toJson(),
        "president": president.toJson(),
      };
}

class CoachInfo {
  CoachInfo({
    required this.name,
    required this.image,
  });

  String name;
  String image;

  factory CoachInfo.fromJson(Map<String, dynamic> json) => CoachInfo(
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
      };
}

class Player {
  Player({
    required this.id,
    required this.dorsalName,
    required this.fullName,
    required this.role,
    required this.image,
    required this.stats,
  });

  String id;
  String dorsalName;
  String fullName;
  Role role;
  String image;
  Stats stats;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json["id"],
        dorsalName: json["dorsalName"],
        fullName: json["fullName"],
        role: roleValues.map[json["role"]]!,
        image: json["image"],
        stats: Stats.fromJson(json["stats"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dorsalName": dorsalName,
        "fullName": fullName,
        "role": roleValues.reverse[role],
        "image": image,
        "stats": stats.toJson(),
      };
}

// ignore: constant_identifier_names
enum Role { JUGADOR_11, PORTERO, DELANTERO, DEFENSA, MEDIO }

final roleValues = EnumValues({
  "Defensa": Role.DEFENSA,
  "Delantero": Role.DELANTERO,
  "jugador 11": Role.JUGADOR_11,
  "Medio": Role.MEDIO,
  "Portero": Role.PORTERO
});

class Stats {
  Stats({
    this.reflexes,
    this.saves,
    this.kickoff,
    this.stretch,
    this.score,
    this.speed,
    this.physique,
    this.shooting,
    this.passing,
    this.talent,
    this.defense,
  });

  int? reflexes;
  int? saves;
  int? kickoff;
  int? stretch;
  int? score;
  int? speed;
  int? physique;
  int? shooting;
  int? passing;
  int? talent;
  int? defense;

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        reflexes: json["reflexes"],
        saves: json["saves"],
        kickoff: json["kickoff"],
        stretch: json["stretch"],
        score: json["score"],
        speed: json["speed"],
        physique: json["physique"],
        shooting: json["shooting"],
        passing: json["passing"],
        talent: json["talent"],
        defense: json["defense"],
      );

  Map<String, dynamic> toJson() => {
        "reflexes": reflexes,
        "saves": saves,
        "kickoff": kickoff,
        "stretch": stretch,
        "score": score,
        "speed": speed,
        "physique": physique,
        "shooting": shooting,
        "passing": passing,
        "talent": talent,
        "defense": defense,
      };
}

class President {
  President({
    required this.id,
    required this.name,
    required this.image,
    required this.teamId,
  });

  String id;
  String name;
  String image;
  String teamId;

  factory President.fromJson(Map<String, dynamic> json) => President(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        teamId: json["teamId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "teamId": teamId,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
