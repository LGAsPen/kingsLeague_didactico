import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kings_league/src/routes/api/api_kings.dart';

class HomeLeaderBoard extends StatefulWidget {
  const HomeLeaderBoard({Key? key}) : super(key: key);

  @override
  State<HomeLeaderBoard> createState() => _HomeLeaderBoardState();
}

class _HomeLeaderBoardState extends State<HomeLeaderBoard> {
  final ApiKings _apiKings = ApiKings();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.55,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            leaderboard(size),
          ],
        ),
      ),
    );
  }

  Widget leaderboard(Size size) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: FutureBuilder(
        future: _apiKings.getLeaderboard(),
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return SizedBox(
              height: size.height * 0.5,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              ),
            );
          } else {
            var convertJson = jsonDecode(snapshot.data.toString()) as List;
            return DataTable(
              headingRowColor:
                  MaterialStateColor.resolveWith((states) => Colors.black87),
              decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(8.0)),
              headingTextStyle: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              columns: const [
                DataColumn(label: Text('Pos')),
                DataColumn(label: Text('Team')),
                DataColumn(label: Text('W')),
                DataColumn(label: Text('L'))
              ],
              rows: convertJson
                  .map((e) => DataRow(cells: <DataCell>[
                        DataCell(Text('${e['rank']}')),
                        DataCell(Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(right: 5.0),
                              alignment: Alignment.center,
                              child: SvgPicture.network(
                                '${e['team']['image']}',
                                height: size.height * 0.04,
                                placeholderBuilder: (BuildContext context) =>
                                    const CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                                width: size.width * 0.25,
                                child: Text('${e['team']['name']}')),
                          ],
                        )),
                        DataCell(Text('${e['wins']}')),
                        DataCell(Text('${e['losses']}')),
                      ]))
                  .toList(),
            );
          }
        }),
      ),
    );
  }
}
