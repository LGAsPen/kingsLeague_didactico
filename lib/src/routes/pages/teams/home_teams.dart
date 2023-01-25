import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kings_league/src/json/jsonTeams.dart';
import 'package:kings_league/src/routes/api/api_kings.dart';
import 'package:kings_league/src/routes/pages/principal/widgets/widgestPrincipal.dart';

class HomeTeams extends StatefulWidget {
  const HomeTeams({Key? key}) : super(key: key);

  @override
  State<HomeTeams> createState() => _HomeTeamsState();
}

class _HomeTeamsState extends State<HomeTeams> {
  ApiKings apiKings = ApiKings();
  WidgestPrincipal wp = WidgestPrincipal();

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
                      debugPrint('===== $index');
                    },
                    child: Container(
                      height: 70.0,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: DecorationImage(
                            image: NetworkImage(
                                '${wp.getColor('${jsonClass[index].name}')}')),
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
}
