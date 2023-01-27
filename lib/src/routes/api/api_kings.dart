import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ApiKings {
  getTeams() async {
    try {
      Response response =
          await http.get(Uri.parse('https://api.kingsleague.dev/teams'));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Pokemon type error');
      }
    } catch (e) {
      debugPrint('Pokemon type error');
    }
  }

  getLeaderboard() async {
    try {
      Response response =
          await get(Uri.parse('https://api.kingsleague.dev/leaderboard'));

      // dynamic jsonData = json.decode(response.body);
      //dynamic jsonLeaderboard = json.encode(jsonData['leaderboard']);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Pokemon type error');
      }
    } catch (e) {
      debugPrint('Pokemon type error');
    }
  }

  getStatistics() async {
    try {
      Response response =
          await get(Uri.parse('https://api.kingsleague.dev/top-statistics'));

      dynamic jsonData = json.decode(response.body);
      dynamic jsonLeaderboard = json.encode(jsonData['mvp']);

      if (response.statusCode == 200) {
        return jsonLeaderboard;
      } else {
        throw Exception('Pokemon type error');
      }
    } catch (e) {
      debugPrint('Pokemon type error');
    }
  }

  getStatisticsTopScorers() async {
    try {
      Response response =
          await get(Uri.parse('https://api.kingsleague.dev/top-statistics'));

      dynamic jsonData = json.decode(response.body);
      dynamic jsonLeaderboard = json.encode(jsonData['topScorers']);

      if (response.statusCode == 200) {
        return jsonLeaderboard;
      } else {
        throw Exception('Pokemon type error');
      }
    } catch (e) {
      debugPrint('Pokemon type error');
    }
  }
}
