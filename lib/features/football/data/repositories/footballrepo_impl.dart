import 'package:dartz/dartz.dart';
import 'package:footballer/core/error/failure.dart';
import 'package:footballer/core/error/server_exception.dart';
import 'package:footballer/features/football/data/remote/football_remote.dart';
import 'package:footballer/features/football/domain/entities/match_entity.dart';
import 'package:footballer/features/football/domain/repositories/footballrepo.dart';

class FootballRepoImpl implements FootBallRepo {

  final FootballRemote footballRemote;

  FootballRepoImpl({required this.footballRemote});
  @override
  Future<Either<Failure, List<Matches>>> getTodayMatches() async {
    try {
        final res = await footballRemote.getTodayMatches();
        return right(res);
    } on ServerException catch (e){
        throw(left(Failure(e.message)));
    }
  }

}