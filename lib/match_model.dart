import 'package:cloud_firestore/cloud_firestore.dart';

class MatchModel {
  late String id;
  late Timestamp date;
  late String team1;
  late String team2;
  int? team1score;
  int? team2score;

  MatchModel.fromSnapshot(QueryDocumentSnapshot snapshot) {
    var data = snapshot.data() as dynamic;
    id = snapshot.id;
    date = data['date'];
    team1 = data['team1'];
    team2 = data['team2'];
    team1score = data['team1score'];
    team2score = data['team2score'];
  }

  MatchModel.fromManuel(this.id, this.date, this.team1, this.team2);
}
