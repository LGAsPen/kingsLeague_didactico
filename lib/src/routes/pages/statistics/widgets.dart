import 'package:flutter/material.dart';

class StatisticsWidget {
  final decoration = BoxDecoration(
    borderRadius: BorderRadius.circular(12.0),
    gradient: LinearGradient(colors: <Color>[
      Colors.white.withOpacity(0.2),
      Colors.white.withOpacity(0.5),
    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
  );

  final mvpDecoration = const BoxDecoration(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12), topRight: Radius.circular(12)),
    color: Colors.white,
  );

  final stylePlayerName = const TextStyle(
    color: Colors.white,
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
  );

  final styleTeam = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  final styleMVP = const TextStyle(
    fontSize: 23,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
}
