import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kings_league/src/json/jsonTeams.dart';
import 'package:kings_league/src/routes/api/api_kings.dart';
import 'package:kings_league/src/routes/pages/teams/widgets.dart';

class HomeTeams extends StatefulWidget {
  const HomeTeams({Key? key}) : super(key: key);

  @override
  State<HomeTeams> createState() => _HomeTeamsState();
}

class _HomeTeamsState extends State<HomeTeams> {
  ApiKings apiKings = ApiKings();
  final WidgetTeam _widgetTeam = WidgetTeam();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.55,
      child: FutureBuilder(
        future: apiKings.getTeams(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var convertJson = jsonDecode(snapshot.data.toString()) as List;
            List<JsonTeams> jsonClass =
                convertJson.map((e) => JsonTeams.fromJson(e)).toList();
            return GridView.builder(
                shrinkWrap: true,
                itemCount: jsonClass.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: size.height * 0.14),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => alertTeam(
                              size,
                              '${jsonClass[index].presidentId}',
                              jsonClass[index].coach,
                              jsonClass[index].channel,
                              jsonClass[index].socialNetworks,
                              '${jsonClass[index].name}'));
                    },
                    child: Container(
                      height: 70.0,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: DecorationImage(
                            image: NetworkImage(
                                '${_widgetTeam.getColor('${jsonClass[index].name}')}')),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 8.0),
                            alignment: Alignment.center,
                            child: SvgPicture.network(
                              '${jsonClass[index].imageWhite}',
                              height: size.height * 0.07,
                              placeholderBuilder: (BuildContext context) =>
                                  const CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.21,
                            child: Text(
                              '${jsonClass[index].name}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          }
        },
      ),
    );
  }

  Widget alertTeam(Size size, String president, coach, channel, socialNetworks,
      String team) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      child: SizedBox(
        height: size.height * 0.2,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: size.height * 0.04,
              width: double.infinity,
              decoration: _widgetTeam.decorationAlertTeam,
              child: Text(
                team,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            _widgetTeam.richText(context, "President", president),
            _widgetTeam.richText(context, "Coach", coach),
            // Text(socialNetworks.toString())
          ],
        ),
      ),
    );
  }
}
