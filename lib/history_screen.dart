import 'package:flutter/material.dart';
import 'package:rastgelefifa/match_model.dart';
import 'package:rastgelefifa/match_service.dart';
import 'package:rastgelefifa/stats_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maç Geçmişi'),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const StatsScreen()))),
              icon: const Icon(Icons.bar_chart))
        ],
      ),
      body: buildBody,
    );
  }

  Widget get buildBody {
    return ListView(
      children: [...MatchService.matchList.map((e) => matchCard(e))],
    );
  }

  Widget matchCard(MatchModel e) {
    return Card(
      child: ListTile(
        onTap: () => scoreAlert(e),
        title: Text('${e.team1} ${e.team1score}--${e.team2} ${e.team2score}'),
        subtitle: Text(e.date.toDate().toString()),
      ),
    );
  }

  void scoreAlert(MatchModel model) {
    TextEditingController score1 = TextEditingController();
    TextEditingController score2 = TextEditingController();
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  textField(score1),
                  const SizedBox(height: 10),
                  textField(score2)
                ],
              ),
              actions: [
                ElevatedButton(
                    onPressed: () async {
                      model.team1score = int.tryParse(score1.text);
                      model.team2score = int.tryParse(score2.text);
                      await MatchService.addScore(model);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: const Text('Onayla'))
              ],
            ));
  }

  TextField textField(TextEditingController cont) {
    return TextField(
      controller: cont,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(border: OutlineInputBorder()),
    );
  }
}
