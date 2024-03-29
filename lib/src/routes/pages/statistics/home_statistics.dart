import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kings_league/src/json/jsonMVP.dart';
import 'package:kings_league/src/routes/api/api_kings.dart';
import 'package:kings_league/src/routes/pages/statistics/widgets.dart';

class HomeStatistics extends StatefulWidget {
  const HomeStatistics({Key? key}) : super(key: key);

  @override
  State<HomeStatistics> createState() => _HomeStatisticsState();
}

class _HomeStatisticsState extends State<HomeStatistics> {
  final ApiKings _apiKings = ApiKings();
  final StatisticsWidget _statisticsWidget = StatisticsWidget();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.55,
      child: SingleChildScrollView(
        child: Column(
          children: [
            carouselMVP(size),
            tableTopScorers(size),
          ],
        ),
      ),
    );
  }

  Widget carouselMVP(Size size) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.03),
      child: FutureBuilder(
          future: _apiKings.getStatistics(),
          builder: ((context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              var convertJson = jsonDecode(snapshot.data.toString()) as List;
              List<JsonMvp> jsonClass =
                  convertJson.map((e) => JsonMvp.fromJson(e)).toList();

              return CarouselSlider.builder(
                itemCount: jsonClass.length,
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                ),
                itemBuilder:
                    (BuildContext contex, int indexIem, int indexPage) =>
                        Container(
                  width: size.width * 0.90,
                  decoration: _statisticsWidget.decoration,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: size.height * 0.03,
                        decoration: _statisticsWidget.mvpDecoration,
                        child: Text(
                          'MVP',
                          style: _statisticsWidget.styleMVP,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: size.width * 0.3,
                                child: Text(
                                  jsonClass[indexIem].playerName,
                                  style: _statisticsWidget.stylePlayerName,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, bottom: 5.0),
                                child: Image.asset(
                                  'assets/icons/png/ronaldo.png',
                                  height: size.width * 0.17,
                                ),
                              ),
                              SizedBox(
                                  width: size.width * 0.3,
                                  child: Text(
                                    jsonClass[indexIem].team,
                                    style: _statisticsWidget.styleTeam,
                                    textAlign: TextAlign.center,
                                  )),
                            ],
                          ),
                          SvgPicture.network(
                            jsonClass[indexIem].image,
                            height: size.width * 0.35,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          })),
    );
  }

  Widget tableTopScorers(Size size) {
    return FutureBuilder(
        future: _apiKings.getStatisticsTopScorers(),
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            var convertJson = jsonDecode(snapshot.data.toString()) as List;

            return Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: size.width * 0.85,
                  height: size.height * 0.05,
                  margin: const EdgeInsets.only(top: 15.0),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12))),
                  child: const Text(
                    'Top Scorers',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.85,
                  child: DataTable(
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.2)),
                    columns: const [
                      DataColumn(label: Text('Team')),
                      DataColumn(label: Text('Player name')),
                      DataColumn(label: Text('Goals')),
                    ],
                    rows: convertJson
                        .map(
                          (e) => DataRow(cells: <DataCell>[
                            DataCell(SvgPicture.network(
                              e['image'],
                              height: 30.0,
                            )),
                            DataCell(Text(e['playerName'])),
                            DataCell(Text('${e['goals']}')),
                          ]),
                        )
                        .toList(),
                  ),
                ),
              ],
            );
          }
        }));
  }
}
