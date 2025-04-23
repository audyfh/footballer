import 'package:footballer/features/football/domain/entities/match_entity.dart';

class MatchesModel extends Matches {

   MatchesModel({
    required super.area,
    required super.awayTeam,
    required super.competition,
    required super.group,
    required super.homeTeam,
    required super.id,
    required super.lastUpdated,
    required super.matchday,
    required super.odds,
    required super.referees,
    required super.score,
    required super.season,
    required super.stage,
    required super.status,
    required super.utcDate,
   });

   MatchesModel.fromJson(Map<String, dynamic> json) {
    area = json['area'] != null ? new Area.fromJson(json['area']) : null;
    competition = json['competition'] != null
        ? new Competition.fromJson(json['competition'])
        : null;
    season =
        json['season'] != null ? new Season.fromJson(json['season']) : null;
    id = json['id'];
    utcDate = json['utcDate'];
    status = json['status'];
    matchday = json['matchday'];
    stage = json['stage'];
    group = json['group'] ?? "";
    lastUpdated = json['lastUpdated'];
    homeTeam = json['homeTeam'] != null
        ? new HomeTeam.fromJson(json['homeTeam'])
        : null;
    awayTeam = json['awayTeam'] != null
        ? new HomeTeam.fromJson(json['awayTeam'])
        : null;
    score = json['score'] != null ? new Score.fromJson(json['score']) : null;
    odds = json['odds'] != null ? new Odds.fromJson(json['odds']) : null;
    if (json['referees'] != null) {
      referees = <Referees>[];
      json['referees'].forEach((v) {
        referees!.add(new Referees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.area != null) {
      data['area'] = this.area!.toJson();
    }
    if (this.competition != null) {
      data['competition'] = this.competition!.toJson();
    }
    if (this.season != null) {
      data['season'] = this.season!.toJson();
    }
    data['id'] = this.id;
    data['utcDate'] = this.utcDate;
    data['status'] = this.status;
    data['matchday'] = this.matchday;
    data['stage'] = this.stage;
    data['group'] = this.group;
    data['lastUpdated'] = this.lastUpdated;
    if (this.homeTeam != null) {
      data['homeTeam'] = this.homeTeam!.toJson();
    }
    if (this.awayTeam != null) {
      data['awayTeam'] = this.awayTeam!.toJson();
    }
    if (this.score != null) {
      data['score'] = this.score!.toJson();
    }
    if (this.odds != null) {
      data['odds'] = this.odds!.toJson();
    }
    if (this.referees != null) {
      data['referees'] = this.referees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}