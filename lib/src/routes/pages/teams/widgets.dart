import 'package:flutter/material.dart';

class WidgetTeam {
  final decorationAlertTeam = const BoxDecoration(
      color: Colors.orangeAccent,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12), topRight: Radius.circular(12)));

  Widget richText(BuildContext context, String text, String text2) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 3.0),
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
                text: '$text : ',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 17.0)),
            TextSpan(text: text2, style: const TextStyle(fontSize: 16.0)),
          ],
        ),
      ),
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
