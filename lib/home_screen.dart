import 'package:flutter/material.dart';
import 'package:rastgelefifa/list_screen.dart';
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
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Rastgele FIFA'),
          actions: [
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ListScreen())),
                icon: const Icon(Icons.list))
          ],
        ),
        body: buildBody);
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
        SizedBox(
            width: 200, height: 200, child: Image.asset('${model?.name}.png')),
        Text(model?.name ?? ''),
        Text(model?.league.name ?? ''),
      ],
    );
  }
}
