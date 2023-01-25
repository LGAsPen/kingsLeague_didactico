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
    );
  }

  getColor(String colorName) {
    String url = "";
    switch (colorName) {
      case '1K FC':
        url = "https://kingsleague.pro/wp-content/uploads/2022/12/1k-bg.jpg";
        break;
      case 'El Barrio':
        url =
            "https://kingsleague.pro/wp-content/uploads/2022/12/barrio-bg.jpg";
        break;
      case 'Ultimate Móstoles':
        url =
            "https://kingsleague.pro/wp-content/uploads/2022/12/mostoles-bg.jpg";
        break;
      case 'Los Troncos FC':
        url =
            "https://kingsleague.pro/wp-content/uploads/2022/12/troncos-bg.jpg";
        break;
      case 'Saiyans FC':
        url =
            "https://kingsleague.pro/wp-content/uploads/2022/12/saiyans-bg.jpg";
        break;
      case 'Kunisports':
        url =
            "https://kingsleague.pro/wp-content/uploads/2022/12/kunisports-bg.jpg";
        break;
      case 'Jijantes FC':
        url =
            "https://kingsleague.pro/wp-content/uploads/2022/12/jijantes-bg.jpg";
        break;
      case 'Porcinos FC':
        url =
            "https://kingsleague.pro/wp-content/uploads/2022/12/porcinos-bg.jpg";
        break;
      case 'Rayo de Barcelona':
        url = "https://kingsleague.pro/wp-content/uploads/2022/12/rayo-bg.jpg";
        break;
      case 'XBUYER TEAM':
        url = "https://kingsleague.pro/wp-content/uploads/2022/12/xb-bg.jpg";
        break;
      case 'Aniquiladores FC':
        url =
            "https://kingsleague.pro/wp-content/uploads/2022/12/aniquiladores-bg.jpg";
        break;
      case 'PIO FC':
        url = "https://kingsleague.pro/wp-content/uploads/2022/12/pio-bg.jpg";
        break;
      default:
        url = "https://kingsleague.pro/wp-content/uploads/2022/12/pio-bg.jpg";
    }
    return url;
  }
}
