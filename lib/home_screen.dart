import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rastgelefifa/history_screen.dart';
import 'package:rastgelefifa/list_screen.dart';
import 'package:rastgelefifa/match_model.dart';
import 'package:rastgelefifa/match_service.dart';
import 'package:rastgelefifa/team_model.dart';
import 'package:rastgelefifa/team_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TeamModel? teamModel1;
  TeamModel? teamModel2;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => Navigator.canPop(context),
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Rastgele FIFA'),
            actions: [
              IconButton(
                  onPressed: () async {
                    await MatchService.getMatches();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HistoryScreen()));
                  },
                  icon: const Icon(Icons.history)),
              IconButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ListScreen())),
                  icon: const Icon(Icons.list))
            ],
          ),
          body: buildBody),
    );
  }

  Widget get buildBody {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  nameBar('Tahsin'),
                  teamBar(teamModel1),
                ],
              ),
            ),
            const VerticalDivider(),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  nameBar('Burak'),
                  teamBar(teamModel2),
                ],
              ),
            ),
          ],
        ),
        ElevatedButton(
            onPressed: () => hadiRastgele(), child: const Text('Rastgele Seç'))
      ],
    );
  }

  void hadiRastgele() async {
    TeamService.teamList.shuffle();
    teamModel1 = TeamService.teamList.first;
    TeamService.teamList.shuffle();
    teamModel2 = TeamService.teamList.first;
    TeamService.teamList.shuffle();
    await MatchService.addMatch(MatchModel.fromManuel(
        '', Timestamp.now(), teamModel1!.name, teamModel2!.name));
    setState(() {});
  }

  Widget nameBar(String name) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Text(
        name,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget teamBar(TeamModel? model) {
    return Column(
      children: [
        model == null
            ? Container()
            : SizedBox(
                width: 200,
                height: 200,
                child: Image.asset('${model.name}.png')),
        Text(model?.name ?? ''),
        Text(model?.league.name ?? ''),
      ],
    );
  }
}
