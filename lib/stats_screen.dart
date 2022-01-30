import 'package:flutter/material.dart';
import 'package:rastgelefifa/match_service.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  int team1goals = 0;
  int team2goals = 0;
  int team1wins = 0;
  int team2wins = 0;
  int draws = 0;

  @override
  void initState() {
    super.initState();
    calculate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('İstatistikler'),
      ),
      body: buildBody,
    );
  }

  Widget get buildBody {
    return ListView(
      children: [
        card(team1wins.toString(), 'Tahsin kazandı'),
        card(team2wins.toString(), 'Burak kazandı'),
        card(draws.toString(), 'Berabere'),
        card(team1goals.toString(), 'Tahsin gol attı'),
        card(team2goals.toString(), 'Burak gol attı'),
      ],
    );
  }

  Widget card(String data, String title) {
    return Card(
      child: ListTile(
        title: Text(data),
        subtitle: Text(title),
      ),
    );
  }

  void calculate() {
    team1wins = MatchService.matchList
        .where((element) => element.team1score != null)
        .where((element) => element.team1score! > element.team2score!)
        .length;
    team2wins = MatchService.matchList
        .where((element) => element.team1score != null)
        .where((element) => element.team2score! > element.team1score!)
        .length;
    draws = MatchService.matchList
        .where((element) => element.team1score != null)
        .where((element) => element.team1score! == element.team2score!)
        .length;
    for (var item in MatchService.matchList
        .where((element) => element.team1score != null)) {
      team1goals += item.team1score!;
      team2goals += item.team2score!;
    }
  }
}
