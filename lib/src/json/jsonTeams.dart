// ignore_for_file: file_names

import 'dart:convert';

List<JsonTeams?>? jsonTeamsFromJson(String str) => json.decode(str) == null
    ? []
    : List<JsonTeams?>.from(
        json.decode(str)!.map((x) => JsonTeams.fromJson(x)));

String jsonTeamsToJson(List<JsonTeams?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class ResponseTeams {
  final List<JsonTeams?> jsonTeams;
  ResponseTeams(this.jsonTeams);

  factory ResponseTeams.fromJson(String json) =>
      ResponseTeams(jsonTeamsFromJson(json)!);
}

class JsonTeams {
  JsonTeams({
    this.id,
    this.color,
    this.name,
    this.image,
    this.imageWhite,
    this.url,
    this.presidentId,
    this.channel,
    this.socialNetworks,
    this.players,
    this.coach,
    this.shortName,
    this.coachInfo,
  });

  String? id;
  String? color;
  String? name;
  String? image;
  String? imageWhite;
  String? url;
  String? presidentId;
  String? channel;
  List<String?>? socialNetworks;
  List<Player?>? players;
  String? coach;
  String? shortName;
  CoachInfo? coachInfo;

  factory JsonTeams.fromJson(Map<String, dynamic> json) => JsonTeams(
        id: json["id"],
        color: json["color"],
        name: json["name"],
        image: json["image"],
        imageWhite: json["imageWhite"],
        url: json["url"],
        presidentId: json["presidentId"],
        channel: json["channel"],
        socialNetworks: json["socialNetworks"] == null
            ? []
            : List<String?>.from(json["socialNetworks"]!.map((x) => x)),
        players: json["players"] == null
            ? []
            : List<Player?>.from(
                json["players"]!.map((x) => Player.fromJson(x))),
        coach: json["coach"],
        shortName: json["shortName"],
        coachInfo: CoachInfo.fromJson(json["coachInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "color": color,
        "name": name,
        "image": image,
        "imageWhite": imageWhite,
        "url": url,
        "presidentId": presidentId,
        "channel": channel,
        "socialNetworks": socialNetworks == null
            ? []
            : List<dynamic>.from(socialNetworks!.map((x) => x)),
        "players": players == null
            ? []
            : List<dynamic>.from(players!.map((x) => x!.toJson())),
        "coach": coach,
        "shortName": shortName,
        "coachInfo": coachInfo!.toJson(),
      };
}

class CoachInfo {
  CoachInfo({
    this.name,
    this.image,
  });

  String? name;
  String? image;

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
    this.id,
    this.dorsalName,
    this.fullName,
    this.role,
    this.image,
    this.stats,
  });

  String? id;
  String? dorsalName;
  String? fullName;
  Role? role;
  String? image;
  Stats? stats;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json["id"],
        dorsalName: json["dorsalName"],
        fullName: json["fullName"],
        role: roleValues.map[json["role"]],
        image: json["image"],
        stats: Stats.fromJson(json["stats"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dorsalName": dorsalName,
        "fullName": fullName,
        "role": roleValues.reverse![role],
        "image": image,
        "stats": stats!.toJson(),
      };
}

// ignore: constant_identifier_names
enum Role { JUGADOR_11, DEFENSA, DELANTERO, MEDIO, PORTERO }

final roleValues = EnumValues({
  "Defensa": Role.DEFENSA,
  "Delantero": Role.DELANTERO,
  "jugador 11": Role.JUGADOR_11,
  "Medio": Role.MEDIO,
  "Portero": Role.PORTERO
});

class Stats {
  Stats({
    this.speed,
    this.physique,
    this.shooting,
    this.passing,
    this.talent,
    this.defense,
    this.score,
    this.reflexes,
    this.saves,
    this.kickoff,
    this.stretch,
  });

  int? speed;
  int? physique;
  int? shooting;
  int? passing;
  int? talent;
  int? defense;
  int? score;
  int? reflexes;
  int? saves;
  int? kickoff;
  int? stretch;

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        speed: json["speed"],
        physique: json["physique"],
        shooting: json["shooting"],
        passing: json["passing"],
        talent: json["talent"],
        defense: json["defense"],
        score: json["score"],
        reflexes: json["reflexes"],
        saves: json["saves"],
        kickoff: json["kickoff"],
        stretch: json["stretch"],
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "physique": physique,
        "shooting": shooting,
        "passing": passing,
        "talent": talent,
        "defense": defense,
        "score": score,
        "reflexes": reflexes,
        "saves": saves,
        "kickoff": kickoff,
        "stretch": stretch,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
