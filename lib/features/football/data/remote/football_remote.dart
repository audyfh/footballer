import 'package:dio/dio.dart';
import 'package:footballer/core/error/server_exception.dart';
import 'package:footballer/features/football/data/model/matches_model.dart';

abstract interface class FootballRemote {
  Future<List<MatchesModel>> getTodayMatches();
}

class FootballRemoteImpl implements FootballRemote {
  final Dio dio;

  FootballRemoteImpl({required this.dio});

  @override
  Future<List<MatchesModel>> getTodayMatches() async {
    try {
      final res = await dio.get(
        'https://api.football-data.org/v4/matches'
      );
      final matches = res.data['matches'] as List<dynamic>;
      return matches.map((item) => MatchesModel.fromJson(item)).toList();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
