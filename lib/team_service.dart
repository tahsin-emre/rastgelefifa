import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rastgelefifa/league.dart';
import 'package:rastgelefifa/team_model.dart';

class TeamService {
  static List<TeamModel> teamList = [
    TeamModel.manuel('besiktas', League.turkiye),
    TeamModel.manuel('galatasaray', League.turkiye),
    TeamModel.manuel('adanademir', League.turkiye),
    TeamModel.manuel('rizespor', League.turkiye),
    TeamModel.manuel('tottenham', League.ingiltere),
    TeamModel.manuel('astonvilla', League.ingiltere),
    TeamModel.manuel('chelsea', League.ingiltere),
    TeamModel.manuel('liverpool', League.ingiltere),
    TeamModel.manuel('mancity', League.ingiltere),
    TeamModel.manuel('manunited', League.ingiltere),
    TeamModel.manuel('westham', League.ingiltere),
    TeamModel.manuel('bayernmunih', League.almanya),
    TeamModel.manuel('dortmund', League.almanya),
    TeamModel.manuel('leverkusen', League.almanya),
    TeamModel.manuel('gladbach', League.almanya),
    TeamModel.manuel('leipzig', League.almanya),
    TeamModel.manuel('psg', League.fransa),
    TeamModel.manuel('lille', League.fransa),
    TeamModel.manuel('ol', League.fransa),
    TeamModel.manuel('om', League.fransa),
    TeamModel.manuel('porto', League.portekiz),
    TeamModel.manuel('benfica', League.portekiz),
    TeamModel.manuel('estoril', League.portekiz),
    TeamModel.manuel('sporting', League.portekiz),
    TeamModel.manuel('famalicao', League.portekiz),
    TeamModel.manuel('inter', League.italya),
    TeamModel.manuel('milan', League.italya),
    TeamModel.manuel('roma', League.italya),
    TeamModel.manuel('juventus', League.italya),
    TeamModel.manuel('hullcity', League.ingiltere2),
    TeamModel.manuel('fulham', League.ingiltere2),
    TeamModel.manuel('portsmouth', League.ingiltere3),
    TeamModel.manuel('walsall', League.ingiltere4),
    TeamModel.manuel('werderbremen', League.almanya2),
    TeamModel.manuel('turkgucu', League.almanya3),
    TeamModel.manuel('parisfc', League.fransa2),
    TeamModel.manuel('ajax', League.hollanda),
    TeamModel.manuel('goaheadeagles', League.hollanda),
    TeamModel.manuel('fortunasittard', League.hollanda),
    TeamModel.manuel('salzburg', League.avusturya),
    TeamModel.manuel('bodoglimt', League.norvec),
    TeamModel.manuel('lechpoznan', League.polonya),
    TeamModel.manuel('realmadrid', League.ispanya),
    TeamModel.manuel('bilbao', League.ispanya),
    TeamModel.manuel('sociedad', League.ispanya),
    TeamModel.manuel('malaga', League.ispanya2),
    TeamModel.manuel('lagalaxy', League.amerika),
    TeamModel.manuel('toronto', League.amerika),
  ];
  static var db = FirebaseFirestore.instance;

  static Future getMatches() async {
    await db.collection('matchs').get();
  }
}
