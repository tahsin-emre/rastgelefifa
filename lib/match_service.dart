import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rastgelefifa/match_model.dart';

class MatchService {
  static var db = FirebaseFirestore.instance;
  static List<MatchModel> matchList = [];

  static Future getMatches() async {
    matchList.clear();
    await db
        .collection('matches')
        .orderBy('date', descending: true)
        .get()
        .then((value) {
      for (var item in value.docs) {
        matchList.add(MatchModel.fromSnapshot(item));
      }
    });
  }

  static Future addMatch(MatchModel model) async {
    await db.collection('matches').add({
      'date': model.date,
      'team1': model.team1,
      'team2': model.team2,
    }).then((value) => model.id = value.id);
  }

  static Future addScore(MatchModel model) async {
    await db.collection('matches').doc(model.id).update({
      'team1score': model.team1score,
      'team2score': model.team2score,
    });
  }
}
