// ignore_for_file: file_names

import 'package:flutter/material.dart';

class WidgestPrincipal {
  final background = const BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment(-0.99, 0.55),
    colors: <Color>[
      Color(0xffe8521e),
      Color(0xfff7ab35),
    ],
  ));

  bottomNavigationBarItem(String texto, IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: texto,
    );
  }

  aboutAlert() {
    return const AlertDialog(
      title: Text('About'),
      content: Text(
          'Application for educational purposes. API developed by: midudev.\n\ndeveloped by Luis Roman(2023) ©'),
    );
  }
}
