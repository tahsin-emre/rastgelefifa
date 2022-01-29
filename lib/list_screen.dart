import 'package:flutter/material.dart';
import 'package:rastgelefifa/team_model.dart';
import 'package:rastgelefifa/team_service.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Takım Listesi')), body: buildBody);
  }

  Widget get buildBody {
    return ListView(
      children: [...TeamService.teamList.map((e) => teamCard(e))],
    );
  }

  Widget teamCard(TeamModel e) {
    return Card(
      child: ListTile(
        title: Text(e.name),
        subtitle: Text(e.league.name),
        leading: SizedBox(
            width: 50, height: 50, child: Image.asset('${e.name}.png')),
      ),
    );
  }
}
