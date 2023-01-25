import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kings_league/src/routes/pages/principal/widgets/widgestPrincipal.dart';
import 'package:kings_league/src/routes/pages/statistics/home_leaderboard.dart';
import 'package:kings_league/src/routes/pages/teams/home_teams.dart';

class HomePrincipal extends StatefulWidget {
  const HomePrincipal({Key? key}) : super(key: key);

  @override
  State<HomePrincipal> createState() => _HomePrincipalState();
}

class _HomePrincipalState extends State<HomePrincipal> {
  WidgestPrincipal wp = WidgestPrincipal();
  int _selectedIndex = 0;

  final List<Widget> _widget = const [
    HomeTeams(),
    HomeTeams(),
    HomeLeaderBoard()
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            iconSize: 35.0,
            onPressed: () {
              showDialog(
                  context: context, builder: (context) => wp.aboutAlert());
            },
            icon: const Icon(
              Icons.info,
              color: Colors.white,
            ),
          )
        ],
        flexibleSpace: Container(
          decoration: wp.background,
        ),
      ),
      floatingActionButton: _bottomNavigationBar(size),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
        children: [
          Container(
            decoration: wp.background,
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.03),
                  height: size.height * 0.15,
                  child: SvgPicture.network(
                    'https://kingsleague.pro/wp-content/uploads/2022/12/KL_landscape.svg',
                    color: Colors.white,
                  ),
                ),
                _widget.elementAt(_selectedIndex)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomNavigationBar(Size size) {
    return SizedBox(
      width: size.width * 0.92,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: BottomNavigationBar(
          iconSize: 35.0,
          items: <BottomNavigationBarItem>[
            wp.bottomNavigationBarItem("Teams", Icons.groups_rounded),
            wp.bottomNavigationBarItem("Top-statistics", Icons.auto_graph),
            wp.bottomNavigationBarItem(
                "Leaderboard", Icons.format_list_numbered_rounded),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
