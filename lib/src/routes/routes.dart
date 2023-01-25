import 'package:flutter/material.dart';
import 'package:kings_league/src/routes/pages/principal/home_principal.dart';

Map<String, WidgetBuilder> pageRoutes() {
  return <String, WidgetBuilder>{
    'homePrincipal': (BuildContext context) => const HomePrincipal(),
  };
}
